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
    if (!(
      ((pr.getY()+40*zoom+2) > plank.getY()+18))) {
      noStroke();
      fill(c);
      square(150+rbDist, y, 40*zoom);
      print("not colliding");
      pr.move();
    } else {
      rotating();
    }
  }
  
  void displayInit(float xInit, float yInit) {
    this.x = xInit;
    this.y = yInit;
    noStroke();
    fill(c);
    square(150+rbDist, y, 40*zoom);
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
    square(rbDist, -40*zoom, 40*zoom);
    popMatrix();
    if ((zoom*200*sin(plank.getTheta()) < (580-520))) increment();
  }

  void increment() {
    theta += 2*PI/180;
  }
  
  void changeMass(float m) {
    this.mass = m;
  }
  
  float getMass() {
    return this.mass;
  }
  
}
