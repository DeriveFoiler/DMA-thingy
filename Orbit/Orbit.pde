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
    float xv=v*(mouseX-x)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
    float yv=v*(mouseY-y)/(sqrt( pow((mouseX-x),2) + pow((mouseY-y), 2)) +0.1);
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
void draw() {
  background(0);
  //Here I run through all the parts of 'all' to update them
  for (int i = 0; i<all.size(); i++){
    orbiter part = all.get(i);  
    part.update();
  }
  if (keyPressed == true){
    if (key == 'c'){
      //This resets by redefining the array
      all = new ArrayList<orbiter>();
    }
  }
};
//I want the mouse being clicked to add a new orbiter
void mouseClicked() {
  all.add(new orbiter() );
}
//LINE ONE UNDRED!!!!