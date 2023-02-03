let str = 'Hello World!';
let processedStr = processString(str);

let start = false;
let letterIndex = 0;
let bitIndex = 0;

function setup() {
  createCanvas(400, 400);
  background(255);
  frameRate(5);
}

function draw() {
  if (start) {
    writeData();
  } else {
    background(200);
  }
}

function mouseClicked() {
  console.log(processedStr);
  start = true;
}

function writeData() {
  if (processedStr[letterIndex][bitIndex] == 1) {
    background(255);
  } else {
    background(0);
  }
  bitIndex++;
  if (bitIndex == 8) {
    bitIndex = 0;
    letterIndex++;
  }
  if (letterIndex == processedStr.length) {
    letterIndex = 0;
    start = false;
  }
}

function processString(str) {
  let arr = [];
  for (let i = 0; i < str.length; i++) {
    arr.push(processChar(str[i]));
  }
  arr.push('00000000');
  return arr;
}

function processChar(letter) {
  let num = letter.charCodeAt(0);
  let bin = num.toString(2);
  let binLength = 8 - bin.length;
  for (let i = 0; i < binLength; i++) {
    bin = '0' + bin;
  }
  return bin;
}
