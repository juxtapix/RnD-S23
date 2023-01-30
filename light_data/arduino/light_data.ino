#define threshold 24
#define aPin A0

boolean bits[256];  //Buffer to store the data
int index = 0;
unsigned long time;
int input = 255;


void setup(){
  Serial.begin(9600);
  analogReference(INTERNAL);  //Use the 1.1V internal reference
  delay(100);

  waitData();
}

void loop(){
  for(index = 0; index < 8; index++){

    input = max(1,analogRead(aPin)/4);

    if(input > threshold) bits[index] = true;
    else bits[index] = false;

    Serial.print(bits[index]);        //Outputs the interpreted value (1 or 0)

    while(micros() - time < 33300);   //Wait until time passes is equal to 33300uS
    time = micros();                  //reset the timer
  }
  Serial.println("");
  waitData();
}

void waitData(){
  Serial.print("Waiting for Data:");
  
  while(input > threshold){            //Wait for sensor value to fall below some threshold
    input = max(1,analogRead(aPin)/4);
  }
  delayMicroseconds(16000);           //Wait half a cycle
  time = micros();                    //Start the timer
}
