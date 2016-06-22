void setup() {
  size(400,400);
  x=width/2;
  y=height/2;
  background(0);
  smooth();
  strokeWeight(1);
  stroke(255);
}
float x;
float y;
float vx;
float vy;
void draw() {
  vx = random(-5, 5);
  vy = random(-5, 5);
  if (x+vx<0 || x+vx>width){
    vx*=-1;
  }
  if (y+vy<0 || y+vy>height){
    vy*=-1;
  }
  line(x, y, x+vx, y+vy);
  x+=vx;
  y+=vy;
};
void mousePressed(){
  background(0);
  x=mouseX;
  y=mouseY;
};