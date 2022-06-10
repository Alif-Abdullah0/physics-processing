public class Slider {
  int x, y, w, h, leftBound, rightBound;
  
  int sHeight;
  int sWidth;
  int sX;
  int sY;
  
  String unit;
  
  color sColor;
  Slider(int x, int y, int w, int h, int lB, int rB, String unit) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.leftBound = lB;
    this.rightBound = rB;
    this.unit = " "+unit;
    
    this.sX = this.x + 80;
    this.sY = this.y+this.h/10;
    this.sWidth = this.w/20;
    this.sHeight = 2*this.h/10+24;
    
    this.sColor = color(71);
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(this.x, this.y, this.w, this.h);
    textSize(12);
    fill(0);
    text(str(this.leftBound)+unit, this.x+10, this.y+(2*this.h/5));
    text("X 10^0",this.x+10,this.y+(3*this.h/5));
    text(str(this.rightBound)+unit, this.x+this.w-50, this.y+(2*this.h/5));
    text("X 10^0",this.x+this.w-50,this.y+(3*this.h/5));
    rect(this.x+60,this.y+(3*this.h/10),this.w-120,(this.h/5));
    fill(sColor);
    rect(this.sX,this.sY,this.sWidth,this.sHeight);
  }
  
  boolean highLight() {
    if (this.sX < mouseX && mouseX < this.sX + this.sWidth && this.sY < mouseY && mouseY < this.sY + this.sHeight) {
      this.sColor = color(142);
      return true;
    } else {
      this.sColor = color(71);
      return false;
    }
  }
  
  boolean unHighLight() {
    this.sColor = color(71);
    return false;
  }
}
