/*
https://developer.android.com/reference/android/hardware/Sensor#TYPE_GYROSCOPE
*/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
GyroscopeListener listener;
float gx, gy, gz;

void setup() {
  fullScreen();
  
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
  listener = new GyroscopeListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  
  textFont(createFont("SansSerif", 40 * displayDensity));
}

void draw() {
  background(0);
  text("X: " + gx + "\nY: " + gy + "\nZ: " + gz, 10, 10, width, height);
}

class GyroscopeListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    gx = event.values[0];
    gy = event.values[1];
    gz = event.values[2];    
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
