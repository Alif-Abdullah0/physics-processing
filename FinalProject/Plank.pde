public class Plank {
  float x, y, theta = 0, t = 0;

  Plank(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display(){
    pushMatrix();
    translate(300,460);
    rotate(theta);
    
    fill(220);
    rect(-200, -2 ,400,4);
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
  
  void negateTheta() {
    this.theta -= 2*PI/180;
  }
}
