void setup() {
  noCursor();//This is the trick!
  size(400, 400);
};
void draw() {
  background(0);
  stroke(255, 0, 0);
  strokeWeight(10);
  point(mouseX, mouseY);
};