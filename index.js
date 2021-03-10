// puisque dotenv est une dépendance de dév, on va détecter l'environnement de production et ne pas le charger si on y est
if (!process.env.NODE_ENV || process.env.NODE_ENV !== 'production') {
  require('dotenv').config();
}

// Premier reflexe : les variables d'environnement !
const dotenv = require('dotenv');
dotenv.config();
const PORT = process.env.PORT || 5050;
// le routage
const router = require('./app/router');
// et c'est parti pour Express !
const express = require('express');
//const session = require('express-session');
const app = express();

// réglages views
app.set('views', 'app/views');
app.set('view engine', 'ejs');
//app.set('views', __dirname + '/pages'); 
//app.set("models", "./app/models");
// les statiques
//app.use(express.static(__dirname + "/app/public"));
app.use(express.static('public'));
// on rajoute la gestion des POST body
app.use(express.urlencoded({extended: true}));

// et on rajoute la gestion des sessions

// app.use(session({
//   saveUninitialized: true,
//   resave: true,
//   secret: 'Un Super Secret'
// }));

// et hop, notre middleware magique
// const userMiddleware = require('./app/middlewares/user');
// app.use(userMiddleware);


app.use('/v1', router);

// lancement du serveur
app.listen(PORT, () => console.log(`Listening on http://localhost:${PORT}`));