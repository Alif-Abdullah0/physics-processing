float x0, y0;
float x, y;
PointBlue pb;
PointRed pr;
Plank plank;
Goal g;
Slider redBlockDist;
Slider redBlockMass;
Slider redBlockDropHeight;
int adjDist, rbD,rbM,rbDH;
int fx = 295, fy = 580, floorheight = 30;
boolean isGAdjClicked, isRBDistClicked, isRBMassClicked, isRBDropHeightClicked;
boolean done;
color doneC;
float zoom = .5;
boolean state = false;
float rbDist;
float rbMass;
float rbDropHeight;
float plankMass;
float bbMass;
Tracker tracker;

void setup() {
  size(800, 600);
  x0=width*.5/2;
  y0=height*.5/2;
  x=0;
  y=0;
  pb = new PointBlue(100*zoom, 418*zoom+290,85);
  pr = new PointRed(350*zoom, 0, 20*zoom, 20*zoom+290);
  plank = new Plank(100*zoom, 425*zoom+290);
  g = new Goal();
  isGAdjClicked = false;
  redBlockDist = new Slider(20, 24, 300, 60, 1, 1, "m",0,2,"Red Block Distance From Fulcrum");
  redBlockMass = new Slider(20, 124, 300, 60, 1, 2, "kg",1,2,"Red Block Mass");
  redBlockDropHeight = new Slider(20, 224, 300, 60, 1, 5.09, "m",1,2,"Red Block Drop Height");
  tracker = new Tracker(340,20,280,120);
}

void draw() {
  //translate(x0-300, y0);
  background(140, 80, 67);
  tracker.display(sqrt(pow((720-pb.getX()),2)+pow( (g.getGY()+(g.getGH()/2) )-pb.getY(),2)),round(pb.getVH()),round(pb.getVV()));
  //fulcrum
  fill(200);
  triangle(fx*zoom, fy*zoom+290, 300*zoom, (430+30)*zoom+290, 305*zoom, (550+30)*zoom+290);

  //platforms

  pb.display();
  if (done == false) {
    fill(200);
    stroke(0);
    rect(350*zoom, 460*zoom+290, 50*zoom, 120*zoom);
    rect(200*zoom, 460*zoom+290, 50*zoom, 120*zoom);
    //rect(100, 300, 60, 25);
    //fill(0);
    //text("RESTART", 105, 315);
    doneC = color(0, 255, 0);
    //if (state == true && (mouseX > 100 && mouseX < 160 && mouseY > 300 && mouseY < 325)) {
    //  restart();
    //  print("state is true");
    //}
    //pr.displayInit(redBlockDist.currentSliderValue()+150,518-9-redBlockDropHeight.currentSliderValue());
  } else {
    rbDist = redBlockDist.currentSliderValue();
    rbMass = redBlockMass.currentSliderValue();
    rbDropHeight = redBlockDropHeight.currentSliderValue();
    pr.changeMass(redBlockMass.currentSliderValue());
    float w_0 = velocities(rbMass, rbDropHeight, rbDist,1,200,0.1)[0];
    float vf = velocities(rbMass, rbDropHeight, rbDist,1,200,0.1)[1];
    //print(vf);
    //print("\n");
    //pb.setVelocity(vf);
    if (!((pr.getX()+20) < (300 + 200) && 
      (pr.getX()+20) > (300-200) && 
      ((pr.getY()+40) > (460 - 2) && 
      (pr.getY()+40) < (460 + 2)))) {
      fill(200);
      stroke(0);
      rect(350*zoom, 460*zoom+290, 50*zoom, 120*zoom);
      rect(200*zoom, 460*zoom+290, 50*zoom, 120*zoom);
    } else {
      if (zoom*200*sin(plank.getTheta()) < 580-520) {
        plank.increment();
      }
      pb.move();

      if (pb.getX() + 40*zoom > g.getGX() && pb.getX() + 40*zoom < 744) {
        if ((pb.getY() > g.getGY()) && (pb.getY() < g.getGY() + 100)) print("win");
        else print("lose");
      }
    
      if (pb.getX() > width && pb.getY() > height) {
        done = false;
        plank.restart();
        pb =  new PointBlue(100*zoom, 418*zoom+290,85);
        pr = new PointRed(350*zoom, 0, 20*zoom, 20*zoom+290);
      }
    }
    pr.display();
    stroke(0);
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



  if (!isGAdjClicked && done == false) {
    g.highLight();
  }
  
  if (!isRBDistClicked && done == false){
    redBlockDist.highLight();
  } 
  
  if(!isRBMassClicked && done == false){
    redBlockMass.highLight();
  } 
  
  if(!isRBDropHeightClicked && done == false){
    redBlockDropHeight.highLight();
  }

  // determine if blue ball crossed the goal
  float pbX = pb.goalPosDeterX();
  float pbY = pb.goalPosDeterY();

  redBlockDist.display();
  redBlockMass.display();
  redBlockDropHeight.display();
}

// parameters listed above: red block mass, red block drop height, red block distance from fulcrum, blue block mass, plank mass, plank length
float[] velocities(float rbM,float rbDH,float rbD,float bbM,float pM,float pL) {
  
  float rbVF = sqrt(2*9.8*rbDH);
  float rotationalInertiaPlank = (1.0/12.0)*pM*pow(pL,2);
  float rotationalInertiaBlue = bbM*pow(100,2);
  float rotationalInertiaRed = rbM*pow(rbD,2);
  float angular_velocity = (rbM*rbVF*rbD)/(rotationalInertiaPlank+rotationalInertiaBlue+rotationalInertiaRed);
  float linear_velocity = angular_velocity * rbD;
  float[] velos = {angular_velocity,linear_velocity};
  return velos;
}

// ends the game, shows a YOU WIN text message, with buttons to replay the simulation or restart from the beginning
void restart() {
}

// ends the game, shows a YOU LOSE text message, with buttons to replay the simulation or restart from the beginning
void renderLoss() {
}

void mousePressed() {
  fill(255);
  ellipse( mouseX, mouseY, 2, 2 );
  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
  
  if (done == false) {
  adjDist = g.adjustInit();
  isGAdjClicked = g.highLight();
  
  isRBDropHeightClicked = redBlockDropHeight.highLight();
  isRBMassClicked = redBlockMass.highLight();
  isRBDistClicked = redBlockDist.highLight();
  
  rbD = redBlockDist.adjustInit();
  rbM = redBlockMass.adjustInit();
  rbDH = redBlockDropHeight.adjustInit();
  }
  if (mouseX >= 20 && mouseX <= 70 && mouseY >= 300 && mouseY <= 325) done = true;
 
}

void mouseReleased() {
  if (done == false) {
  isGAdjClicked = g.unHighLight();
  isRBDropHeightClicked = redBlockDropHeight.unHighLight();
  isRBMassClicked = redBlockMass.unHighLight();
  isRBDistClicked = redBlockDist.unHighLight();
  }
}

void mouseDragged() {
  if (done == false) {
  if (isGAdjClicked) {
    g.adjust(adjDist);
  }
  
  if (isRBDistClicked){
    redBlockDist.adjust(rbD);
  } 
  
  if(isRBMassClicked){
    redBlockMass.adjust(rbM);
  } 
  
  if(isRBDropHeightClicked){
    redBlockDropHeight.adjust(rbDH);
  }
  }
}
