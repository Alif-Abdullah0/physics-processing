public class Plank {
  float x, y, theta = 0, t = 0;

  Plank(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display(){
    pushMatrix();
    translate(300*zoom,460*zoom+290);
    rotate(theta);
    stroke(0);
    fill(220);
    rect(-200*zoom, -2*zoom,400*zoom,4*zoom);
    popMatrix();
    //if (height/30 +580 >plank.getY()) print("4 ");
  }
  
  void increment() {
    theta += 2*PI/180;
  }
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  
  float getTheta() {
    return this.theta;
  }

  void restart() {
    theta = 0;
  }
}
