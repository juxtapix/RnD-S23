function updateSlider(sliderValue) {
    var output = document.getElementById("myValue");
    output.innerHTML = sliderValue;

    document.getElementById("myCircle").style.backgroundColor = "hsl(0, 0%, " + sliderValue + "%)";
}
