/*
https://developer.android.com/reference/android/hardware/Sensor#TYPE_LIGHT
*/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
LightListener listener;
float l;

void setup() {
  fullScreen();
  
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_LIGHT);
  listener = new LightListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  
  textFont(createFont("SansSerif", 40 * displayDensity));
}

void draw() {
  background(0);
  text("L: " + l, 10, 10, width, height);
}

class LightListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    l = event.values[0];
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
