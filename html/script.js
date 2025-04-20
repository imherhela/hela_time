window.addEventListener('message', function(event) {
    const clock = document.getElementById("clock");

    if (event.data.type === "updateClock") {
        clock.innerHTML = event.data.time;
        clock.style.color = event.data.period === "AM" ? "lightblue" : "orange";
        clock.className = event.data.position || "bottom-center";
    }

    if (event.data.type === "toggleClock") {
        if (event.data.show) {
            // Smooth fade in + scale + black glow
            clock.style.display = "block";
            clock.style.transition = "opacity 0.7s ease, transform 0.7s ease, filter 0.7s ease";
            requestAnimationFrame(() => {
                clock.style.opacity = 1;
                clock.style.transform = "scale(1)";
                clock.style.filter = "drop-shadow(0 0 20px rgba(0,0,0,0.8))";
            });
        } else {
            // Smooth fade out + scale back + remove glow
            clock.style.transition = "opacity 0.7s ease, transform 0.7s ease, filter 0.7s ease";
            clock.style.opacity = 0;
            clock.style.transform = "scale(0.95)";
            clock.style.filter = "drop-shadow(0 0 0 rgba(0,0,0,0))";
            setTimeout(() => clock.style.display = "none", 700);
        }
    }
});
