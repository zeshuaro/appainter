function setSplashScreenColor() {
const splashScreen = document.getElementById('splash-screen');

if (!splashScreen) return;

const isDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    isDarkMode ? splashScreen.style.backgroundColor = "#333333" : splashScreen.style.backgroundColor = "#ffffff";
}

window.addEventListener('load', setSplashScreenColor);
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', setSplashScreenColor);