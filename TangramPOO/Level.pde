//se inicia la clase nivel
class Level{
  //para crear los niveles es necesario crear las fichas y ubicarlas de tal forma que formen la figura deseada, por tanto se crean 7 fichas
  protected Shape[] nivel= new Shape[7];
  /*Constructor de la clase que pide como parametros la posicion de cada ficha y su rotacion, adicionalemtente un ultimo parametro que dice si el trapecio tiene efecto espejo o no,
  los datos se dan en el siguiente orden
    -Cuadrado
    -Trapecio
    -Triangulo Medio
    -triangulo Pequeño
    -triangulo Pequeño
    -Triangulo Mayor
    -Triangulo Mayor
  */
  Level(PVector a, int b,PVector c, int d,PVector e, int f,PVector g, int h,PVector j, int k,PVector l, int m,PVector n, int o,int trap){
    //Declaradores de que tipo de figura es cada shape
    nivel[0]=new Rect();
    nivel[1]=new Trapecio();
    int i;
    for(i=2; i<nivel.length;i++){
      nivel[i]=new Triangle();
    }
    //Da los valores de rotacion, espejo y posicion a cada una de las fichas
    nivel[1].espejo=trap;
    nivel[3].setScaling((sqrt(2)/2));
    nivel[4].setScaling(0.5);
    nivel[5].setScaling(0.5);
    nivel[0].setTranslation(a);
    nivel[0].setRotation(b);
    nivel[1].setTranslation(c);
    nivel[1].setRotation(d);
    nivel[2].setTranslation(n);
    nivel[2].setRotation(o);
    nivel[3].setTranslation(e);
    nivel[3].setRotation(f);
    nivel[4].setTranslation(g);
    nivel[4].setRotation(h);
    nivel[5].setTranslation(j);
    nivel[5].setRotation(k);
    nivel[6].setTranslation(l);
    nivel[6].setRotation(m);
    //Metodos par declarar el color, el color del borde y el dibujo de cada figura
    for(i=0;i<nivel.length;i++){
    nivel[i].setColor(blanco);
    nivel[i].setStrokeColor(blanco);
    nivel[i].draw();
    }
  }
}