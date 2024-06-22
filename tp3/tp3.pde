//Aragón Julieta, comisión 2, DNI 46424925

PImage imagen;
int cant = 20;
float tam;
boolean restarted = false;


void setup() {
  size(800, 400);
  imagen = loadImage("cuadradito.png");
  tam = width / cant;
}

void draw() {
  background(255);
  image(imagen, 0, 0, 400, 400);
  
  translate(width / 2, 0);
  for (int x = 0; x < cant; x++) {
    for (int y = 0; y < cant; y++) {
      if ((x + y) % 2 == 0) {
        fill(0);
        rect(x *tam, y *tam, tam, tam);  // Dibujamos rectángulos negros
        
        fill(255);
        ellipse(x *tam + tam / 2, y *tam + tam / 2, tam * 0.4, tam * 0.4);  // Dibujamos círculos blancos
      } else {
        fill(255);
        rect(x * tam, y *tam, tam, tam);  // Dibujamos rectángulos blancos
        
        fill(0);
        ellipse(x * tam + tam / 2, y *tam + tam / 2, tam * 0.4, tam * 0.4);  // Dibujamos círculos negros
      }
    }
  }
}
void mousePressed() {
  // Detectar si se hace clic en la imagen
  if (mouseX >= 0 && mouseX <= 800 && mouseY >= 0 && mouseY <= 800) {
    // Reiniciar el programa
    restarted = true;
    setup();
  }
}

void keyPressed() {
  if (key == ' ') {
    tam = random(10, 50); // Cambiar tamaño aleatoriamente
  }
}
