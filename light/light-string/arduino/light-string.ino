#define threshold 15
#define aPin 34

boolean bits[256];  //Buffer to store the data

unsigned long previousTime;
int input = 255;

int interval = 1000000 / 5;
int counter = 8;
int counter2 = 8;
int letter = 0;

void setup(){
  Serial.begin(115200);
  // analogReference(INTERNAL);  //Use the 1.1V internal reference
  delay(100);

  waitData();
}

void loop(){

  for(int index = 0; index < 8; index++){

    input = max(1,analogRead(aPin)/4);

    if(input > threshold) {
      bits[index] = true; 
      counter = 0;
      counter2++;
      letter += pow(2, 7 - index);
    }
    else {
      bits[index] = false;
      counter++;
      counter2 = 0;
    }

    //Outputs the interpreted value (1 or 0)
    // Serial.print(bits[index]);        


    while(micros() - previousTime < interval){

    };   //Wait until time passes is equal to 33300uS
    previousTime = micros();                  //reset the timer
    if(counter == 8 || counter2 == 8){
      waitData();
      break;  
    } 
  }
  Serial.print((char) letter);
  letter = 0;
}

void waitData(){
  Serial.println("");
  Serial.println("Waiting for Data:");
  delay(500);
  counter = 0;
  input = max(1,analogRead(aPin)/4);
  while(input > threshold){            //Wait for sensor value to fall below some threshold
    input = max(1,analogRead(aPin)/4);
    Serial.println(analogRead(aPin)/4);
  }
  letter = 0;
  delayMicroseconds(interval / 2);           //Wait half a cycle
  previousTime = micros();                    //Start the timer
}