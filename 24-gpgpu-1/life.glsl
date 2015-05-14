precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

int checkNeighbors(vec2 coord) {

	int count = 0;

	for (int i = -1; i <= 1; i+=1) {

		for (int j = -1; j <= 1; j+=1) {

			//if (i == 0 && j == 0) { continue; }

			float fi = float(i);
			float fj = float(j);

			float s = state(vec2(coord.x+fi, coord.y+fj));

			if (s > 0.0) { count++; }
		} 
	}

	if (state(coord) > 0.0) { count--; }

	return count; 
} 

void main() {

  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute the next state for the cell at coord
  float s = state(coord);
  int c = checkNeighbors(coord);

  if (s > 0.0) {

  	if (c == 2 || c == 3) { s = 1.0; }
  	else { s = 0.0; } 

  } else {

  	if (c == 3) { s = 1.0; }
  	else { s = 0.0; } 
  }

  gl_FragColor = vec4(s, s, s, 1.0);
}
