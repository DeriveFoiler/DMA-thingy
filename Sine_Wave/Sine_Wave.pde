float[] stuffy;
void setup() {
  size(800,400);
  smooth();
  stuffy = new float [width/20];
  for (int i = 0; i<width/20; i++){
    stuffy[i] = height/2;
  }
}
void draw () {
  background(0);
  strokeWeight(5);
  stroke(255);
  ellipse(width/2, height/2, 200,200);
  strokeWeight(2.5);
  stroke(255, 0, 0);
  line(0, height/2+100*sin(millis()/300.0), width,height/2+ 100*sin(millis()/300.0) );
  strokeWeight(15);
  point( width/2+100*cos(millis()/300.0), height/2+100*sin(millis()/300.0) );
  noStroke();
  for (int i = 0; i<width/20; i++){
    fill(0, 255-255*20*i/width, 255-255*20*i/width);
    ellipse(20*i + 10, stuffy[i], 20,20);
  }
  for (int i = stuffy.length-1;i>0; i--){
    stuffy[i] = stuffy[i-1];
  }
  stuffy[0] =height/2+ 100*sin(millis() / 300.0);
}