let gyroscope = new Gyroscope({ frequency: 60 });

gyroscope.addEventListener('reading', e => {
  document.getElementById('x').innerText = `x: ${gyroscope.x.toFixed(5)}`;
  document.getElementById('y').innerText = `y: ${gyroscope.y.toFixed(5)}`;
  document.getElementById('z').innerText = `z: ${gyroscope.z.toFixed(5)}`;
});
gyroscope.start();
