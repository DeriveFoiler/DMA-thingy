void setup(){
  frameRate(60);
  background(0);
  size(800, 400);
  initStuff();
}
int alength=25;
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
float gravity= -9.81;
float x=width/2;
float y=height/2;
float xvelocity=0;
float yvelocity = gravity;
float bounciness=2;
void draw(){
  background(0);
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
  fill(255, 0, 0);
  //ellipse(x, y, 20, 20);
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
  stuffx[0] = x;
  for( int i = alength-1; i > 0; i--){
    stuffx[i] = stuffx[i-1];
  }
  //stuffx[1] = x;
  //float[] stuffy = new float[alength];
  stuffy[0] = y;
  for(int i = alength-1; i > 0; i--){
    stuffy[i] = stuffy[i-1];
  }
  //stuffy[1] = y;
  for (int i = 0; i<alength; i++){
    //fill(255, 0, 0, 255-255*i/alength);
    ellipse(stuffx[i], stuffy[i], 20/((i+2)/2), 20/((i+2)/2) );
    //println(stuffx[i]);
  }
  x+=xvelocity;
  y+=yvelocity;
};