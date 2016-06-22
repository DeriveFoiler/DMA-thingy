ArrayList <work> all;
void setup() {
  size(500,500);
  noStroke();
  all = new ArrayList <work> ();
}
class work {
  float x, y;
  float sx, sy;
  work (float startx, float starty){
    sx = startx;
    sy = starty;
    x = startx;
    y = starty;
  }
  float r = random(150, 255);
  float g = random(150, 255);
  float b = random(150, 255);
  float angle = random(0,360);
  float xv = random(5, -5);
  float yv = random(5, -5);
  float v = 2;
  float m = sqrt( pow(xv, 2) + pow(yv, 2) );
  
  xv = xv/m;
  void update() {
    fill(r, g, b);
    ellipse(x, y, 10, 10);
    if (sy-y < 100){
      y-=3;
    } else {
      pushMatrix();
      translate(x, y);
      rotate( angle );
      x+=5;
      popMatrix();
      r-=10;
      b-=10;
      g-=10;
    }
  };
};
int i=0;
void draw () {
  background(0);
  fill(255);
  for (int i = 0; i<all.size(); i++){
    work part = all.get (i);
    part.update();
    if (part.r<0 && part.g<0 && part.b<0){
      all.remove(i);
    }
  }
}
void mouseReleased() {
  for (int i = 0; i<100; i++) {
    all.add (new work (mouseX, mouseY) );
  }
}