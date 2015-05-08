precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 fragNormal;

float lambertWeight(vec3 n, vec3 d) {
  //return max(dot(normalize(n), normalize(d)), 0.0);
  return max(dot(n, d), 0.0);
}

void main() {

	float weight = lambertWeight(fragNormal, lightDirection);
  	vec3 reflected = ambient + diffuse * max(weight, 0.0);

 	gl_FragColor = vec4(reflected, 1);
}