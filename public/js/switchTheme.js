let app = {
    // J'initialise mon app
    init: function () {
        app.changeBgLogin();
    },
    // Page Login et inscription

    changeBgLogin: function() {
        const chk = document.getElementById('chk');
        chk.addEventListener('change', () => {
            app.darkModeLogin();
        });
    },
    darkModeLogin: function() {
        const logo = document.getElementById('logo');

        // background de droite
        const bgRight = document.getElementById('bgRight');
        // Background de gauche
        const bgLeft = document.getElementById('bgLeft');
        // background central
        const train = document.getElementById('train');
        
        bgRight.classList.toggle('dark');
        bgRight.style.transition = "5s linear";
        logo.classList.toggle('dark');
        logo.style.transition = "5s linear";
        bgLeft.classList.toggle('dark');
        bgLeft.style.transition = "5s linear";
        train.classList.toggle('dark');
        train.style.transition = "5s linear";
    }
};
    document.addEventListener('DOMContentLoaded', app.init );

