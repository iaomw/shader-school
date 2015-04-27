precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin

  vec2 rotated = position.xy;

  rotated.x = position.x*cos(theta) - position.y*sin(theta);
  rotated.y = position.x*sin(theta) + position.y*cos(theta);

  gl_Position = vec4(rotated, 0, 1.0);
}
