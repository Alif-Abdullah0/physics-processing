int x0, y0;
float x, y;
PointBlue pb;
PointRed pr;

void setup() {
  size(800, 600);
  x0=width/2;
  y0=height/2;
  x=0;
  y=0;
  pb = new PointBlue(-300, 0);
  pr = new PointRed(350, 20);
}

void draw() {
  //translate(x0-300, y0);
  background(140,80,67);
  fill(220);
  rect(200,425,200,4);
  fill(200);
  triangle(295,550,300,429,305,550);
  fill(0);
  rect(350,429,50,121);
  rect(200,429,50,121);
  fill(0,0,255);
  square(205,380,45);
  //pb.display();
  //pb.move();
  pr.display();
  if (pr.y < 375) {pr.move();}
  else {pr.setY(380);}
}
