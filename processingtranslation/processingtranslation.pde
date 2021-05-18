float t = 0.0;
String myText = "click to pause/play, press r to reset canvas!";
import processing.svg.*;
//import processing.pdf.*;
boolean record;

void setup() {
  size(displayWidth, displayHeight);
  stroke(10, 100);
  noFill();
  background(255);
  frameRate(20);
  //createGraphics(displayWidth, displayHeight);
  //beginRecord(PDF, "everything.pdf");
}

void draw() {
  if (record) {
   // Note that #### will be replaced with the frame number. Fancy!
   beginRecord(SVG, "frame-####.svg");
  }
  push();
  fill(0);
  noStroke();
  textAlign(CENTER);
  textSize(24);
  text(myText, displayWidth/2, 0.8*displayHeight);
  pop();
  
//curves generating
  float x1 = width  * noise(t + 10);
  float x2 = mouseX * noise(t + 20);
  float x3 = width * noise(t + 30);
  float x4 = mouseX * noise(t + 40);
  float y1 = mouseY * noise(t + 50);
  float y2 = height * noise(t + 60);
  float y3 = mouseY * noise(t + 70);
  float y4 = height * noise(t + 80);

  bezier(x1, y1, x2, y2, x3, y3, x4, y4);

  t += 0.009;
  
  if (record) {
    endRecord();
  record = false;
  }
}
  

void mouseClicked() {
if (isLooping()) {
  noLoop();
} else {
loop(); }
}

void keyPressed() {
  if (keyCode == 82) {
  background(255);
  }
  if (keyCode == ENTER) {
    record = true;
  }
}
