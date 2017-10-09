//Se define la clase derivada de la clase shape
public class Rect extends Shape {
  //se deine la variable lado que es el largo de cada lado del rectangulo.
  protected float lado = ((sqrt(2)/2)*150);
  //Se define el metodo abstracto de la clase Shape, para este caso es un cuadrado.
  protected void drawShape(){
    rectMode(CENTER);
    rect(0,0,lado,lado);
  }
}