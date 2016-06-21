float i=255;
void setup() {
  size(400, 400);
};
void draw() {
  background(0, 0, 0);
  fill(255, 255, 255, i);
  rect(-1, -1, width+1, height+1);
  if (i>0) {
    i-=0.5;
  }
};