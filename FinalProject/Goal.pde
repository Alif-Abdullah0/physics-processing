public class Goal {
  int gHeight;
  int gWidth;
  int gX;
  int gY;
  int sHeight;
  int sWidth;
  int sX;
  int sY;
  
  color sColor;
  
  Goal() {
    this.gHeight = 100;
    this.gWidth = 24; // const
    this.gX = 720; //const
    this.gY = 80;
    
    this.sHeight = gHeight/2;
    this.sWidth = gWidth/2; //const
    this.sX = this.gX - 40; // const
    this.sY = this.gY + this.gHeight/4;
    
    sColor = color(0);
  }
  
  void display() {
    noStroke();
    fill(color(255,0,0));
    rect(this.gX,0,this.gWidth,this.gY);
    fill(color(0,255,0));
    rect(this.gX,this.gY,this.gWidth,this.gHeight);
    fill(color(255,0,0));
    rect(this.gX,100+this.gY,25,height-(120+this.gY));
    
    fill(sColor);
    rect(680, this.sY, this.sWidth, sHeight);
  }
  
  boolean highLight() {
    if (sX < mouseX && mouseX < sX+sWidth && sY < mouseY && mouseY < sY+sHeight) {sColor = color(142); return true;}
    else {sColor = color(0); return false;}
  }
  
  boolean unHighLight() {
    sColor = color(0);
    return false;
  }
  
  int adjustInit() {
    return mouseY - sY;
  }
  
  void adjust(int dist) {
    if (80 < mouseY && mouseY < 480) {
    this.sY = mouseY - dist;
    this.gY = this.sY - this.gHeight/4;
    }
  }
  
}
