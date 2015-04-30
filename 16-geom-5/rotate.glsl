highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians

  // http://en.wikipedia.org/wiki/Rotation_matrix

  n = normalize(n);

  return mat4(cos(theta), 0, 0, 0,
              0, cos(theta), 0, 0, 
              0, 0, cos(theta), 0,
              0, 0, 0, 1) +

  			sin(theta)*mat4(   0,  n.z, -n.y, 0,
  						  	-n.z,    0,  n.x, 0,
  						   	 n.y, -n.x,    0, 0,
  							   0,    0,    0, 0 ) +

  			(1.0-cos(theta))*mat4(n.x*n.x, n.x*n.y, n.x*n.z, 0,
  								n.x*n.y, n.y*n.y, n.y*n.z, 0,
  								n.x*n.z, n.y*n.z, n.z*n.z, 0,
  								0, 0, 0, 0);
}

#pragma glslify: export(rotation)