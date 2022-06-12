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
  
  boolean stopAdj;
  
  Goal() {
    this.gHeight = 100;
    this.gWidth = 24; // const
    this.gX = 720; //const
    this.gY = 80;
    
    this.sHeight = gHeight/2;
    this.sWidth = gWidth/2; //const
    this.sX = this.gX - 40; // const
    this.sY = this.gY + this.gHeight/4;
    
    sColor = color(71);
    
    stopAdj = true;
  }
  
  void display() {
    noStroke();
    fill(color(255,0,0));
    rect(this.gX,0,this.gWidth,this.gY);
    fill(color(0,255,0));
    rect(this.gX,this.gY,this.gWidth,this.gHeight);
    fill(color(255,0,0));
    rect(this.gX,100+this.gY,25,height-(120+this.gY));
    
    
    if (stopAdj) {
      fill(sColor);
      stroke(0);
      rect(680, this.sY, this.sWidth, sHeight);
    }
  }
  
  boolean highLight() {
    if (sX < mouseX && mouseX < sX+sWidth && sY < mouseY && mouseY < sY+sHeight) {sColor = color(142); return true;}
    else {sColor = color(71); return false;}
  }
  
  boolean unHighLight() {
    sColor = color(71);
    return false;
  }
  
  int adjustInit() {
    return mouseY - sY;
  }
  
  void adjust(int dist) {
    if (24 < this.sY && this.sY +this.sHeight < 556) {
    this.sY = mouseY - dist;
    } 
    if (this.sY <= 24) {
      this.sY = 25;
    } 
    if (556 <= this.sY + this.sHeight) {
      this.sY = 555-this.sHeight;
    }
    this.gY = this.sY - this.gHeight/4;
    
  }
  
  int getGX() {
    return this.gX;
  }
  
  int getGY() {
    return this.gY;
  }
  
  int getGH() {
    return this.gHeight;
  }

}
