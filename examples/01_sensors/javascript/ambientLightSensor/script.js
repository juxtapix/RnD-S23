(async function () {
  const { state } = await navigator.permissions.query({
    name: 'ambient-light-sensor',
  });
  document.getElementById('permission').innerText = `Permission: ${state}`;

  if (state !== 'granted') {
    console.warn("You haven't granted permission to use the light sensor");
    return;
  }

  const sensor = new AmbientLightSensor();

  sensor.addEventListener('reading', () => {
    document.getElementById('reading').innerText = sensor.illuminance;
  });

  sensor.addEventListener('error', err => {
    document.getElementById('error').innerText = err;
  });

  sensor.start();
})();
