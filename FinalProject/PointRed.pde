public class PointRed {
  float x, y, t, resolution;
  color c;
  float mass;
  float dropHeight;
  
  PointRed(float x, float y, float m, float dropH) {
    this.x = x;
    this.y = y;
    t = 0.0001;
    resolution = .01666666666667;
    c = color(255,0,0);
    mass = m;
    dropHeight = dropH;
  }
  
  void display() {
    noStroke();
    fill(c);
    circle(x,y,40);
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
