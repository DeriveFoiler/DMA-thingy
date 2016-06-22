float[] stuffy;
void setup() {
  size(800,400);
  smooth();
  noStroke();
  stuffy = new float [width/20];
  for (int i = 0; i<width/20; i++){
    stuffy[i] = height/2;
  }
}
void draw () {
  background(0);
  for (int i = 0; i<width/20; i++){
    fill(0, 255-255*20*i/width, 255-255*20*i/width);
    ellipse(20*i + 10, stuffy[i], 20,20);
  }
  for (int i = stuffy.length-1;i>0; i--){
    stuffy[i] = stuffy[i-1];
  }
  stuffy[0] = mouseY;
}