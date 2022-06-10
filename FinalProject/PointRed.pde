public class PointRed {
  float x, y, t, resolution, theta =0;
  color c;
  float mass;
  float dropHeight;

  PointRed(float x, float y, float m, float dropH) {
    this.x = x;
    this.y = y;
    t = 0;
    resolution = .01666666666667;
    c = color(255, 0, 0);
    mass = m;
    dropHeight = dropH;
  }

  void display() {
    if (!((pr.getX()+20) < (300 + 200) && 
      (pr.getX()+20) > (300-200) && 
      ((pr.getY()+40) > (460 - 2) && 
      (pr.getY()+40) < (460 + 2)))) {
      noStroke();
      fill(c);
      square(x, y, 40*zoom);
      pr.move();
    } else {
      rotating();
    }
  }

  void move() {
    t += resolution;
    y += 4.9*t*t;
  }

  float getY() {
    return this.y;
  }

  float getX() {
    return this.x;
  }


  void rotating() {
    pushMatrix();
    translate(300*zoom, 460*zoom+290);
    rotate(theta);

    fill(c);
    square((70-20)*zoom, -40*zoom, 40*zoom);
    popMatrix();
    if ((zoom*200*sin(plank.getTheta()) < (580-520))) increment();
  }

  void increment() {
    theta += 2*PI/180;
  }
}
