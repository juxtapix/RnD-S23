function setup() {
  createCanvas(400, 400);
  sensorInit();
}
function draw() {}

async function sensorInit() {
  const { state } = await navigator.permissions.query({
    name: 'ambient-light-sensor',
  });

  if (state !== 'granted') {
    console.warn("You haven't granted permission to use the light sensor");
    return;
  } else {
    text('Permission Granted', 50, 100);
  }

  const sensor = new AmbientLightSensor();

  sensor.addEventListener('reading', () => {
    background(0, 0, sensor.illuminance);
    text(sensor.illuminance, 50, 200);
  });

  sensor.addEventListener('error', err => {});

  sensor.start();
}
