public class PointRed {
  float x, y, t, resolution;
  color c;
  
  PointRed(float x, float y) {
    this.x = x;
    this.y = y;
    t = 0.0001;
    resolution = .01666666666667;
    c = color(255,0,0);
  }
  
  void display() {
    noStroke();
    fill(c);
    circle(x,y,45);
  }
  
  void move() {
    t += resolution;
    setY(this.y+4.9*t*t);
  }
  
  float getY() {
    return this.y;
  }
  
 void setY(float y) {
    this.y = y;
  }
  
}
