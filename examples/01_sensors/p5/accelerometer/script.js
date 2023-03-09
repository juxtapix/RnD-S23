const acl = new Accelerometer({ frequency: 60 });

function setup() {
  createCanvas(400, 400);
  textSize(32);
  text('x:', 10, 100);
  text('y:', 10, 150);
  text('z:', 10, 200);
  acl.addEventListener('reading', drawReading);
  acl.start();
}
function draw() {}

function drawReading() {
  background(255);
  text('Accelerometer', 10, 50);
  text(`x: ${acl.x.toFixed(5)}`, 10, 100);
  text(`y: ${acl.y.toFixed(5)}`, 10, 150);
  text(`z: ${acl.z.toFixed(5)}`, 10, 200);
}
