//Creating and array type that takes orbiter
ArrayList <orbiter> all;
void setup() {
  size(1275, 753);
  //Here's the array that takes orbiter
  all = new ArrayList<orbiter>();
  noStroke();
};

class orbiter {
  //Color randomness
  float a = random(100,255);
  float b = random(100,255);
  float c = random(100,255);
  //Define position and velocity
  float pxv = random(10);
  float pyv = random(10);
  float x=width/2, y=height/2, v=1, xv, yv, k=0;
  //Create arrays for trail
  int alength=10;
  float[] stuffx;
  float[] stuffy;
  void initStuff(){ 
    stuffx = new float[alength];
    for (int i = 0; i<alength; i++){
      stuffx[i]=width/2;
    }
    stuffy = new float[alength];
    for (int i = 0; i<alength; i++){
      stuffy[i]=height/2;
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
    if (x<10){
      pxv*=-1;
      x=11;
    }
    if (x>width-10){
      pxv*=-1;
      x=width-11;
    }
    if (y<10){
      pyv*=-1;
      y=10;
    }
    if (y>height-10){
      pyv*=-1;
      y=height-11;
    }
    //Create and normalize vector from point to mouse
    xv=v*(mouseX-x)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
    yv=v*(mouseY-y)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
    //Apply change in velocuty pv
    pxv+=xv;
    pyv+=yv;
    //Apply change in position
    x+=pxv;
    y+=pyv;
    //OBJECT TRAIL
    //Set first 2 variables
    stuffx[0] = x;
    stuffy[0] = y;
    //Shift everything over by 1 in the arrays
    for( int i = alength-1; i > 0; i--){
      stuffx[i] = stuffx[i-1];
      stuffy[i] = stuffy[i-1];
    }
    //Draw all the ellipses of everything in the array
    for (int i = 0; i<alength; i++){
      fill(a, b, c, 255-255*i/alength);
      ellipse(stuffx[i], stuffy[i], 2.1*20/(i+2), 2.1*20/(i+2) );
    }
  } 
}
int auto = -1;
int pause = -1;
int k = 0;
//Check for auto or pause activators
void keyReleased(){
  if (key == 'a'){
    auto*=-1;
  }
  if (key == ' '){
    pause*=-1;
  }
};
//I want the mouse being clicked to add a new orbiter
void mouseClicked() {
  all.add(new orbiter() );
};
void draw() {
  //Test for pause: if paused, I don't want to update them
  if (pause == -1){
    background(0);
    //Here I run through all the parts of 'all' to update them
    for (int i = 0; i<all.size(); i++){
      orbiter part = all.get(i);
      part.update();
    }
    //Simply a test and running of "auto mode": 1orbiter/2sec
    if (auto == 1){
      fill(255);
      textSize(20);
      text("Auto Mode", 0, 20);
      //Adds a new orbiter every 120 frames
      if (k%120 == 0 ){
        all.add(new orbiter() );
      }
      if (all.size()>9){
        auto=-1;
      }
    }
    k++;
  }
  if (keyPressed == true && key == 'c'){
    //This resets by redefining the array
    all = new ArrayList<orbiter>();
  }
  println(k);
};