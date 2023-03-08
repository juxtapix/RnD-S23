void setup() {
  fullScreen();
  //orientation(LANDSCAPE);  // change the orientation
  noStroke();
  fill(0);
}

void draw() {
  background(220);
  if (mousePressed) {
    if (mouseX < width/2) {
      rect(0, 0, width/2, height); // Left
    } else {
      rect(width/2, 0, width/2, height); // Right
    }
  }
}
