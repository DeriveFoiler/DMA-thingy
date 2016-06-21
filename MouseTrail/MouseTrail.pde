void setup() {
  frameRate(20);
  size(400, 400);
  background(0);
  initStuff();
};
int alength=10;
float[] stuffx;
float[] stuffy;

void initStuff()
{
  stuffx = new float[(alength)];
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
  for( int i = alength-1; i> 0; i--){
    stuffx[i] = stuffx[i-1];
  }
  //stuffx[1] = x;
  //float[] stuffy = new float[alength];
  stuffy[0] = y;
  for(int i = alength-1; i> 0; i--){
    stuffy[i] = stuffy[i-1];
  }
  //stuffy[1] = y;
  for (int i = 0; i<alength; i++){
    fill(255, 0, 0, 255-255*i/alength);
    ellipse(stuffx[i], stuffy[i], 20, 20);
    println(stuffx[i]);
  }
};