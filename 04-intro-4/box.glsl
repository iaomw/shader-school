bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 p) {

  //Test if the point p is inside the box bounded by [lo, hi]

  return p.x >= lo.x && p.x <= hi.x && p.y >= lo.y && p.y <= hi.y;
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)
