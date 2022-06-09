int x0, y0;
float x, y;
PointBlue pb;
PointRed pr;
Plank plank;
Goal g;
int adjDist;
int fx = 295, fy = 580, floorheight = 30;
boolean isGAdjClicked;
boolean done;
color doneC;

void setup() {
  size(800, 600);
  x0=width/2;
  y0=height/2;
  x=0;
  y=0;
  pb = new PointBlue(100, 418);
  pr = new PointRed(350, 0, 20, 20);
  plank = new Plank(100, 425);
  g = new Goal();
  isGAdjClicked = false;
}

void draw() {
  //translate(x0-300, y0);
  background(140, 80, 67);

  //fulcrum
  fill(200);
  triangle(fx, fy, 300, 430+30, 305, 550+30);

  //platforms

  pb.display();
  if (done == false) {
    fill(0);
    rect(350, 460, 50, 120);
    rect(200, 460, 50, 120);
     doneC = color(0, 255, 0);
  } else {
    if (!((pr.getX()+20) < (300 + 200) && 
      (pr.getX()+20) > (300-200) && 
      ((pr.getY()+40) > (460 - 2) && 
      (pr.getY()+40) < (460 + 2)))) {
      fill(0);
      rect(350, 460, 50, 120);
      rect(200, 460, 50, 120);
    }
    else {
      if (200*sin(plank.getTheta()) < 580-460) {
        plank.increment();
        
      }
      pb.move();
    }
    pr.display();
    doneC = color(255, 0, 0);
  }


  //text box
  fill(doneC);
  rect(20, 300, 50, 25);
  fill(0);
  text("DONE", 30, 315);

  //floor
  fill(0);
  rect(0, fy, width, height/30);


  plank.display();
  g.display();
  


  if (!isGAdjClicked) {
    g.highLight();
  }

  // determine if blue ball crossed the goal
  float pbX = pb.goalPosDeterX();
  float pbY = pb.goalPosDeterY();

  if (pbY > 580) {
    renderLoss();
  }

  if (pbX > g.getGX()) {
    if (g.getGY() < pbY && pbY < g.getGY() + g.getGH()) {
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

void mousePressed() {
  fill(255);
  ellipse( mouseX, mouseY, 2, 2 );
  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
  adjDist = g.adjustInit();
  isGAdjClicked = g.highLight();

  if (mouseX >= 20 && mouseX <= 50 && mouseY >= 300 && mouseY <= 325) done = true;
}

void mouseReleased() {
  isGAdjClicked = g.unHighLight();
}

void mouseDragged() {
  g.adjust(adjDist);
}
