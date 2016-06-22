void setup() {
  size(400, 400);
  noStroke();
  background(0);
};
//Function to create an eye
void eye(float ex, float ey,float r){
  float x;
  float y;
  //The white part
  fill(255);
  ellipse(ex, ey, r, r);
  //This talks about creating & normalizing a vector for the blue part
  if (( sqrt( pow(mouseX-ex, 2) + pow(mouseY-ey, 2) )) > (r/5)){
    x=ex + (r/5)*(mouseX-ex)/( sqrt( pow(mouseX-ex , 2) + pow(mouseY-ey , 2) +1));
    y=ey + (r/5)*(mouseY-ey)/( sqrt( pow(mouseX-ex , 2) + pow(mouseY-ey , 2) +1));
  }else{
    //If I'm within a range, I don't want to use the vector anymore
    x=mouseX;
    y=mouseY;
  }
  //This creates the bluepart
  fill(100, 100, 255);
  ellipse(x, y, r/2, r/2);
};
//3 random variables for the eye perameters
float a = random(1);
float b = random(1);
float c = random(1);
void draw() {
  background(0);
  //Create and animate the eyes
  eye((width-50)*a+50, (height-50)*b+50, 100*c+20);
  eye((width-50)*b+50, (height-50)*c+50, 100*a+20);
  eye((width-50)*c+50, (height-50)*a+50, 100*b+20);
};