
//Declare array type for fireworks
ArrayList <work> all;
void setup() {
  size(700,700,P3D);
  noCursor();
  noStroke();
  //Here's that array
  all = new ArrayList <work> ();
}
//Define class forework
class work {
  //Declare variables for current location
  float x, y, z;
  //Declare how high it will go
  float h;
  //Where it starts
  float sx, sy, sz;
  //Randomize velocities after "blast"
  float xv = random(-1, 1);
  float yv = random(-1, 1);
  float zv = random(-1, 1);
  PVector v;
  PVector location;
  work (float startx, float starty, float startz, float tall){
    //Set variables based on input
    sx = startx;
    sy = starty;
    x = startx;
    y = starty;
    z = startz;
    h = tall;
    v = new PVector(xv, yv, zv);
    location = new PVector(x, y, z);
    v.setMag(5);
  }
  //Randomize color variables
  float r = random(150, 255);
  float g = random(150, 255);
  float b = random(150, 255);
  //Test whether firework should continue going up
  boolean up = true;
  void update() {
    //Draw in particle as a 3D sphere at coords x, y, z
    fill(r, g, b);
    translate(location.x, location.y, location.z);
    sphere(10);
    translate(-location.x, -location.y, -location.z);
    //Go up until the thing has moved h distance up
    if (sy-location.y < h && up == true){
      location.y-=7;
    } else {
      //Move accordingly after blast
      up = false;
      location.add(v);
      //Dim colors
      r-=7;
      b-=7;
      g-=7;
    }//End if/else statement
  };//End update function
};//End class
//Declare gow high a work will go and where it starts
float h;
float place;
//Declare angle to rotate
float yangle;
void draw () {
  pushMatrix();
  //Declare and scale angle dependent upon mouse
  yangle+=360*(mouseX - pmouseX)/width;
  //Rotate angle on (width/2, height/2, 0)
  translate(width/2, height/4, 0);
  //rotate mouseX instead of mouseY because we rotate around yaxis
  rotateY(radians(yangle));
  translate(-width/2, -height/4, 0);
  //Background for animation
  background(0);
  //Update and remove loop
  for (int i = 0; i<all.size(); i++){
    //Access all particles to remove/update them
    work part = all.get (i);
    //If it's completely dim, stop updating and remove the particle
    if (part.r<0 && part.g<0 && part.b<0){
      all.remove(i);
    } else {
      part.update();
    }
  }
  //Spawn a firework every 30 frames
  if (frameCount % 30 == 0){
    //Randomize how high and where it starts
    h = random(height/2, height);
    PVector place = new PVector(random(-width/2, width/2), height, random(-width/2, width/2));
    //Add 40 particles for each firework to the array to be updated
    for (int i = 0; i<40; i++) {
      all.add (new work (place.x, place.y, place.z, h) );
    }
  }
  //Monitor framerate
  println(frameRate);
  popMatrix();
}