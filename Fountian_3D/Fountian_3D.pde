//Declare width and height 
int w = 600;
int h = 600;
//Declare an array type for partis
ArrayList <parts> all;
//Declare ArrayList for systems
float[] systemsx = {float(w/4)};
float[] systemsy = {float(h/3)};
float[] systemsz = {0};
void setup() {
  size(600, 600, P3D);
  noStroke();
  //This is the array
  all = new ArrayList<parts> ();
};
class parts {;
  //Set initial points of system
  float rx, ry, rz;
  parts(float sysx, float sysy, float sysz){
    rx=sysx;
    ry=sysy;
    rz=sysz;
  };
  //Color variables
  float a = random(100, 255);
  //Location and initial velocities
  float x=rx,y=ry,z=rz, yv = -4;
  float xv = 2 + random(-1,1);
  float zv = random(-0.5,0.5);
  //Gravity
  float ya = 0.1;
  void update() {
    yv += ya;
    x += xv;
    y += yv;
    z += zv;
    fill(a, a, 255, 50);
    pushMatrix();
    translate(x, y, z);
    sphere(7);
    popMatrix();
    //Reset all variables if out of range
    if (y>height || y<0 || x>width || x<0){
      x=rx;
      y=ry;
      z=rz;
      xv = 2 + random(-1, 1);
      yv = -4;
      ya = 0.1;
      a = random(100, 255);
    }//End if
  };//End update
};//End class
//Counter of all particles
int n = 1;
//Test if the number of systems needs to be changed
int past = 0;
//Text
boolean text = true;
void draw () {
  //The light
  pointLight(255, 255, 255, width/2, height/2, 300);
  //Animation background
  background(0);
  //Make the text dissappear if you added a fountian
  if (text){
    //The text on the top left
    fill(255);
    textSize(20);
    text("Click to add more fountians!", 0, 25);
    text("Keep in mind it takes ~4 seconds to fully load in", 0, 50);
  }
  //Goes through the array and update each one
  for (int i = 0; i<all.size(); i++){
    parts part = all.get (i);
    part.update();
  }
  //If new elements have been added
  if (past!=systemsx.length){
    //Add in all the elements required
    if (n<=150){
      all.add( new parts(systemsx[systemsx.length-1], systemsy[systemsy.length-1], 0) );
      n++;
    }else{
      //And set the number of systems again
      past = systemsx.length;
      n=1;
    }
  }
  println(frameRate);
};
void mouseReleased() {
  //Makes text disappear
  text = false;
  //Make sure we get the full amount of parts
  n=1;
  //Adds the current mouse position to the system array location
  float sysx=mouseX;
  float sysy=mouseY;
  float sysz=0;
  systemsx = append(systemsx, sysx);
  systemsy = append(systemsy, sysy);
  systemsz = append(systemsx, sysz);
};