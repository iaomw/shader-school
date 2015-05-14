precision highp float;

varying vec3 fragColor;

void main() {

  float len = length(gl_PointCoord - vec2(0.5, 0.5));

  if (len > 0.5) {

  	discard;

  	//gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);

  } else {

  	gl_FragColor = vec4(fragColor, 1.0);
  }
}