void setup() {
  size(400, 400);
  noStroke();
  background(0);
};

void eye(float ex, float ey,float r){
  float x;
  float y;
  fill(255);
  ellipse(ex, ey, r, r);
  if (( sqrt( pow(mouseX-ex, 2) + pow(mouseY-ey, 2) )) > (r/5)){
    x=ex + (r/5)*(mouseX-ex)/( sqrt( pow(mouseX-ex , 2) + pow(mouseY-ey , 2) +1));
    y=ey + (r/5)*(mouseY-ey)/( sqrt( pow(mouseX-ex , 2) + pow(mouseY-ey , 2) +1));
  }else{
    x=mouseX;
    y=mouseY;
  }
  fill(100, 100, 255);
  ellipse(x, y, r/2, r/2);
};
float a = random(1);
float b = random(1);
float c = random(1);
void draw() {
  background(0);
  eye(width*a, height*b, 120*c);
  eye(width*b, height*c, 120*a);
  eye(width*c, height*a, 120*b);
};