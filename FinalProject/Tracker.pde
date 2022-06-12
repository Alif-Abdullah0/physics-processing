public class Tracker {
  int x, y, w, h;
  
  Tracker(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(float ybD, float ybHV, float ybVV) {
    noFill();
    stroke(0);
    rect(this.x,this.y,this.w,this.h);
    fill(0);
    text("Yellow Block Distance From Goal: " + ybD + "m",this.x+5,this.y+20);
    text("Yellow Block Horizontal Velocity: " + ybHV + "m/s",this.x+5,this.y+60);
    text("Yellow Block Vertical Velocity: " + ybVV + "m/s",this.x+5,this.y+100);
  }
  
}
