precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;

varying vec3 fragNormal, fragPosition, lightDirection;

void main() {

	vec3 eyeDirection = normalize(fragPosition); 
	vec3 normal = normalize(fragNormal);  
	vec3 light = normalize(lightDirection);  
	float lambert = dot(normal, light);

	float phong = pow(max(dot(reflect(light, normal), eyeDirection), 0.0), shininess);
	vec3 lightColor = ambient + diffuse * lambert + specular * phong;

	gl_FragColor = vec4(lightColor, 1);
}