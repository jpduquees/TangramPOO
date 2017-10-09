//Creacion de las variables a usar en el codigo, cabe recalcar la variable nivel que define la silueta en cada nivel, la variable botones definida en cada setup de botones, las miniaturas y, los colores
Shape[] shapes;
Button[] botones;
Level niv;
protected PImage fondo, nivel1, nivel2, nivel3, nivel4, nivel5, nivel6, nivel7, nivel8, nivel9, nivel10;
protected color chooseGet, blanco =color(255), menu =color(15, 255, 50), nextLvl=color(10, 255, 50), lvl=color(255, 128, 1), menuLv=color(51, 153, 254), jugar=color(14, 255, 50), instrucciones=color (240, 12, 8), creditos= color(15, 4, 250),reset=color(243,255,57);
protected boolean contador, pulsador;
protected int contadorVictoria, moveK, moveKp, contadorNiveles;

//La siguiente funcion crea los 3 botones en el menu a partir de la clase boton
void setupBotonesMenu() {
  //Define la cantidad de botones y dice a que clase pertenecen
  botones = new Button[3];
  int i;
  for (i=0; i<botones.length; i++) {
    botones[i]= new Button();
  }
  //Define la posicion donde estos se encontraran
  botones[0].setTranslation(new PVector(500, 75));
  botones[1].setTranslation(new PVector(400, 150));
  botones[2].setTranslation(new PVector(600, 150));
  //Se establece el color en los botones como ya fueron definidos arriba del setup
  botones[0].setColor(jugar);
  botones[1].setColor(instrucciones);
  botones[2].setColor(creditos);
  //Define el texto en los botones
  botones[0].setbuttonText("JUGAR");
  botones[1].setTextscale(0.9);
  botones[1].setbuttonText("INSTRUCCIONES");
  botones[2].setbuttonText("CREDITOS");
  //Ejecuta la funcion que permite que los botones se dibujen
  for (i=0; i<botones.length; i++) {
    botones[i].draw();
  }
}
//Funcion que define los botones en los niveles
void setupBotonesNivel() {
  //Define la cantidad de botones y dice a que clase pertenecen, tambien el segundo "for" define las posiciones de cada uno y define que se repetiran cada 170 pixeles en x 
  botones= new Button[4];
  int i;
  for (i=0; i<botones.length; i++) {
    botones[i]= new Button();
  }
  for (i=0; i<botones.length-1; i++) {
    botones[i].setTranslation(new PVector((330+(170*i)), 550));
  }
  botones[3].setTranslation(new PVector (160,550));
  //Define los colores en cada boton ya definidos arriba del setup
  botones[0].setColor(lvl);
  botones[1].setColor(nextLvl);
  botones[2].setColor(menuLv);
  botones[3].setColor(reset);
  //Define el texto en los botones
  botones[0].setbuttonText("NIVELES");
  botones[1].setbuttonText("SIGUIENTE NIVEL");
  botones[1].setTextscale(0.8);
  botones[2].setbuttonText("MENU");
  botones[3].setbuttonText("RESET");
  //Define la ejecucion del dibujo de ellos, sin embargo se nota que el boton[1] no se ejecuta aun, este boton se ejecuta en el draw cuando se detecta que el jugador ganó
  botones[0].draw();
  botones[2].draw();
  botones[3].draw();
}
//Define una funcion que crea un unico boton menu usado en las interfaces de niveles creditos y instrucciones
void setupBotonesMenugral() {
  //Define la cantidad de botones y dice a que clase pertenecen
  botones= new Button[1];
  botones[0]= new Button();
  //Establece el color del botón al ya establecido arriba del setup
  botones[0].setColor(menu);
  //define la posicion de este botón pero por estetica vemos que en la interfaz de instrucciones el boton se veria mal ubicado en esa posicion por lo que un if determina si estamos en esa interfaz donde pintarlo
  botones[0].setTranslation(new PVector(500, 550));
  if (contadorNiveles==2) {
    botones[0].setTranslation(new PVector(850, 90));
  }
  //Define el texto en el boton
  botones[0].setbuttonText("MENU");
  //Dibuja el boton
  botones[0].draw();
}
//Crea una funcion que define la ubicaión de las figuras en juego y sus utilidades.
void setupFichas() {
  int i;
  //Define la cantidad de figuras, se crean dos de mas puesto que algunos for crean conflicto pues no entienden la longitud del for
  shapes= new Shape[8];
  //Definen a que subclase pertenece cada figura
  shapes[0]= new Rect();
  shapes[1]= new Trapecio();
  for (i=2; i<shapes.length; i++)
    shapes[i]=new Triangle();
  //Define la posicion inicial de cada una de las fichas
  shapes[0].setTranslation(new PVector (760, 325));
  shapes[1].setTranslation(new PVector (735, 25));
  shapes[2].setTranslation(new PVector (835, 15));
  shapes[3].setTranslation(new PVector (871, 395));
  shapes[4].setTranslation(new PVector (800, -105));
  shapes[5].setTranslation(new PVector (715, 330));
  shapes[6].setTranslation(new PVector (835, 225));
  //Define la rotación inicial de cada una de las fichas
  shapes[0].setRotation(0);
  shapes[1].setRotation(0);
  shapes[2].setRotation(4);
  shapes[3].setRotation(1);
  shapes[4].setRotation(5);
  shapes[5].setRotation(1);
  shapes[6].setRotation(0);
  //Como la clase triangulo tiene un tamaño predeterminado establecemos el tamaño de cada uno de los 3 triangulos de tamaño diferente
  shapes[3].setScaling((sqrt(2)/2));
  shapes[4].setScaling(0.5);
  shapes[5].setScaling(0.5);
  /*Define el color de cada una de las fichas; aca se puede notar que:
   el shape[0] es el cuadrado; 
   [1] es el trapecio; 
   [2] Triangulo mayor naranja;
   [3] Triangulo mediano;
   [4] Triangulo menor morado;
   [5] Triangulo mneor azul;
   [6] Triangulo mayor verde*/
  shapes[0].setColor(color(255, 0, 0));
  shapes[1].setColor(color(0, 0, 204));
  shapes[2].setColor(color(255, 128, 0));
  shapes[3].setColor(color(255, 255, 51));
  shapes[4].setColor(color(127, 0, 255));
  shapes[5].setColor(color(51, 153, 255));
  shapes[6].setColor(color(0, 204, 102));
}

