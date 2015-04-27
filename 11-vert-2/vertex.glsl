precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec3 vectexColor;

void main() {

  gl_Position = position;

  //Set fragPosition variable for the
  //fragment shader output
  vectexColor = color;
}
