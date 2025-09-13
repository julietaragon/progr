let imagen;
let cant = 20;
let tam;
let restarted = false;
let cambiarColores = false;
let cuadroX;
let cuadroY;

let colorRojo, colorNaranja, colorBlanco, colorRosa, colorFucsia;

function preload() {
  imagen = loadImage("data/cuadradito.png"); 
}

function setup() {
  createCanvas(800, 400);
  tam = width / cant;

  colorRojo = color(220, 0, 0);
  colorNaranja = color(255, 150, 0);
  colorBlanco = color(255);
  colorRosa = color(255, 170, 200);
  colorFucsia = color(215, 0, 135);
}

function draw() {
  image(imagen, 0, 0, 400, 400);
  translate(width / 2, 0);

  for (let x = 0; x < cant - 1; x++) {
    for (let y = 0; y < cant - 1; y++) {
      if ((x + y) % 2 === 0) {

        if (mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height) {
          cuadroX = floor(mouseX / tam);
          cuadroY = floor(mouseY / tam);
        }

        if (estaDentroDelCuadro(x, y)) {
          fill(160, 32, 240);
        } else {
          fill(255);
        }

        rect(x * tam, y * tam, tam, tam);

        if (cambiarColores) {
          switch ((x + y) % 5) {
            case 0: fill(colorRojo); break;
            case 1: fill(colorNaranja); break;
            case 2: fill(colorBlanco); break;
            case 3: fill(colorRosa); break;
            case 4: fill(colorFucsia); break;
          }
        } else {
          fill(0);
        }

        ellipse(x * tam + tam / 2, y * tam + tam / 2, tam * 0.4, tam * 0.4);

        dibujarExtra(x, y);

      } else {
        fill(0);
        rect(x * tam, y * tam, tam, tam);

        if (cambiarColores) {
          switch ((x + y) % 5) {
            case 0: fill(colorRojo); break;
            case 1: fill(colorNaranja); break;
            case 2: fill(colorBlanco); break;
            case 3: fill(colorRosa); break;
            case 4: fill(colorFucsia); break;
          }
        } else {
          fill(255);
        }

        ellipse(x * tam + tam / 2, y * tam + tam / 2, tam * 0.4, tam * 0.4);
      }
    }
  }
}

function dibujarExtra(x, y) {
  let d = dist(mouseX, mouseY, x * tam, y * tam);
  if (d < 30) {
    fill(random(255), random(255), random(255), 150);
    ellipse(x * tam + tam / 2, y * tam + tam / 2, tam * 0.2, tam * 0.2);
  }
}

function estaDentroDelCuadro(x, y) {
  return (x === cuadroX && y === cuadroY) ||
         (x === cuadroX + 1 && y === cuadroY) ||
         (x === cuadroX && y === cuadroY + 1) ||
         (x === cuadroX + 1 && y === cuadroY + 1);
}

function mousePressed() {
  if (mouseX >= 0 && mouseX <= 800 && mouseY >= 0 && mouseY <= 800) {
    restarted = true;
    setup();
    cambiarColores = false;
  }
}

function keyPressed() {
  if (key === ' ') {
    cambiarColores = !cambiarColores;
  }
}
