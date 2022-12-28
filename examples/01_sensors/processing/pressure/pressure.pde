/*
Ambient pressure in hPa or mbar
https://developer.android.com/reference/android/hardware/Sensor#TYPE_PRESSURE
*/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
PressureListener listener;
float p;

void setup() {
  fullScreen();
  
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_PRESSURE);
  listener = new PressureListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  
  textFont(createFont("SansSerif", 40 * displayDensity));
}

void draw() {
  background(0);
  text("P: " + p, 10, 10, width, height);
}

class PressureListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    p = event.values[0];
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
