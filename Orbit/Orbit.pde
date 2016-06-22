ArrayList <orbiter> all;
void setup() {
  size(1280, 780);
  all = new ArrayList<orbiter>();
  noStroke();
};

class orbiter {
  float a = random(255);
  float b = random(255);
  float c = random(255);
  //Define position and velocity
  float x=width/2, y=height/2, v=1, pxv=0, pyv=0, k=0;
  //Create arrays for trail
  int alength=10;
  float[] stuffx;
  float[] stuffy;
  void initStuff(){ 
    stuffx = new float[alength];
    for (int i = 0; i<alength; i++){
      stuffx[i]=i;
    }
    stuffy = new float[alength];
    for (int i = 0; i<alength; i++){
      stuffy[i]=i;
    }
  }
  void update() {
    if (keyPressed && key == 'r'){
      pxv=0;
      pyv=0;
    }
    if (k==0){
      initStuff();
      k=1;
    }
    //Colision testing
    if (x<0){
      pxv*=-1;
      x=1;
    }
    if (x>width){
      pxv*=-1;
      x=width-1;
    }
    if (y<0){
      pyv*=-1;
      y=1;
    }
    if (y>height){
      pyv*=-1;
      y=height-1;
    }
    //Create and normalize vector from point to mouse
    float xv=v*(mouseX-x)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
    float yv=v*(mouseY-y)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
    //Apply change in velocuty pv
    pxv+=xv;
    pyv+=yv;
    //Apply change in position
    x+=pxv;
    y+=pyv;
    //Object trail
    stuffx[0] = x;
    stuffy[0] = y;
    for( int i = alength-1; i > 0; i--){
      stuffx[i] = stuffx[i-1];
      stuffy[i] = stuffy[i-1];
    }
    for (int i = 0; i<alength; i++){
      fill(a, b, c, 255-255*i/alength);
      ellipse(stuffx[i], stuffy[i], 2.1*20/(i+2), 2.1*20/(i+2) );
    }
  } 
}
void draw() {
  background(0);
  for (int i = 0; i<all.size(); i++){
    orbiter part = all.get(i);
    part.update();
  }
  if (keyPressed == true && key== 'c'){
    all = new ArrayList<orbiter>();
  }
};
void mouseClicked() {
  all.add(new orbiter() );
}