import android.media.ToneGenerator;
import android.media.AudioManager;

ToneGenerator tonegenerator;
int duration;
int loudness;

void setup() {
  duration = 800; // miliseconds
  loudness = 100; // maximum
  tonegenerator = new ToneGenerator(AudioManager.STREAM_MUSIC, loudness );             
}


void draw() {
  
}

void mousePressed() {
  tonegenerator.startTone(1, duration);  // 0123456789ABCDE (0-15)
}
