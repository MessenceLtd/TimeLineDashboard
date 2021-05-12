
var darkModeOn = false;

function createStorage(name, value) {
    localStorage.setItem(name, value);
}

function readStorage(name) {
    return localStorage.getItem(name);
}

function toggleDarkModeFromKeyBoard(e) {
    if (e.keyCode == 13) // return key
    {
        toggleDarkMode();
    }

    if (e.keyCode == 32) // space key
    {
        e.preventDefault();
    }

    return false;
}

function toggleDarkMode(e) {
    if (document.body.classList.contains("dark-mode")) {
        document.body.classList.remove("dark-mode");
        darkModeOn = false;
        createStorage("my_preferredMode", "light-mode");
        document.getElementById('darkMode').checked = false;
    } else {
        document.body.classList.add("dark-mode");
        darkModeOn = true;
        createStorage("my_preferredMode", "dark-mode");
        document.getElementById('darkMode').checked = true;
    }
}

document.addEventListener("DOMContentLoaded", function (event) {

    if (document.getElementById("darkMode")) {
        document.getElementById("darkMode").addEventListener('change', toggleDarkMode);
    }
});

document.addEventListener("DOMContentLoaded", function () {
    if (readStorage("my_preferredMode")) {
        if (readStorage("my_preferredMode") == "dark-mode") {
            darkModeOn = true;
        } else {
            darkModeOn = false;
        }
    } else {
        if (window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches) {
            darkModeOn = true;
        } else {
            if (document.body.classList.contains("dark-mode")) {
                darkModeOn = true;
            } else {
                darkModeOn = false;
            }
        }
    }

    if (darkModeOn) {
        if (!document.body.classList.contains("dark-mode")) {
            document.body.classList.add("dark-mode");
        }
        if (document.getElementById("darkMode")) {
            document.getElementById("darkMode").checked = true;
        }
    } else {
        if (document.body.classList.contains("dark-mode")) {
            document.body.classList.remove("dark-mode");
        }
    }
});