ArrayList <fire> all;
void setup() {
  size(500, 500);
  noCursor();
  noStroke();
  all = new ArrayList <fire> ();
};
class fire {
  //system position
  float rx, ry;
  fire(float sysx, float sysy){
    rx = sysx;
    ry = sysy;
  }
  //particle positions
  float x = rx, y = ry;
  //particle velocities
  float yv = 0, ya = -0.1, xv = random(-5,5);
  //Color variables
  float r = random(100, 255);
  float g = random(0,100);
  void update(){
    //Change positions x and y
    yv += ya;
    xv -= xv/10;
    x += xv;
    y += yv;
    fill(r, g, 0, 70);
    r-=r/40;
    g-=g/40;
    ellipse(x, y, 10, 10);
    if ( x<0 || x>width || y<0 || y>height){
      x=mouseX;
      y=mouseY;
      yv=0;
      ya=-0.1;
      xv=random(-1,1);
      r=random(100,255);
      g=random(0,100);
    }
  };
};
int n = 1;
int past = 0;
void draw() {
  background(0);
  for (int i = 40; i>0; i--){
    fill(255, 255, 255, 10);
    ellipse(mouseX, mouseY, i, i);
  }
  all.add(new fire(mouseX, mouseY));
  for (int i = 0; i<all.size();i++){
    fire part = all.get(i);
    part.update();
    if (part.x > width || part.x < -10 || part.y > height || part.y < -10){
      all.remove(i);
      println(part.x);
    }
    if (part.r == 0 && part.g == 0){
      all.remove(i);
    }
  }
  println(frameRate);
};