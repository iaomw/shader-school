mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //

  highp mat2 I = mat2(1.0);

  for (int i=1; i<=256; i++) {

  	I = I*m;

  	if (i==n) { return I; }
  }

  return I;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)