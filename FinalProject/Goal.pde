public class Goal {
  int gHeight;
  int gWidth;
  int gX;
  int gY;
  int sHeight;
  int sWidth;
  int sX;
  int sY;
  
  Goal() {
    this.gHeight = 124;
    this.gWidth = 24;
    this.gX = 720;
    this.gY = 80;
    
    this.sHeight = gHeight/2;
    this.sWidth = gWidth/2;
    this.sX = gX - 40;
    this.sY = gY + gHeight/4;
  }
  
  void display() {
    noStroke();
    fill(color(255,0,0));
    rect(720,0,25,80);
    fill(0,255,0);
    rect(720,80,25,this.gHeight);
    fill(255,0,0);
    rect(720,80+this.gHeight,25,height-(100+this.gHeight));
    
    fill(0);
    rect(680, 111, 12, sHeight);
  }
  
  void highLight() {
  }
  
}
