//Declare array type for my class
ArrayList <fire> all;
void setup() {
  size(500, 500);
  noCursor();
  smooth();
  noStroke();
  //Declare the array
  all = new ArrayList <fire> ();
};
class fire {
  //system position
  float x;
  float y;
  fire(float sysx, float sysy){
    x = sysx;
    y = sysy;
  }
  //particle velocities
  float yv = 0, ya = -0.1, xv = random(-1,1);
  //Color variables
  float r = random(100, 255);
  float g = random(0,100);
  void update(){
    //Change positions x and y and their velocities
    yv += ya;
    xv -= xv/10;
    x += xv;
    y += yv;
    //Dampen color
    fill(r, g, 0, 70);
    r-=r/10;
    g-=g/10;
    //Create ellipse
    ellipse(x, y, 10, 10);
  };
};
//Global variables for color
float r;
float g;
float b;
void draw() {
  background(0);
  for (int i = 50; i>0; i-=1){
    fill(255, 255, 255, random(1, 3));
    ellipse(mouseX, mouseY, 5*i, 5*i);
  }
  //The hover over text
  fill(0);
  textSize(100);
  text("A light in" , 50*width/500, 100*height/500);
  text("the dark", 50*width/500, 400*height/500);
  //Continue adding new particles
  if (frameCount % 1 == 0){
    all.add(new fire(mouseX, mouseY));
  }
  //the stick
  stroke(100, 50, 0);
  strokeWeight(5);
  line(mouseX, mouseY, mouseX-25, mouseY+40);
  //Run through each particle
  noStroke();
  for (int i = 0; i<all.size();i++){
    fire part = all.get(i);
    //Remove if these are met
    if (part.x > width || part.x < 0 || part.y > height || part.y < 0){
      all.remove(i);
    }
    //Update it
    part.update();
  }
};