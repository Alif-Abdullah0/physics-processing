public class PointBlue {
  float x, y, dx, dy, t, resolution;
  color c;


  PointBlue(float x, float y) {
    this.x = x;
    this.y = y;
    this.t = .0001; 
    this.resolution = .1;
    c = color(255, 204, 0);
  }

  void display() {
    noStroke();
    fill(c);
    if (y>= 0) circle(x, -y, 45);
  }

  void move() {
    x=75*cos(radians(45))*t;
    y=75*sin(radians(45))*t-0.5*9.8*t*t;
    t += resolution;
  }
}
