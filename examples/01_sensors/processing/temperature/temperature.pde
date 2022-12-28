/*
https://developer.android.com/reference/android/hardware/Sensor#TYPE_AMBIENT_TEMPERATURE
 */

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
TempListener listener;
float t;

void setup() {
  fullScreen();

  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE);
  listener = new TempListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);

  textFont(createFont("SansSerif", 40 * displayDensity));
}

void draw() {
  background(0);
  text("T: " + t, 10, 10, width, height);
}

class TempListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    t = event.values[0];
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
