void setup(){
  frameRate(60);
  size(800, 400);
  noStroke();
}
float gravity= -9.81;
float x=width/2;
float y=height/2;
float xvelocity=0;
float yvelocity = gravity;
float bounciness=3;
void draw(){
  //println(y);
  background(0);
  fill(127);
  rect(0, 7*height/8, width, height/8);
  fill(255, 0, 0);
  ellipse(x, y, 20, 20);
  yvelocity-=gravity/60;
  if (y > 7*height/8 - 11){
    yvelocity*=-1;
    xvelocity-=xvelocity/(bounciness*9);
    yvelocity+=bounciness;
    y=height*7/8 - 11;
  }
  if (y<0){
    yvelocity*=-1;
    y=0;
  }
  if (x<0){
    xvelocity*=-1;
    x=0;
  }
  if (x>width){
    xvelocity*=-1;
    x=width;
  }
  if (mousePressed==true){
    x=mouseX;
    y=mouseY;
    xvelocity=mouseX-pmouseX;
    yvelocity=mouseY-pmouseY;
  }
  x+=xvelocity;
  y+=yvelocity;
}