//Declare width and height 
int w = 500;
int h = 500;
//Declare an array type for partis
ArrayList <parts> all;
//Declare ArrayList for systems
float[] systemsx = {float(w/2)};
float[] systemsy = {float(h/2)};
void setup() {
  size(500, 500);
  noStroke();
  //This is the array
  all = new ArrayList<parts> ();
};
class parts {;
  //Set initial points of system
  float rx, ry;
  parts(float sysx, float sysy){
    rx=sysx;
    ry=sysy;
  };
  //Color variables
  float a = random(100, 255);
  float b = random(100, 255);
  float c = random(100, 255);
  //Location and initial velocities
  float x=rx,y=ry, yv = -4;
  float xv = random(-1,1);
  //Gravity
  float ya = 0.1;
  void update() {
    yv += ya;
    x += xv;
    y+= yv;
    fill(a,b,c,70);
    ellipse(x, y, 10, 10);
    //Reset all variables if out of range
    if (y>height || y<0 || x>width || x<0){
      x=rx;
      y=ry;
      xv = random(-1, 1);
      yv = -4;
      ya = 0.1;
      a = random(100, 255);
      b = random(100, 255);
      c = random(100, 255);
    }//End if
  };//End update
};//End class
//Counter of all particles
int n = 1;
//Test if the number of systems needs to be changed
int past = 0;
void draw () {
  //Animation background
  background(0);
  //The text on the top left
  fill(255);
  textSize(20);
  text("Click to add more fountians!", 50, 50);
  //Goes through the array and update each one
  for (int i = 0; i<all.size(); i++){
    parts part = all.get (i);
    part.update();
  }
  //If new elements have been added
  if (past!=systemsx.length){
    //Add in all the elements required
    if (n<=200){
      all.add( new parts(systemsx[systemsx.length-1], systemsy[systemsy.length-1]) );
      n++;
    }else{
      //And set the number of systems again
      past = systemsx.length;
      n=1;
    }
  }
};
void mouseReleased() {
  //Adds the current mouse position to the system array location
  float sysx=mouseX;
  float sysy=mouseY;
  systemsx = append(systemsx, sysx);
  systemsy = append(systemsy, sysy);
};