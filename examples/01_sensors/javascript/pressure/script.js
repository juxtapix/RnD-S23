window.addEventListener(
  'touchstart',
  e => {
    // Iterate through the list of touch points and log each touch
    // point's force.
    let html = '';
    for (let i = 0; i < e.targetTouches.length; i++) {
      // Add code to "switch" based on the force value. For example
      // minimum pressure vs. maximum pressure could result in
      // different handling of the user's input.
      console.log(`targetTouches[${i}].force = ${e.targetTouches[i].force}`);
      html += `${e.targetTouches[i].force} <br>`;
    }
    document.getElementById('pressure').innerHTML = html;
  },
  false
);
