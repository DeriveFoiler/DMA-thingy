ArrayList <work> all;
void setup() {
  size(500,500,P3D);
  noStroke();
  all = new ArrayList <work> ();
}
class work {
  float x, y, z;
  float sx, sy;
  work (float startx, float starty){
    sx = startx;
    sy = starty;
    x = startx;
    y = starty;
    z = 0;
  }
  float r = random(150, 255);
  float g = random(150, 255);
  float b = random(150, 255);
  float angle = random(0,360);
  float xv = random(-5, 5);
  float yv = random(-5, 5);
  float zv = random(-5, 5);
  float v = 5;
  float m = 0;
  boolean up = true;
  boolean norm = true;
  
  void update() {
    if (norm){
      m = sqrt( pow(xv, 2) + pow(yv, 2) );
      xv = v*xv/m;
      yv = v*yv/m;
      norm = false;
    }
    fill(r, g, b);
    translate(x, y, z);
    sphere(10);
    translate(-x, -y, -z);
    if (sy-y < 200 && up == true){
      y-=7;
    } else {
      up = false;
      x+=xv;
      y+=yv;
      z+=v*zv;
      r-=7;
      b-=7;
      g-=7;
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
  fill(255);
  textSize(25);
  text(frameRate, 0, 25);
}
void mouseReleased() {
  for (int i = 0; i<40; i++) {
    all.add (new work (mouseX, mouseY) );
  }
}