void setup() {
  //define el tamaño del campbas
  size(1000, 599);
  //Ejecuta la funcion de posicion inicial de las fichas
  setupFichas();
  //Define o llama a las imagenes guardadas en el data para definir el fondo y las miniaturas de los niveles
  fondo = loadImage("fondo1.jpg");
  nivel1= loadImage("miniatura lvl1.png");
  nivel2= loadImage("miniatura lvl2.png");
  nivel3= loadImage("miniatura lvl3.png");
  nivel4= loadImage("miniatura lvl4.png");
  nivel5= loadImage("miniatura lvl5.png");
  nivel6= loadImage("miniatura lvl6.png");
  nivel7= loadImage("miniatura lvl7.png");
  nivel8= loadImage("miniatura lvl8.png");
  nivel9= loadImage("miniatura lvl9.png");
  nivel10= loadImage("miniatura lvl10.png");
}
//Funcion que se ejecuta en bucle y permite dibujar los objetos en la pantalla
void draw() {
  //Variable que detecta el color del pixel debajo del mouse
  chooseGet=color(get(mouseX, mouseY));
  //Define la imagen de fondo en todos los niveles
  background (fondo);
  //Define las funciones a ejecutar en el menu
  if (contadorNiveles==0) {
    //Ejecuta la funcion ya especificada de los 3 botones en el menu
    setupBotonesMenu();
    //Escribe el letrero "tangram" en el menu
    pushMatrix();
    textSize(100);
    fill (240);
    textAlign(CENTER);
    text("Tangram", 500, 300);
    fill(10);
    popMatrix();
  }
  //Define las funciones a ejecutar en la interfaz de niveles
  if (contadorNiveles==1) {
    //Ejecuta la funcion ya definida del boton general
    setupBotonesMenugral();
    //Define el color del texto y escribe el leterero "NIVELES"   en est pantalla
    fill (240);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("NIVELES", 500, 80);
    //Llama a las imagenes ya definidas, les da una escala y una posicion inicial
    pushMatrix();
    scale(0.6);
    image (nivel1, 225, 250);
    image (nivel2, 535, 250);
    image (nivel3, 825, 250);
    image (nivel4, 1075, 250);
    image (nivel5, 1325, 250);
    image (nivel6, 225, 559);
    image (nivel7, 535, 559);
    image (nivel8, 825, 559);
    image (nivel9, 1075, 559);
    image (nivel10, 1325, 559);
    popMatrix();
    //Escribe el texto que dice que nivel esta en la imagen de arriba
    textSize(20);
    fill (240);
    textAlign(LEFT, CENTER);
    text("Nivel 1", 165, 280);
    text("Nivel 2", 345, 280);
    text("Nivel 3", 530, 280);
    text("Nivel 4", 670, 280);
    text("Nivel 5", 830, 280);
    text("Nivel 6", 165, 465);
    text("Nivel 7", 345, 465);
    text("Nivel 8", 530, 465);
    text("Nivel 9", 670, 465);
    text("Nivel 10", 830, 465);
    //Establece las zonas a presionar para escoger el nivel en el menu de niveles.
    int i;
    for(i=0;i<5;i++){
      //Niveles del 1 al 5
      if(mouseX>=140+(i*160)&&mouseX<=255+(i*160) && mouseY>=155 && mouseY<=285 && mousePressed && contador==false){
       contadorNiveles=4+i; 
      }
      //Niveles del 6 al 10
      if(mouseX>=140+(i*160)&&mouseX<=255+(i*160) && mouseY>=325 && mouseY<=470 && mousePressed && contador==false){
       contadorNiveles=9+i; 
      }
    }
  }
  //Establece las funciones a ejecutar en el menu de instrucciones
  if (contadorNiveles==2) {
    //Ejecuta la funcion del boton general ya especificada arriba.
    setupBotonesMenugral();
    //Define el texto de la pagina
    fill (240);
    textSize(65);
    textAlign( CENTER);
    text("INSTRUCCIONES", 500, 110);
    textAlign(LEFT, CENTER);
    textSize(25);
    fill(240);
    text("OBJETIVO", 20, 165);
    textSize(15);
    fill (240);
    text("¡Bienvenido!, el tangram es un juego de procedencia china que consta de 7 fichas que deben ser colocadas en cierta forma", 20, 200);
    text("para formar figuras especificas, en este juego tendras que mover y rotar las fichas para cubrir la silueta negra que hay en cada", 20, 230);
    text("nivel al llenar la figura activaras un boton para que pases al siguiente nivel y tendras dos botones para poder ir al menu", 20, 260);
    text("y al menu de niveles.", 20, 290);
    textSize(25);
    fill(240);
    text("MOVIMIENTO", 20, 325);
    textSize(15);
    fill (240);
    text("Para mover una ficha puedes seleccionarla con el mouse y moverla, tambien tienes la posibilidad de moverla con el teclado,", 20, 360);
    text("para escoger la pieza que estas moviendo con el teclado presiona la ficha 'TAB', en la parte superior derecha veras", 20, 390);
    text("cual ficha estas moviendo, una vez seleccionada puedes mover la ficha con las flechas.", 20, 420);
    textSize(25);
    fill(240);
    text("ROTACIÓN Y EFECTO ESPEJO", 20, 455);
    textSize(15);
    fill (240);
    text("Para rotar una ficha si la estas moviendo con el mouse gira la ficha con la rueda o presiona 'q' para girarla hacia", 20, 490);
    text("el lado izquierdo y 'e' para la derecha si no tienes ninguna ficha seleccionada la ficha que estes moviendo con el", 20, 520);
    text("teclado rotara de la misma manera con 'q' y 'e', para girar como un 'efecto espejo' el paralelogramo azul presiona 'w'.", 20, 550);
  }
  //Define las funciones a ejecutar en el menu de creditos
  if (contadorNiveles==3) {
    //Ejecuta la funcion del boton de menu general ya especificada arriba
    setupBotonesMenugral();
    //Se define el texto en la pagina
    fill (240);
    textSize(100);
    textAlign(CENTER);
    text("CREDITOS", 500, 80);
    textAlign(LEFT, CENTER);
    textSize(25);
    fill(240);
    textAlign(CENTER);
    text("DESARROLLADOR", 500, 215);
    textSize(15);
    fill (240);
    text("Juan Pablo Duque Escobar", 500, 250);
    textSize(25);
    fill(240);
    text("COLABORADORES", 500, 325);
    textSize(15);
    fill (240);
    text("Andres Felipe Medina Ealo", 500, 360);
    text("Juan Diego Plaza Gomez", 500, 390);
    textSize(25);
    fill(240);
    text("IMAGEN DE FONDO", 500, 455);
    textSize(15);
    fill (240);
    text("Universidad Nacional de Colombia", 500, 480);
    textAlign(LEFT, CENTER);
  }
  /*Los siguientes if definen las siluetas en cada nivel en base a la clase homonima, estospiden en orden la posicion de cada una de las siguientes figuras y la rotación necesaria:
    -Cuadrado
    -Trapecio
    -Triangulo Medio
    -triangulo Pequeño
    -triangulo Pequeño
    -Triangulo Mayor
    -Triangulo Mayor
  */
  //Nivel 1
  if (contadorNiveles==4) {
    niv=new Level(new PVector(242.7, 226), 1, new PVector (317.7, 226), 0, new PVector(242.7, 151), -1, new PVector(317.7, 376), 4, new PVector(243, 151), 2, new PVector(93, 151), 0, new PVector (92.7, 451), -2, 0);
  }
  //Nivel 2
  if (contadorNiveles==5) {
    niv=new Level(new PVector(401, 420), 1, new PVector (175.5, 495.5), -2, new PVector(325.7, 271), 1, new PVector(325.7, 271), 0, new PVector(250, 271), -2, new PVector(325.7, 271), 2, new PVector (625.7, 271), 2, 1);
  }
  //Nivel 3
  if (contadorNiveles==6) {
    niv=new Level(new PVector(140.5, 370), 1, new PVector (65, 70), 0, new PVector(109.2, 475), -2, new PVector(365, 221), 2, new PVector(140, 296), -2, new PVector(321.5, 475), -2, new PVector (471.5, 325), 2, 0);
  }
  //Nivel 4
  if (contadorNiveles==7) {
    niv=new Level(new PVector(150, 150), 0, new PVector (415, 97), 1, new PVector(415, 97), 2, new PVector(201, 415.7), 1, new PVector(310.1, 203.7), 3, new PVector(414, 521), 3, new PVector (96, 203.7), -1, 0);
  }
  //Nivel 5
  if (contadorNiveles==8) {
    niv=new Level(new PVector(313, 184), 0, new PVector (261, 238), -1, new PVector(125, 495), -3, new PVector(425.5, 345), 2, new PVector(425, 495), 4, new PVector(125, 495), -2, new PVector (68, 344), -2, 0);
  }
  //Nivel 6
  if (contadorNiveles==9) {
    niv=new Level(new PVector(150, 250), 1, new PVector (554, 218), 0, new PVector(479, 294), 2, new PVector(75, 101), 0, new PVector(225, 250), 4, new PVector(73, 400), -2, new PVector (329, 444), -2, 0);
  }
  //Nivel 7
  if (contadorNiveles==10) {
    niv=new Level(new PVector(255, 150), 1, new PVector (255.5, 225), 2, new PVector(479.7, 300), 3, new PVector(329.7, 300), 4, new PVector(105, 225), 6, new PVector(30, 300), -1, new PVector (268, 512.13), -3, 0);
  }
  //Nivel 8
  if (contadorNiveles==11) {
    niv=new Level(new PVector(343, 255.5), 0, new PVector (77.5, 202), -1, new PVector(396.066017, 308.933982), 2, new PVector(183, 202), -1, new PVector(396.5, 308.5), -3, new PVector(502.13203, 202.8679656), 1, new PVector (290, 415), 3, 0);
  }
  //Nivel 9
  if (contadorNiveles==12) {
    niv=new Level(new PVector(229.5, 235.57), 0, new PVector (440, 130), 1, new PVector(387.3, 289), 2, new PVector(283, 289), -3, new PVector(282, 396), 3, new PVector (493, 183), 1, new PVector (175, 445), 4, 1);
  }
  //Nivel 10
  if (contadorNiveles==13) {
    niv=new Level(new PVector(70, 300), 0, new PVector (363.5, 263), 2, new PVector(527, 519.5), 3, new PVector(377.5, 249), 1, new PVector(124, 353), -3, new PVector (527, 519.5), 4, new PVector (377, 70), 0, 0);
  }
  //Define las funciones comunes a ejecutar en todos los niveles
  if (contadorNiveles>3) {
    //Ejecuta los botones ya expecificados arriba
    setupBotonesNivel();
    //Da el valor de modulo para el movimiento con el teclado
    moveKp=moveK%8;
    //Reinicia el contador en cada bucle para tener una cantidad unica de la cantidad de pixeles blancos en la pantalla
    contadorVictoria=0;
    //Ejecuta el dibujo de las fichas que permite el movimiento y evalua un booleano para permitir el movimiento de cada ficha
    int i;
    for (i=0; i<shapes.length-1; i++) {
      shapes[i].draw();
      if (mousePressed) {
        shapes[i].seleccion();
      }
    }
    //Hace que al ser una pieza movida con el teclado cambie su borde para saber cual es la ficha en movimiento
    for (i=0; i<shapes.length; i++) {
      if (moveKp==i+1) {
        shapes[i].setStrok(3);
      } else {
        shapes[i].setStrok(1);
      }
    }
    //Crea el letrero "Tangram" en los niveles
    fill(240);
    textSize(70);
    pushMatrix();
    textAlign(CENTER);
    text( "Tangram", 500, 70);
    popMatrix();
    //Metodo usado para evaluar la cantidad de pixeles blancos en el nivel para saber si el jugador ganó
    loadPixels();
    for (int j = 0; j < (width*height)-width; j++) {
      if (pixels[j] == blanco) {
        contadorVictoria += 1;
      }
    }
    updatePixels();
    // ejecuta el boton de siguiente nivel si el jugador ganó en los niveles del 1 al 9 y si el nivel es el 10 pintara un letrero que dice "ganaste!"
    if (contadorNiveles!=13) {
      if (contadorVictoria<=200) {
        botones[1].draw();
      }
    } else {
      if (contadorVictoria<=200) {
        pushMatrix();
        textSize(20);
        fill(0);
        textAlign(CENTER);
        text( "FELICIDADES, GANASTE!", 500, 130);
        popMatrix();
      }
    }
  }
}
//funcion mousePressed usada para ejecutar la funcion homonima de la clase Shape y sus derivados
void mousePressed() {
  int i;
  for (i=0; i<shapes.length; i++)
    shapes[i].mousePressed();
}
//funcion mouseReleased usada para ejecutar la funcion homonima de la clase Shape y sus derivados y reinicia el booleano contador
void mouseReleased() {
  int i;
  for (i=0; i<shapes.length; i++)
    shapes[i].mouseReleased();
  contador=false;
}
//funcion keyPressed usada para ejecutar la funcion homonima de la clase Shape y sus derivados, ademas le suma un valor a la variable que determina lla pieza moviendose al presionar TAB
void keyPressed() {
  int i;
  for (i=0; i<shapes.length; i++)
    shapes[i].keyPressed();
  if (key==TAB) {
    moveK+=1;
  }
}
//funcion mouseWheel usada para ejecutar la funcion homonima de la clase Shape y sus derivados
void mouseWheel() {
  int l;
  for (l=0; l<shapes.length; l++)
    shapes[l].mouseWheel(mouseEvent);
}
/*funcion mouseClicked usada para ejecutar la funcion homonima de la clase Button dependiendo del nivel actual, escoge que botones estan presentes en el nivel y ejecuta su
seleccionador, tambien evita la seleccion de multiples fichas a la vez */
void mouseClicked() {
  int i;
  for (i=0; i<botones.length; i++) {
    botones[i].pressedMenu();
    botones[i].pressedCreditos();
    botones[i].pressedJugar();
    botones[i].pressedInstrucciones();
  }
  if (botones.length>=2) {
    botones[1].pressedNextLvl();
    botones[2].pressedMenuLvl();
    botones[0].pressedNivel();
  }
  if (botones.length>=4) {
    botones[3].pressedReset();
  }
  contador=true;
}