#include "mbed.h"
#include "USBMouse.h"

USBMouse mouse;

void setup() {
  // Left Click
  mouse.click(MOUSE_LEFT);
  delay(1000);

  // Right Click
  mouse.click(MOUSE_RIGHT);
  delay(1000);

  // Double-click
  mouse.double_click();
  delay(1000);

  // Button Press (MOUSE_LEFT or MOUSE_RIGHT);
  mouse.press(MOUSE_LEFT);
  delay(2000);

  // Button Release (MOUSE_LEFT or MOUSE_RIGHT);
  mouse.release(MOUSE_LEFT);
  delay(1000);
}

void loop() {
  // Scroll Wheel (>0 to go down or <0 to go up)
  mouse.scroll(2000);
  delay(500);
}


int main(void)
{
  delay(100);
  setup();
  while (1) loop();
}
