//Se define la clase derivada de la clase shape
public class Trapecio extends Shape {
  /*se define el metodo abstracto de la clase Shape esta vez con la particularidad de que se dibujara de dos formaas diferentes,
  esto dependiendo si el efecto espejo del trapecio esta activado o no*/
  protected void drawShape(){
    if(espejo==0){
    quad(0,0,75,75,75,225,0,150);
  }
   if(espejo==1){
    quad(0,75,0,225,75,150,75,0);
  }
  //Define el punto medio de la figura desde el cual sera rotado
    setMed(new PVector((75/2),(225/2)));
  }
}