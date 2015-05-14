precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

float laplace(float x, float y) {

  return (

    state(vec2(x-1.0,y)) +
    state(vec2(x+1.0,y)) +
    state(vec2(x,y-1.0)) +
    state(vec2(x,y+1.0))
  ) - 4.0 * state(vec2(x,y));
}

float nextState(vec2 pos) {

	float fx = float(pos.x);
	float fy = float(pos.y);

	return (1.0 - kdamping) * (kdiffuse * laplace(fx, fy) + state(vec2(fx, fy)));
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float y = nextState(coord);

  gl_FragColor = vec4(y,y,y,1);
}
