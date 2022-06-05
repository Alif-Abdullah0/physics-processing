int x0, y0;
float x, y;
PointBlue pb;
PointRed pr;
Plank plank;
Goal g;
int adjDist;
int fx = 295, fy = 580, floorheight = 30;
boolean isGAdjClicked;

void setup() {
  size(800, 600);
  x0=width/2;
  y0=height/2;
  x=0;
  y=0;
  pb = new PointBlue(-300, 0);
  pr = new PointRed(350, 0,20,20);
  plank = new Plank(100,425);
  g = new Goal();
  isGAdjClicked = false;
}

void draw() {
  //translate(x0-300, y0);
  background(140,80,67);
  
  //fulcrum
    fill(200);
    triangle(fx,fy,300,430+30,305,550+30);
    
  //platforms
  //fill(0);
  //rect(350,430+floorheight,50,120);
  //rect(200,430+floorheight,50,120);
  
 
  
  //floor
  fill(0);
  rect(0, fy, width, height/30);
  
  //pb.display();
  //pb.move();
  //pr.display();
  plank.display();
  //if (pr.y < 425) {pr.move();}
  g.display();
  
  if (!isGAdjClicked) {g.highLight();}
  
  // determine if blue ball crossed the goal
  float pbX = pb.goalPosDeterX();
  float pbY = pb.goalPosDeterY();
  
  if (pbY > 580) {
    renderLoss();
  }
  
  if (pbX > g.getGX()) {
    if(g.getGY() < pbY && pbY < g.getGY() + g.getGH()) {
      renderWin();
    } else {
      renderLoss();
    }
  }
}

// ends the game, shows a YOU WIN text message, with buttons to replay the simulation or restart from the beginning
void renderWin() {
}

// ends the game, shows a YOU LOSE text message, with buttons to replay the simulation or restart from the beginning
void renderLoss() {
}

void mousePressed(){
  ellipse( mouseX, mouseY, 2, 2 );
  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
  adjDist = g.adjustInit();
  isGAdjClicked = g.highLight();
}

void mouseReleased() {
  isGAdjClicked = g.unHighLight();
}

void mouseDragged() {
  g.adjust(adjDist);
}
