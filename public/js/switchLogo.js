let app = {
    // J'initialise mon app
    init: function () {
        app.addListenerToActions();
       // app.prepareListener();
        app.setHours();
    },

    // Cette fonction permet d'appeler la fonction qui modifie de theme en dark ou lihgt mode
    addListenerToActions: function() {
        const chk = document.getElementById('chk');
        chk.addEventListener('change', () => {
            app.darkOrLight();
        });
    },

        // Cette fonction permet de modifier le theme en dark ou lihgt mode
    darkOrLight: function () {
        const bg = document.getElementById('background');
        const logo = document.getElementById('logo');
        const soleil = document.getElementById('soleil');
        const body = document.getElementById('body');
        const fbackground = document.getElementById('fbackground');

        body.classList.toggle('dark');
        body.style.transition = "5s linear";
        bg.classList.toggle('dark');
        bg.style.transition = "5s linear";
        logo.classList.toggle('dark');
        logo.style.transition = "5s linear";
        soleil.classList.toggle('darkMoon');
        soleil.style.transition = "5s linear";
        fbackground.classList.add('dark');
        fbackground.style.transition = "5s linear";
    },
    
  // Fonction qui permet de changer de theme en fonction de l'heure qu'il est
    setHours: function(){
        let date = new Date();
        let hours = date.getHours();
        const body = document.getElementById('body');
        const background = document.getElementById('background');
        const fbackground = document.getElementById('fbackground');
        const soleil = document.getElementById('soleil');
        const h1 = document.getElementById('titleh1');
        const h2 = document.getElementById('h2_title');
        const logo = document.getElementById('logo');
        const switchBtn = document.getElementById('btnSwitchTheme');

        console.log(hours);
        
        if (hours > 19 || hours < 6 ){
            background.classList.add('night');
            background.style.transition = "5s linear";
            fbackground.classList.add('night');
            fbackground.style.transition = "5s linear";
            body.classList.add('night');
            body.style.transition = "5s linear";
            soleil.classList.toggle('moon');
            soleil.style.transition = "5s linear";
            logo.classList.toggle('dark');
            logo.style.transition = "5s linear";
            h2.style.color = '#ffffff';
        }
        else if (hours < 9 || hours >17){
            background.classList.add('sunlight');
            fbackground.classList.add('sunlight');
            body.classList.add('sunlight');
            soleil.classList.toggle('twilight');
            h1.style.color = '#ffffff';
            h2.style.color = '#FF8A0D';
            logo.classList.toggle('dark');
        }
        else if (hours >= 9 || hours < 17){
            background.classList.add('sun');
            background.style.transition = "5s linear";
            body.classList.toggle('sun');
            body.style.transition = "5s linear";
            fbackground.classList.add('sun');
            fbackground.style.transition = "5s linear";
            
        }
        else{
            background.classList.add('dark');
            background.style.transition = "5s linear";
            body.classList.add('dark');
            body.style.transition = "5s linear";
            soleil.classList.toggle('darkMoon');
            soleil.style.transition = "5s linear";
            logo.classList.toggle('dark');
            logo.style.transition = "5s linear";
            fbackground.classList.add('dark');
            fbackground.style.transition = "5s linear";
            h2.style.color = '#FF8A0D';
            h2.style.transition = "5s linear";
        }
    },
};
    document.addEventListener('DOMContentLoaded', app.init );

    