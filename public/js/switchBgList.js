// I create an script to go in Dark Mode

let app = {
    // Initialisation of the app
    init: function () {
        app.changeMode();
    },

    changeMode: function() {
        // I target the toggle button
        const btn = document.getElementById('btn');
        // I connect an event listenner
        btn.addEventListener('change', () => {
            app.darkMode();
        });
    },
    darkMode: function() {
        // I target the logo
        const logo = document.getElementById('logo');
        // I target the background in the body
        const body = document.getElementById('body');
        
        body.classList.toggle('dark');
        logo.classList.toggle('dark');
    }
};
    document.addEventListener('DOMContentLoaded', app.init );