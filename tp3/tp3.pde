////Aragón Julieta, comisión 2, DNI 46424925
//https://youtu.be/nIKDalm20Pg

PImage imagen;
int cant = 20;
float tam;
boolean restarted = false;
boolean cambiarColores = false;  //controlar el cambio de colores
int cuadroX;
int cuadroY;

//definición de colores
color colorRojo = color(220, 0, 0);
color colorNaranja = color(255, 150, 0);
color colorBlanco = color(255);
color colorRosa = color(255, 170, 200);
color colorFucsia = color(215, 0, 135);

void setup() {
  size(800, 400);
  imagen = loadImage("cuadradito.png");
  tam = width / cant;
}

void draw() {
  image(imagen, 0, 0, 400, 400);
  translate(width / 2, 0);
  for (int x = 0; x < cant - 1; x++) {
    for (int y = 0; y < cant - 1; y++) {
      if ((x + y) % 2 == 0) {
        //verifica si el mouse está sobre un cuadro
        if (mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height) {
          cuadroX = floor(mouseX / tam);
          cuadroY = floor(mouseY / tam);
        }

//color del cuadro
 if ((x == cuadroX && y == cuadroY) || (x == cuadroX + 1 && y == cuadroY) || (x == cuadroX && y == cuadroY + 1) || (x == cuadroX + 1 && y == cuadroY + 1)) {
 fill(255, 0, 0); //rojo 
 } else {
 fill(255); //blanco
  }

 rect(x * tam, y * tam, tam, tam);  //rectángulos blancos
        if (cambiarColores) {
          switch((x + y) % 5) {
            case 0:
              fill(colorRojo);
              break;
            case 1:
              fill(colorNaranja);
              break;
            case 2:
              fill(colorBlanco);
              break;
            case 3:
              fill(colorRosa);
              break;
            case 4:
              fill(colorFucsia);
              break;
          }
        } else {
          fill(0);
        }
        ellipse(x * tam + tam / 2, y * tam + tam / 2, tam * 0.4, tam * 0.4);  //circulos de color
      } else {
        fill(0);
        rect(x * tam, y * tam, tam, tam);  // rectángulos negros
        
        if (cambiarColores) {
          switch((x + y) % 5) {
            case 0:
              fill(colorRojo);
              break;
            case 1:
              fill(colorNaranja);
              break;
            case 2:
              fill(colorBlanco);
              break;
            case 3:
              fill(colorRosa);
              break;
            case 4:
              fill(colorFucsia);
              break;
          }
        } else {
          fill(255);
        }
        ellipse(x * tam + tam / 2, y * tam + tam / 2, tam * 0.4, tam * 0.4);  //circulos de color
      }
    }
  }
}
void mousePressed() {
  //detectar si se hace clic en la imagen
  if (mouseX >= 0 && mouseX <= 800 && mouseY >= 0 && mouseY <= 800) {
    // reiniciar
    restarted = true;
    setup();
    cambiarColores = false;  //volver a colores normales al reiniciar
  }
}
void keyPressed() {
  if (key == ' ') {
    cambiarColores = !cambiarColores;  //cambiar el estado de cambiarColores
  }
}
