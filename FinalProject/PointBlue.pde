public class PointBlue {
  float x, y, dx, dy, t, resolution, v;
  float x0, y0;
  float vH;
  float vV;
  color c;

  PointBlue(float x, float y, float v) {
    x0 = x;
    y0 = y;
    this.x = x;
    this.y = y;
    this.t = 0;
    this.v = v;
    this.resolution = .1666666666667;
    c = color(255, 204, 0);
    this.vH = 0;
    this.vV = 0;
  }

  void display() {
    noStroke();
    fill(c);
    square(x, y, 40*zoom);
  }

 //if 78 is minimum vf, then min height would be 310, so slider 300, max is 125 --> 788
  void move() {
    x=x0 +this.v*cos(1.57079632679-0.62831855)*t;
    y=y0+ -1*(this.v*sin(1.57079632679-0.62831855)*t-0.5*9.8*t*t);
    this.vH = this.v*cos(1.57079632679-0.62831855);
    this.vV = (this.v*sin(1.57079632679-0.62831855)-9.8*t);
    t += resolution;
  }
  
  float goalPosDeterX() {
    return this.x;
  }
  
  float getT() {
    return t;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getVV() {
    return this.vV;
  }
  
  float getVH() {
    return this.vH;
  }
  
  float goalPosDeterY() {
    return this.y;
  }
  
  void setVelocity(float v) {
    this.v = v;
  }
  

}
