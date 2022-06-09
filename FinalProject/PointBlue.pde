public class PointBlue {
  float x, y, dx, dy, t, resolution;
  float x0, y0;
  color c;


  PointBlue(float x, float y) {
    x0 = x;
    y0 = y;
    this.x = x;
    this.y = y;
    this.t = 0; 
    this.resolution = .1666666666667;
    c = color(255, 204, 0);
  }

  void display() {
    noStroke();
    fill(c);
    square(x, y, 40);
  }

  void move() {
    x=x0 +100*cos(radians(45))*t;
    y=y0+ -1*(100*sin(radians(45))*t-0.5*9.8*t*t);
    t += resolution;
  }
  
  float goalPosDeterX() {
    return this.x;
  }
  
  float goalPosDeterY() {
    return this.y;
  }
}
