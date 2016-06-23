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
float a;
void draw () {
  background(0);
  for (int i = 0; i<width/20; i++){
    fill(0, 255-255*20*i/width, 255-255*20*i/width);
    ellipse(20*i + 10, stuffy[i], 20,20);
  }
  for (int i = stuffy.length-1;i>0; i--){
    a = (stuffy[i-1] - stuffy[i])/5;
    stuffy[i] += a;
  }
  stuffy[0] = mouseY;
}