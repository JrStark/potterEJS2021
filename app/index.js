// puisque dotenv est une dépendance de dév, on va détecter l'environnement de production et ne pas le charger si on y est
if (!process.env.NODE_ENV || process.env.NODE_ENV !== 'production') {
  require('dotenv').config();
}
const express = require('express');
// Premier réflexe : les variables d'environnement !
// const dotenv = require('dotenv');
// dotenv.config();
const app = express();

// le routage
const router = require('router');
// et c'est parti pour Express !

//const session = require('express-session');

const PORT = process.env.PORT || 5050;

// réglages views
app.set('views', 'views');
app.set('view engine', 'ejs');
//app.set('views', __dirname + '/pages'); 
//app.set("models", "./app/models");
// les statiques
//app.use(express.static(__dirname + "/app/public"));
app.use(express.static('public'));
// on rajoute la gestion des POST body
app.use(express.urlencoded({extended: true}));

app.use('/v1', router);
// et on rajoute la gestion des sessions

// app.use(session({
//   saveUninitialized: true,
//   resave: true,
//   secret: 'Un Super Secret'
// }));

// et hop, notre middleware magique
// const userMiddleware = require('./app/middlewares/user');
// app.use(userMiddleware);
// lancement du serveur
app.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));