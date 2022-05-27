int x0, y0;
float x, y;
Point p;

void setup() {
  size(800, 800);
  x0=width/2;
  y0=height/2;
  x=0;
  y=0;
  p = new Point(-300, 0);
}

void draw() {
  translate(x0-300, y0);
  background(600);
  
  p.display();
  p.move();
}
