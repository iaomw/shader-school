precision mediump float;

uniform float kdiffuse;
uniform float kdamping;

uniform sampler2D prevState[2];
uniform vec2 stateSize;

float state0(vec2 x) {
  return texture2D(prevState[0], fract(x / stateSize)).r;
}
float state1(vec2 x) {
  return texture2D(prevState[1], fract(x / stateSize)).r;
}

float laplace(vec2 pos) {

	float x = float(pos.x);
	float y = float(pos.y);

  return (

    state0(vec2(x-1.0,y)) +
    state0(vec2(x+1.0,y)) +
    state0(vec2(x,y-1.0)) +
    state0(vec2(x,y+1.0))
  ) - 4.0 * state0(vec2(x,y));
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Solve for next state using a 5-point Laplacian stencil and the explicit Euler rule

  float y = (1.0 - kdamping) * (kdiffuse * laplace(coord) + 2.0 * state0(coord)) - state1(coord);

  gl_FragColor = vec4(y,y,y,1);
}
