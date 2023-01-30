//30 Frames per second
let fr = 30;

let status = false;
let bitNum = 0;            //The bit position

let bin = 0b11110000;      //Data in Binary

function setup() {
  createCanvas(400, 400);
  frameRate(2);
  background(200);
}

function draw() {
  start();
}

function start(){
  if(status == false){
    //Clear the display
    background(200);
    //Display the number
    fill(0,180,255);
    textSize(25);
    textAlign(CENTER);
    text("Click to Start", width/2, height/2);
  }

  if(status == true){
    frameRate(fr);
    dataTransfer();
  }
}

function mouseClicked(){
  status = true;
}

function dataTransfer(){
  console.log("--");

    if((bin >> bitNum) % 2 == 1){        //If the bit is a 1, flash white
      background(255);
    } else {                             //If the bit is a 0, flash black
      background(0);
    }
    bitNum++;

    if(bitNum > 7){
      bitNum = 0;
      status = false;
      console.log("Transfer Done!");
    }
}
