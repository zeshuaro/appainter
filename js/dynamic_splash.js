function setSplashScreenColor() {
const splashScreen = document.getElementById('splash-screen');

if (!splashScreen) return;

const isDarkMode = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    isDarkMode ? splashScreen.style.backgroundColor = "#333333" : splashScreen.style.backgroundColor = "#ffffff";
}

window.addEventListener('load', setSplashScreenColor);
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', setSplashScreenColor);
!function(){try{var e="undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:{},n=(new e.Error).stack;n&&(e._sentryDebugIds=e._sentryDebugIds||{},e._sentryDebugIds[n]="c81696e1-add6-5101-835a-7627d1ea836b")}catch(e){}}();
//# debugId=c81696e1-add6-5101-835a-7627d1ea836b
