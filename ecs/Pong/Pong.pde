// Alex Steward | 25 April 2023 | Pong | controls: q, a, p, l, space 

boolean play;
Ball ball;
Paddle pl;
Paddle pr;


int leftscore = 0;
int rightscore = 0; 

void setup() {
  size(750, 500);
  ball = new Ball();
  pl= new Paddle(true);
  pr= new Paddle(false);
}

void draw() {
  background(0); 
  if (!play) {
    startScreen();
  } else {
    drawBackground ();
    
    ball.checkPaddlepl(pl);
    ball.checkPaddlepr(pr);
    
    pl.show();
    pr.show();
    pl.update();
    pr.update();
    
    ball.update();
    ball.edges();
    ball.show();
    
    infoPanel();
  }
  if (leftscore > 4 || rightscore > 4) {
    //play = false;
    gameOver();
  }
}

void keyReleased() {
  pl.move(0);
  pr.move(0);
}

void keyPressed() {
  if (key == 'q') {
    pl.move(-5);
  } else   if (key == 'a') {
    pl.move(5);
  } else   if (key == ' ') {
    play= true;
  }
  
  if (key == 'p') {
    pr.move(-5);
  } else if (key == 'l') {
    pr.move(5);
  }
}

void drawBackground () {
  background(0);
  for (int i=0; i<height; i+=20) {
    fill(255, 128);
    shapeMode(CENTER);
    rect(width/2, i, 10, 10);
  }
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Pong Replica", width/2, height/2 - 40);
  text("by Alex Steward 4B", width/2, height/2);
  text("press space to start", width/2, height/2 + 40);
}

void gameOver() {
  if (leftscore > 4) {
    background(0);
    fill(255);
    textAlign(CENTER);
    text("Game Finished", width/2, 50);
    text("Player 1 Wins!", width/2, 100);
    text("Player 1 Score:   " + leftscore, width/2, 250);
    text("Player 2 Score:   " + rightscore, width/2, 300);
  } else {
    background(0);
    fill(255);
    textAlign(CENTER);
    text("Game Finished", width/2, 50);
    text("Player 2 Wins!", width/2, 100);
    text("Player 1 Score:   " + leftscore, width/2, 250);
    text("Player 2 Score:   " + rightscore, width/2, 300);
  }
  noLoop();
}

void infoPanel() {
  fill(255);
    textSize(45);
    text(leftscore, 64, 40);
    text(rightscore, width-64, 40);
}
