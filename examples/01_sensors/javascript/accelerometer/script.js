const acl = new Accelerometer({ frequency: 60 });
acl.addEventListener('reading', () => {
  document.getElementById('x').innerText = `x: ${acl.x.toFixed(5)}`;
  document.getElementById('y').innerText = `y: ${acl.y.toFixed(5)}`;
  document.getElementById('z').innerText = `z: ${acl.z.toFixed(5)}`;
});

acl.start();
