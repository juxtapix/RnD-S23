/*
Check if a sensor is avaiable on the phone.
*/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor; 

void setup() {
  fullScreen();

  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
  println("  ");
  
  if (sensor != null) {
    println("- Avaiable:");
    println(sensor);
  } else {
    println("- Not avaiable!");
  }
  
}

void draw() {
}
