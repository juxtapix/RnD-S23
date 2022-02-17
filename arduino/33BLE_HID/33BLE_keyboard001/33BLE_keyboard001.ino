#include "mbed.h"
#include "USBKeyboard.h"

USBKeyboard key;

void setup() {
  // Send a character
  key.key_code('z'); // "z"
  delay(1000);

  // Send a character with a modifier
  key.key_code('s', KEY_CTRL); // "CTRL + s" (save)
  delay(600);
  /*
    Modifiers Keys:
    KEY_CTRL, KEY_SHIFT, KEY_ALT, KEY_LOGO, KEY_RCTRL, KEY_RCTRL, KEY_RALT, KEY_RLOGO
  */
}

void loop() {
  // Press Function Keys
  key.key_code(LEFT_ARROW);
  delay(1000);
  key.key_code(RIGHT_ARROW);
  delay(1000);
  /*
    Function Keys:
    KEY_F1, KEY_F2, KEY_F3, KEY_F4, KEY_F5, KEY_F6, KEY_F7, KEY_F8, KEY_F9, KEY_F10, KEY_F11, KEY_F12
    KEY_PRINT_SCREEN, KEY_SCROLL_LOCK, KEY_CAPS_LOCK, KEY_NUM_LOCK, KEY_INSERT, KEY_HOME, KEY_PAGE_UP, KEY_PAGE_DOWN
    RIGHT_ARROW, LEFT_ARROW, DOWN_ARROW, UP_ARROW
  */
}


int main(void)
{
  delay(100); // for the keyboard to have time to be recognised
  setup();
  while (1) loop();
}
