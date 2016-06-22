ArrayList <fire> all;
void setup() {
  size(500, 500);
  noCursor();
  smooth();
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
    r-=r/10;
    g-=g/10;
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
float r;
float g;
float b;
int n = 1;
int past = 0;
void draw() {
  background(0);
  for (int i = 50; i>0; i-=1){
    fill(255, 255, 255, random(1, 3));
    ellipse(mouseX, mouseY, 3*i, 3*i);
  }
  fill(0);
  textSize(100);
  text("A light in" , 50*width/500, 100*height/500);
  text("the dark", 50*width/500, 400*height/500);
  if (frameCount % 1 == 0){
    all.add(new fire(mouseX, mouseY));
  }
  stroke(100, 50, 0);
  strokeWeight(10);
  line(mouseX, mouseY, mouseX-25, mouseY+40);
  noStroke();
  for (int i = 0; i<all.size();i++){
    fire part = all.get(i);
    if (part.x > width || part.x < -10 || part.y > height || part.y < -10){
      all.remove(i);
      println(part.x);
    }
    part.update();
    if (part.r < 2 && part.g < 2){
      all.remove(i);
    }
  }
};