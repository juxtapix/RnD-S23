let flashLightStatus = false;

class flashlightHandler {
  static track; //the video track which is used to turn on/off the flashlight

  static accessFlashlight() {
    //Test browser support
    if (!('mediaDevices' in window.navigator)) {
      alert('Media Devices not available. Use HTTPS!');
      return;
    }

    //Get the environment camera (usually the second one)
    window.navigator.mediaDevices.enumerateDevices().then(devices => {
      const cameras = devices.filter(device => device.kind === 'videoinput');
      if (cameras.length === 0) {
        alert(
          'No camera found. If your device has camera available, check permissions.'
        );
        return;
      }

      const camera = cameras[cameras.length - 1];

      window.navigator.mediaDevices
        .getUserMedia({
          video: {
            deviceId: camera.deviceId,
          },
        })
        .then(stream => {
          this.track = stream.getVideoTracks()[0];

          if (!this.track.getCapabilities().torch) {
            alert('No torch available.');
          }
        });
    });
  }

  static setFlashlightStatus(status) {
    this.track.applyConstraints({
      advanced: [
        {
          torch: status,
        },
      ],
    });
  }
}

flashlightHandler.accessFlashlight();
document.getElementById('button').addEventListener('click', () => {
  flashlightHandler.setFlashlightStatus(!flashLightStatus);
  flashLightStatus = !flashLightStatus;
});
