highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n

  // http://en.wikipedia.org/wiki/Transformation_matrix#Reflection_2

  n = normalize(n);

  return mat4(1, 0, 0, 0,
              0, 1, 0, 0, 
              0, 0, 1, 0,
              0, 0, 0, 1) + 

  		 mat4(-2.0 * n.x * n.x, -2.0 * n.x * n.y, -2.0 * n.x * n.z, 0,
              -2.0 * n.y * n.x, -2.0 * n.y * n.y, -2.0 * n.y * n.z, 0,
              -2.0 * n.z * n.x, -2.0 * n.z * n.y, -2.0 * n.z * n.z, 0,
              0            , 0             , 0             , 0);
}

#pragma glslify: export(reflection)