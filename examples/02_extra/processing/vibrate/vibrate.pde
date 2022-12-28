/*
Vibrate
*/

import android.content.Context;
import android.app.Activity;
import android.os.Vibrator;

Activity act;
Vibrator v;

void setup() {
  fullScreen();

  act = this.getActivity();
  v = (Vibrator) act.getSystemService(Context.VIBRATOR_SERVICE);
}

void draw() {
}

void mouseReleased() {
  v.vibrate(1000);
}
