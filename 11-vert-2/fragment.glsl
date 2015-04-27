precision highp float;

varying vec3 vectexColor;

void main() {

	gl_FragColor = vec4(vectexColor, 1.0);
}