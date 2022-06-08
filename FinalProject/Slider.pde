public class Slider {
  int x, y, w, h, leftBound, rightBound;
  
  int sHeight;
  int sWidth;
  int sX;
  int sY;
  
  String unit;
  Slider(int x, int y, int w, int h, int lB, int rB, String unit) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.leftBound = lB;
    this.rightBound = rB;
    this.unit = " "+unit;
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(this.x, this.y, this.w, this.h);
    textSize(12);
    fill(0);
    text(str(this.leftBound)+unit, this.x+10, this.y+(3*this.h/5));
    text(str(this.rightBound)+unit, this.x+this.w-30, this.y+(3*this.h/5));
    rect(this.x+40,this.y+(2*this.h/5),this.w-80,(this.h/5));
  }
}
