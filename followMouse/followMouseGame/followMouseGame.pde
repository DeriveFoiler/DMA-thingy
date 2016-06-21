float x=width/2;
float y=height/2;
float velocity=10;
float xvelocity;
float yvelocity;
float angle;
void setup(){
  size(400, 400);
};
void draw() {
  strokeWeight(20);
  background(0,0,0);
  stroke(255, 0, 0);
  point (x,y);
  angle=atan((mouseY - y)/(mouseX - x));
  println(angle);
  xvelocity=+1*cos(angle);
  yvelocity=+1*sin(angle);
  if (x>0 && x<400){
    x+=xvelocity;
    println("xVel = " + xvelocity);
  }
  if (y>0 && y<400){
    //y+=yvelocity;
  }
};