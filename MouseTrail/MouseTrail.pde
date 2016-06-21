void setup() {
  //frameRate(20);
  size(400, 400);
  background(0);
  noCursor();
  noStroke();
  initStuff();
};
int alength=10;
float[] stuffx;
float[] stuffy;

void initStuff() {
  stuffx = new float[alength];
  for (int i = 0; i<alength; i++){
    stuffx[i]=i;
  }
  stuffy = new float[alength];
  for (int i = 0; i<alength; i++){
    stuffy[i]=i;
  }
}

float x;
float y;
void draw() {
  background(0);
  x=pmouseX;
  y=pmouseY;
  stuffx[0] = x;
  stuffy[0] = y;
  for( int i = alength-1; i > 0; i--){
    stuffx[i] = stuffx[i-1];
    stuffy[i] = stuffy[i-1];
  }
  for (int i = 0; i<alength; i++){
    fill(255, 0, 0, 255-255*i/alength);
    ellipse(stuffx[i], stuffy[i], 2.1*20/(i+2), 2.1*20/(i+2) );
  }
};