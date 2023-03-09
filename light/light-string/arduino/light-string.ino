#define THRESHOLD 15
#define A_PIN 34

bool bits[256]; // Buffer to store the data
unsigned long previous_time;
int input = 255;
int interval = 1000000 / 5; // 5 times per second
int counter = 8;
int counter2 = 8;
int letter = 0;

void setup()
{
  Serial.begin(115200);
  delay(100);
  waitData();
}

void loop()
{
  for (int i = 0; i < 8; ++i)
  {
    input = max(1, analogRead(A_PIN) / 4);
    if (input > THRESHOLD)
    {
      bits[i] = true;
      counter = 0;
      ++counter2;
      letter += pow(2, 7 - i);
    }
    else
    {
      bits[i] = false;
      ++counter;
      counter2 = 0;
    }
    while (micros() - previous_time < interval)
    {
    };
    previous_time = micros();
    if (counter == 8 || counter2 == 8)
    {
      waitData();
      break;
    }
  }
  Serial.print((char)letter);
  letter = 0;
}

void waitData()
{
  Serial.println("");
  Serial.println("Waiting for Data:");
  delay(500);
  counter = 0;
  input = max(1, analogRead(A_PIN) / 4);
  while (input > THRESHOLD)
  {
    input = max(1, analogRead(A_PIN) / 4);
    Serial.println(analogRead(A_PIN) / 4);
  }
  letter = 0;
  delayMicroseconds(interval / 2);
  previous_time = micros();
}