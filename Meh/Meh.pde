
float i=0;
void setup(){
  size(800, 800);
};
void draw(){
  //background(random(255), random(255), random(255));
  if (mousePressed == true){
    background(mouseX*255/width, mouseY*255/height, 255);
    fill(0,(mouseY*255)/width, (mouseX*255)/height);
    ellipse(mouseX, mouseY, mouseY, mouseX);
  }
  stroke(255, (mouseX*255)/width, (mouseY*255)/height, 50);
  strokeWeight(20*mouseX/width + 20*mouseY/height);
  //println( "mouseX:" + mouseX, ", mouseY:"+mouseY);
  if (i<300){
    i++;
  }
  //println(i);
  ellipse(width/2, height/2, i, i);
  /*if (mousePressed == true){
    strokeWeight(20);
    stroke(255, (mouseX*255)/width, (mouseY*255)/height, i);
    point(mouseX, mouseY);
    i--;
  }else{
    i=100;
  }*/
};