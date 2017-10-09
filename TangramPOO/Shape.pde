//Se declara la clase abstracta shape
public abstract class Shape {
  //se definen las variables basicas para el funcionamiento de la pieza, 
  //estas primeras son los enteros que definen si la ficha tiene efecto espejo, que tanta rotación tiene, y el grosor de su borde
  protected int espejo, rotation, strok=1;
  //estos vectores tienen la posicion de la ficha, el punto desde el que se selecciono y el punto medio para su rotación
  protected PVector translation=new PVector (0,0),puntoSel = new PVector(0,0), med= new PVector(0,0); // null 
  //Numero flotante que define la escala de la figura
  protected float scaling=1;// 0
  //variables que definen el color de la ficha y de su borde
  protected color c = color (0),strokecolor;// 0??
  //booleanos que determinan, si una ficha se esta moviendo y si una ficha se esta moviendo con el teclado.
  protected boolean move,movek, mk;
  
  //"getter" de la variable flotante strok
  public float strok(){
    return strok;
  }
  //"setter" de la variable flotante strok
  public void setStrok (int str){
    strok=str;
  }
  //"getter" del color strokecolor
  public color strokecol(){
    return strokecolor;
  }
  //"setter" del color strokecolor
  public void setStrokeColor (color str){
    strokecolor=str;
  }
  //"getter" de la variable flotante rotation
  public float rotation(){
    return rotation;
  }
  //"setter" de la variable flotante rotation
  public void setRotation (int rot){
    rotation=rot;
  }
  //"getter" de la variable flotante scaling
  public float scaling(){
    return scaling;
  }
  //"setter" de la variable flotante scaling
  public void setScaling (float sca){
    scaling=sca;
  }
  //"getter" del vector med
  public PVector med(){
    return med;
  }
  //"setter" del vector med
  public void setMed (PVector medi){
    med=medi;
  }
  //"getter" del vector translation
  public PVector translation(){
    return translation;
  }
  //"setter" del vector translation
  public void setTranslation (PVector t){
    translation =t;
  }
  //"getter" del color col
  public color col(){
    return c;
  }
  //"getter" del color col
  public void setColor (color col){
    c=col;
  }
  //constructor de la clase Shape que da valores a las variables principales segun el set y el get
  public Shape(){
    setTranslation(this.translation);
    setColor(c);
    setRotation(this.rotation);
    setScaling(this.scaling);
    setStrok(this.strok);
    setMed(this.med);
  }
  //declaracion del metodo abstracto que debera ser declarado en cada subclase
  protected  abstract void drawShape();
  
  /*Metodo draw que dibujara en bucle la ficha rellenando con el color c, rellenando el borde con el color strokecolor y su ancho con el valor de strok define una translacion 
  hasta el punto medio de la ficha para realizar la rotacion dependiente del valor de rotate y la escala dependiente del calor de scaling, devuelve el origen a (0,0),
  para luego enviar el origen a la coordenada desde donde se pintara la figura y acabara el proceso de dibujo*/
  public void draw(){
    fill(c);
    pushMatrix();
    pushStyle();
    stroke(strokecolor);
    strokeWeight(strok);
    translate(this.translation.x+med.x,this.translation.y+med.y);
    scale(scaling);
    rotate(this.rotation *(PI/4));
    translate(-(this.translation.x+this.med.x),-(this.translation.y+this.med.y));
    translate(this.translation.x,this.translation.y);
    drawShape();
    popStyle();
    popMatrix();
  }
  /*Metodo seleccion que define si una ficha fue seleccionada y define su posicion dependiente del desplazamiento del mouse
  esto mediante un simple metodo que guarda la posicion desde la cual fue seleccionada y determine el cambio y dibuje desde ese cambio*/
  public void seleccion(){
    if(mousePressed && chooseGet==this.c && contador==false){
      this.move=true;
      contador=true;
    }
    if(this.move==true){
      this.translation.x=mouseX-puntoSel.x;
      this.translation.y=mouseY-puntoSel.y;
    }
  }
  //Metodo mousePressed que es llamado mientras cualquier boton del mouse sea presionado
  public void mousePressed(){
    //Se define el valor inicial de la variable que determina la coordenada desde la cual fue seleccionado el objeto
    this.puntoSel.x=mouseX-translation.x;
    this.puntoSel.y=mouseY-translation.y;
  }
  //Metodo mousePressed que es llamado cuando todos los botones esten sin presionar
  public void mouseReleased(){
    //Hace que la variable move sea falso para soltar la ficha
    this.move=false;
  }
  //Metodo keyPressed que es llamado cuando cualquier tecla del teclado sea presionada
  public void keyPressed(){
    //cambia la rotación de la ficha movida hacia derecha o izquierda dependiendo del boton presionado
    if(this.move||(!mousePressed && this.movek)){
      if(key=='Q' ||key=='q'){
        this.rotation-=1;
      }
      if(key=='E' ||key=='e'){
        this.rotation+=1;
      }
    }
    //determina si el trapecio tiene efecto espejo o no
    if(key=='w'|| key=='W'){
      if(espejo==0){
        this.espejo=1;
      }else{
        this.espejo=0;
      }
    }
    //determina si el borde es ancho la pieza se esta moviendo con el teclado
    if(this.strok==3){
      mk=true;
    }else{
      mk=false;
    }
    //Genera que al ser presionada cada una de las flechas la ficha determinada por el borde se mueva segun la direccion deseada
    if(mk){
      this.movek=true;
      if(key==CODED){
        switch(keyCode){
          case UP:
          this.translation.y -=4;
          break;
          case DOWN:
          this.translation.y +=4;
          break;
          case LEFT:
          this.translation.x -=4;
          break;
          case RIGHT:
          this.translation.x +=4;
          break;
        }
      }
    }else{
      this.movek=false;
    }
  }
  //Metodo llamado para realizar la rotacion con la rueda del mouse
  public void mouseWheel(MouseEvent event){
    float e = event.getCount();
    if(this.move){
      this.rotation +=e;
    }
  }
}