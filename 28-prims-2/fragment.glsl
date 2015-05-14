precision highp float;

uniform vec3 frontColor, backColor;

void main() {

  vec3 color = gl_FrontFacing?frontColor:backColor;

  gl_FragColor = vec4(color,1);
}