// Alex Steward | 18 April | EtchASketch

int x, y;
PImage pic; 

void setup() {
  size(800,658);
  x= width/2;
  y= height/2;
  pic = loadImage("Etch.png");
  background(128);
}

void draw() {
  image(pic,0,0);
  strokeWeight(3);
}

void mousePressed() {
  saveFrame("line-######.png");
}
void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      moveUp(10);
    } else if (keyCode == DOWN) {
      moveDown(10);
    } else if (keyCode == LEFT) {
      moveLeft(10);
    } else if (keyCode == RIGHT) {
      moveRight(10);
    }
  }
}

void moveRight(int rep) {
  for(int i=0; i<rep; i=i+1) {
    point(x+i,y);
  }
  x=x + rep;
}

void moveLeft(int rep) {
  for(int i=0; i<rep; i=i+1) {
    point(x-i,y);
  }
  x=x-rep;
}

void moveUp(int rep) {
  for(int i=0; i<rep; i=i+1) {
    point(x,y-i);
  }
  y=y-rep;
}

void moveDown(int rep) {  
  for(int i=0; i<rep; i=i+1) {
    point(x,y+i);
  }
  y=y+rep;
}
