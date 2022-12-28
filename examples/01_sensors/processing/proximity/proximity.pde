/* 
https://developer.android.com/reference/android/hardware/Sensor#TYPE_PROXIMITY
*/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
ProximityListener listener;
float p;

void setup() {
  fullScreen();

  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_PROXIMITY);
  listener = new ProximityListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);

  textFont(createFont("SansSerif", 40 * displayDensity));
}

void draw() {
  background(0);
  text("P: " + p, 10, 10, width, height);
}

class ProximityListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    p = event.values[0];
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}
