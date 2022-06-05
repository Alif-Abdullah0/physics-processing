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
    
    increment();
    if ((0 < plank.getX() + 400) && 
    (0+ width> plank.getX()) &&
    (580 < plank.getY() +4) &&(height/30 +580 >plank.getY())) print("hi");

    
  }
  
  void increment() {
    theta+=.01;
  }
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
}
