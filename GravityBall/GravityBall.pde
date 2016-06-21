void setup(){
  frameRate(60);
  background(0);
  size(800, 400);
}
float gravity= -9.81;
float x=width/2;
float y=height/2;
float xvelocity=0;
float yvelocity = gravity;
float bounciness=2;
void draw(){
  if (mousePressed==true){
    background(0);
    x=mouseX;
    y=mouseY;
    xvelocity=mouseX-pmouseX;
    yvelocity=mouseY-pmouseY;
  }
  if (keyPressed && key=='c'){
    background(0);
  }
  fill(127);
  noStroke();
  rect(0, 7*height/8, width, height/8);
  stroke(255);
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
  x+=xvelocity;
  y+=yvelocity;
};