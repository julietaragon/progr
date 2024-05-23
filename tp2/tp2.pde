//Aragón Julieta, comisión 2, DNI 46424925
String estado;
PImage imagen1, imagen2, imagen3;


String texto1, texto2, texto3, textoBoton;

int tiempoPantalla;
int tiempoInicio;


int xBoton, yBoton, diamBoton;


float unoX;
float velX;
float tamTexto2;
color colorTexto3; 
int Color3; 


void setup() {
  size(640, 480); 
  background(255);
  
  estado = "pantallauno";
  
  imagen1 = loadImage("portada.png");
  imagen2 = loadImage("yoga.png");
  imagen3 = loadImage("rubia.png");
  
  texto1 = "El juego Bratz™: A presumir de estilazo permite a los jugadores sumergirse en el mundo de la moda y la creatividad junto a las populares muñecas Bratz.";
  texto2 = "En este juego, los jugadores pueden explorar diferentes escenarios, participar en desafíos de estilo, diseñar conjuntos únicos y expresar su creatividad a través de la moda.";
  texto3 = "¡Diviértete descubriendo tu propio sentido del estilo y presumiendo de estilazo con las Bratz!";
  
  
  textoBoton = "Reiniciar presentacion";
  //
  
  tiempoPantalla = 1200;
  tiempoInicio = frameCount;
  
  unoX = 0;
  velX = 0.5;
  tamTexto2 = 10;
  colorTexto3 = color(0);
  Color3 = 50; 
  
  
  xBoton = 595;
  yBoton = 425;
  diamBoton = 90;
  
  
}

void draw() {
  background(255);  
   // ESTADOS uno
   
  if (estado.equals("pantallauno")) {
    image(imagen1, 0, 0, 640, 300);
    fill(0);
    textSize(25);
    if (unoX >= width){
      velX = -0.5;
    } unoX = unoX + velX;
      text(texto1, unoX, 350, 600, 100);
  } 
  //Pantalla dos
  
    else if (estado.equals("pantallados")) {
    image(imagen2, 0, 0, 640, 300);
    fill(0);
    textSize(tamTexto2);
    tamTexto2 += 0.01;
    if (tamTexto2 > 80) {
      tamTexto2 = 80;
    }
    text(texto2, 0, 350, 600, 100);
  }
  
  //Pantalla tres
  
    else if (estado.equals("pantallatres")) {
    image(imagen3, 0, 0, 640, 300); 
    fill(colorTexto3);
    textSize(20);
    text(texto3, 0, 350);
    fill(0);
    
    //EJECUCION DE BOTON
    
    ellipse(xBoton, yBoton, diamBoton, diamBoton);
    fill(255,0,0);
    textSize(13);
    text(textoBoton, 558, 413, 120, 300 ); 
    
    //ANIMACION TEXTO
    if (frameCount % Color3 == 0) {
      colorTexto3 = color(random(255), random(255), random(255));
    }
    
    }
    if (frameCount - tiempoInicio >= tiempoPantalla) {
    cambioPantalla();
  }
  
  println(mouseX, mouseY);
}


void cambioPantalla() {
  // Cambio de pantallas
  if (estado.equals("pantallauno")) {
    estado = "pantallados";
  } else if (estado.equals("pantallados")) {
    estado = "pantallatres";                  
  }
  tiempoInicio = frameCount;
}


void mousePressed() {
  // Cambiar de pantalla al hacer clic en el botón en la pantalla tres
  
  if (estado == "pantallatres" && dist(mouseX, mouseY, xBoton, yBoton) < diamBoton / 2) {
    estado = "pantallauno";
  }
}
  
  
