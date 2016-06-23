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
  float x;
  float y;
  float yv = -4;
  float xv = random(-1,1);
  //Gravity
  float ya = 0.1;
  boolean startup = true;
  void update() {
    if (startup){
      x = rx;
      y = ry;
      startup = false;
    }
    yv += ya;
    x += xv;
    y+= yv;
    fill(a,b,c,70);
    ellipse(x, y, 10, 10);
    //Reset all variables if out of range
    //if (y>height || y<0 || x>width || x<0){
    //  x=rx;
    //  y=ry;
    //  xv = random(-1, 1);
    //  yv = -4;
    //  ya = 0.1;
    //  a = random(100, 255);
    //  b = random(100, 255);
    //  c = random(100, 255);
    //}//End if
  };//End update
};//End class
//Counter of all particles
int n = 1;
//Test if the number of systems needs to be changed
int past = 0;
//Text
boolean text = true;
void draw () {
  //Animation background
  background(0);
  //Make the text dissappear if you added a fountian
  if (text){
    //The text on the top left
    fill(255);
    textSize(20);
    text("Click to add more fountians!", 0, 25);
  }
  //Goes through the array and removes or update each one
  for (int i = 0; i<all.size(); i++){
    parts part = all.get (i);
    if (part.y>height){
      all.remove(i);
    }else{
      part.update();
    }
  }
  //If new elements have been added
  for (int i = 0; i<systemsx.length; i++){
    all.add( new parts(systemsx[i], systemsy[i]) );
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
  systemsx = append(systemsx, sysx);
  systemsy = append(systemsy, sysy);
};