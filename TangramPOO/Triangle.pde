//Se define la clase derivada de la clase shape
public class Triangle extends Shape {
  //Se define el metodo abstracto definido en Shape esta clase para dibujar un triangulo
  protected void drawShape(){
    triangle(0,0,0,300,150,150);
    //Se define el punto medio desde el cual sera rotada la pieza
    setMed(new PVector(75,150));
  }
}