float i = 1;
import processing.video.*;

Capture cam;

void setup() {
  size(700, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
float x=mouseX;
float y=mouseY;
float xvelocity;
float yvelocity;
void draw() {
  fill(0,0,0,i);
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  noStroke();
  if (mousePressed == true){
     i++;
  }
  rect(-1, -1, 2*width+2, 2*height+2);
  
  fill(255, 255, 255);
  
  rectMode(CENTER);
  rect(50, 50, 50, 50);
  strokeWeight(5);
  fill(255, 200, 200);
  ellipse(x, y, 90, 90);
  fill(100, 255, 100);
  ellipse(x - 15, y -25, 20, 20);
  ellipse(x + 15, y -25, 20, 20);
  fill(0);
  ellipse(x, y + 15, 40, 40);
  xvelocity=(mouseX - x)/10;
  yvelocity=(mouseY - y)/10;
  x+=xvelocity;
  y+=yvelocity;
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}