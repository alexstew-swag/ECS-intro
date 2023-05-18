
class Ball {
  float x = width/2;
  float y= height/2;
  float xspeed;
  float yspeed;
  float r = 15;

  Ball() {
    reset();
  }

  void checkPaddlepl(Paddle p) {
    if (y < p.y + p.h/2 &&  y > p.y - p.h/2 && x - r < p.x + p.w/2) {
      //if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed=6 * cos(angle);
        yspeed=6 * sin(angle);
        x = p.x + p.w/2 + r;
      //}
    }
  }

  void checkPaddlepr(Paddle p) {
    if (y < p.y + p.h/2 &&  y > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(180);
        float angle = map(diff, 0, p.h, -rad , rad);
        xspeed=6 * cos(angle);
        yspeed=6 * sin(angle);
        x = p.x - p.w/2 - (r-2);
      }
    }
  }

  void update() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4); 
    xspeed = 6 * cos(angle);
    yspeed = 6 * sin(angle);
    if (random(0,1) < 0.5) {
      xspeed *=-1;
    }
  }

  void edges() {
    if (y < 0 || y > height) {
      yspeed *= -1;
    }
    if (x - r > width) {
      leftscore++; 
      reset();
    }
    if (x + r < 0) {
      rightscore++;
      reset();
    }
  }

  void show() {
    fill (255);
    ellipse(x, y, r*2, r*2);
  }
}
