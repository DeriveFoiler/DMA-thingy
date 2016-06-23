ArrayList <work> all;
void setup() {
  size(500,500,P3D);
  noStroke();
  all = new ArrayList <work> ();
  x=width/2 - 100;
  y=height*7/8;
}
class work {
  float x, y, z, h;
  float sx, sy;
  work (float startx, float starty, float tall){
    sx = startx;
    sy = starty;
    x = startx;
    y = starty;
    z = 0;
    h = tall;
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
    if (sy-y < h && up == true){
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
float x;
float y;
float xv = 4;
float yv = 3;
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
  if (frameCount % 25 == 0){
    float h = random(250, height);
    float place = random(0, width);
    for (int i = 0; i<40; i++) {
      all.add (new work (place, height, h) );
    }
  }
  println(frameRate);
  x+=xv;
  y+=yv;
  if (x < 0 || x > width - 200){
    xv*=-1;
    if (x<0){
      x=0;
    }else{
      x=width - 200;
    }
  }
  if (y < 12.5 + 7.5 || y > height - 12.5/2){
    yv *= -1;
    if (y<12.5 + 7.5){
      y=12.5 + 7.5;
    }else{
      y=height - 12.5/2;
    }
  }
  textSize(25);
  fill(0,255, 255);
  text("Congratulations!", x, y);
}