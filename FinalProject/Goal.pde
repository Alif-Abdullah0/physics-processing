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
    this.gHeight = 124;
    this.gWidth = 24; // const
    this.gX = 720; //const
    this.gY = 80;
    
    this.sHeight = gHeight/2;
    this.sWidth = gWidth/2; //const
    this.sX = gX - 40; // const
    this.sY = gY + gHeight/4;
    
    sColor = color(0);
  }
  
  void display() {
    noStroke();
    fill(color(255,0,0));
    rect(this.gX,0,this.gWidth,this.gY);
    fill(color(0,255,0));
    rect(this.gX,this.gY,this.gWidth,this.gHeight);
    fill(color(255,0,0));
    rect(this.gX,80+this.gHeight,25,height-(100+this.gHeight));
    
    fill(sColor);
    rect(680, this.sY, this.sWidth, sHeight);
  }
  
  void highLight() {
    if (sX < mouseX && mouseX < sX+sWidth && sY < mouseY && mouseY < sY+sHeight) {
      sColor = color(142);
    } else {
      sColor = color(0);
    }
  }
  
  int adjustInit() {
    return mouseY - sY;
  }
  
  void adjust(int dist) {
    this.sY = mouseY - dist;
  }
  
}
