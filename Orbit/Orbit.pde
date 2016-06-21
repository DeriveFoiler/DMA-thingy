void setup() {
  size(500, 500);
  noStroke();
  initStuff();
  //noCursor();
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

float x=250;
float y=250;
float v=1;
float xv;
float yv;
float pxv=0;
float pyv=0;
double drag=0.1;
void draw() {
  background(0);
  xv=v*(mouseX-x)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
  yv=v*(mouseY-y)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
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
  pxv+=xv-drag;
  pyv+=yv-drag;
  if (x<0){
    pxv*=-1;
    x=1;
  }
  if (x>width){
    pxv*=-1;
    x=width+1;
  }
  if (y<0){
    pyv*=-1;
    y=1;
  }
  if (y>height){
    pyv*=-1;
    y=height+1;
  }
  x+=pxv;
  y+=pyv;
};