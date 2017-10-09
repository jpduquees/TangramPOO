//Se crea la clase boton que depende de shape
public class Button extends Shape{
  //Se inician las variables a usar que solo son el texto del boton y la escala del mismo
   protected String buttonTxt=""; 
   protected float txtscl=1;
   
   //"getter" de la variable que da la escala del texto
   protected float textscale(){
     return txtscl;
   }
   //"setter" de la variable que da la escala del texto
   protected void setTextscale(float ts){
     txtscl=ts;
   }
   //"getter" de la cadena que da el contenido del texto
   protected String buttonText(){
     return buttonTxt;
   }
   //"setter" de la cadena que da el contenido del texto
   protected void setbuttonText(String tx){
     buttonTxt=tx;
   }
   //Como la clase extiende a shape esta debe definir que va a dibujar debido al metodo abstracto en shape llamado drawShape presentado a continuacion
  protected void drawShape(){
    //Especificaiones del coton como su color tamaño, cabe aclarar que la ubicación del mismo esta definida por la funcion setTranslation definida en la clase Shape
    rectMode(CENTER);
    rect(0,0,150,50);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(txtscl*20);
    text(buttonTxt,0,0);
  }
  //Funcion que funciona como un hipervinculo envia al menu principal al presionar el boton indicado
  public void pressedMenu(){
    if(chooseGet==menu && contador==false){
      contadorNiveles =0;
      setupFichas();
    }
  }
  //Funcion que funciona como un hipervinculo envia al menu de niveles al presionar el boton indicado
  public void pressedNivel(){
    if(chooseGet==lvl && contador==false){
      contadorNiveles =1;
      setupFichas();
    }
  }
  //Funcion que funciona como un hipervinculo envia al menu principal desde los niveles al presionar el boton indicado
  public void pressedMenuLvl(){
    if(chooseGet==menuLv && contador==false){
      contadorNiveles = 0;
      setupFichas();
    }
  }
  //Funcion que funciona como un hipervinculo envia al siguiente nivel al presionar el boton indicado
  public void pressedNextLvl(){
    if(chooseGet==nextLvl && contador==false){
      contadorNiveles += 1;
      setupFichas();
    }
  }
  //Funcion que funciona como un reiniciador del nivel, retorna todas las fichas a la posicion original
  public void pressedReset(){
    if(chooseGet==reset && contador==false){
      setupFichas();
    }
  }
  //Funcion que funciona como un hipervinculo envia al menu de niveles desde el menu principal al presionar el boton indicado
  public void pressedJugar(){
    if(chooseGet==jugar && contador==false){
      contadorNiveles = 1;
    }
  }
  //Funcion que funciona como un hipervinculo envia al menu de instrucciones desde el menu principal al presionar el boton indicado
  public void pressedInstrucciones(){
    if(chooseGet==instrucciones && contador==false){
      contadorNiveles = 2;
    }
  }
  //Funcion que funciona como un hipervinculo envia al menu de creditos desde el menu principal al presionar el boton indicado
  public void pressedCreditos(){
    if(chooseGet==creditos && contador==false){
      contadorNiveles = 3;
    }
  }
}