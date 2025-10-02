let imagen = [];
let estado;

function preload() {
  for (let i = 0; i < 2; i++) {
    imagen[i] = loadImage("data/imagen" + i + ".jpg");
  }
}

function setup() {
  createCanvas(640, 480);
  for (let i = 0; i < imagen.length; i++) {
    imagen[i].resize(640, 480);
  }
  estado = 0;

}

function draw() {
  background(200);
  cargarEstado(estado);

  }


function cargarEstado(estado) {
  cargaOtraImagen(imagen[estado], { x: width / 2, y: height / 2, ancho: 640, alto: 480, alinea: CENTER });

  if (estado === 0) {

  }

  if (estado === 1 || estado === 2 ){


  } 
}

function cargaOtraImagen(imag, medidas) {
  imageMode(medidas.alinea);
  image(imag, medidas.x, medidas.y, medidas.ancho, medidas.alto);
}
