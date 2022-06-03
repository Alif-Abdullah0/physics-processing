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
    theta+=.01;
  }
  
}
