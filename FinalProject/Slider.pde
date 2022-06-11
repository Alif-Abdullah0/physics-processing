public class Slider {
  int x, y, w, h,lBAct, rBAct;
  float leftBound, rightBound;
  
  int sHeight, sWidth, sX, sY;
  
  String unit,displayText;
  
  color sColor;
  Slider(int x, int y, int w, int h, float lB, float rB, String unit, int lBAct, int rBAct,String displayT) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.leftBound = lB;
    this.rightBound = rB;
    this.unit = " "+unit;
    this.displayText = displayT;
    
    this.sX = this.x + 60;
    this.sY = this.y+this.h/10;
    this.sWidth = this.w/20;
    this.sHeight = 2*this.h/10+24;
    
    this.lBAct = lBAct;
    this.rBAct = rBAct;
    
    this.sColor = color(71);
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(this.x, this.y, this.w, this.h);
    textSize(12);
    fill(0);
    text(str(this.leftBound)+unit, this.x+10, this.y+(2*this.h/5));
    text("X 10^"+str(lBAct),this.x+7,this.y+(3*this.h/5));
    text(str(this.rightBound)+unit, this.x+this.w-50, this.y+(2*this.h/5));
    text("X 10^"+str(rBAct),this.x+this.w-50,this.y+(3*this.h/5));
    rect(this.x+60,this.y+(3*this.h/10),this.w-120,(this.h/5));
    text(this.displayText+": " + currentSliderValue()+ " "+this.unit,this.x,this.y-5);
    fill(sColor);
    rect(this.sX,this.sY,this.sWidth,this.sHeight);
  }
  
  float currentSliderValue() {
    float interval = this.rightBound*pow(10,this.rBAct) - this.leftBound*pow(10,this.lBAct);
    float percent = float(this.sX - (this.x+60))/float(this.w-this.sWidth-120);
    float ret_val = round(percent * interval) + this.leftBound*pow(10,this.lBAct);
    return ret_val;
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
  
  int adjustInit() {
    return mouseX - this.sX;
  }
  
  void adjust(int dist) {
    if(this.x+59 < this.sX && this.sX+this.sWidth < this.x+this.w-59) {
      this.sX = mouseX - dist;
    }
    if(this.sX <= this.x+59) {
      this.sX = this.x+60;
    }
    if (this.x+this.w-59 <= this.sX + this.sWidth) {
      this.sX = this.x+this.w-this.sWidth-60;
    }
  }
  
}
