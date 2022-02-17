#include "mbed.h"
#include "USBKeyboard.h"

USBKeyboard key;

void setup() {
  /*
    Media Control Keys:
    KEY_NEXT_TRACK, KEY_PREVIOUS_TRACK, KEY_STOP, KEY_PLAY_PAUSE, KEY_MUTE, KEY_VOLUME_UP, KEY_VOLUME_DOWN
  */
  for (int i = 0; i <= 16; i++) {
    key.media_control(KEY_VOLUME_DOWN);
    delay(300);
  }

  delay(2000);

  for (int i = 0; i <= 16; i++) {
    key.media_control(KEY_VOLUME_UP);
    delay(300);
  }

  delay(2000);
  key.media_control(KEY_MUTE);
}

void loop() {

}


int main(void)
{
  delay(100); // for the keyboard to have time to be recognised
  setup();
  while (1) loop();
}
