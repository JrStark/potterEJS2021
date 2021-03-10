// const pg = require("pg");

// // il faut définir les informations de connexion dans un .env
// const client = new pg.Client(process.env.PG_URL);

// // Je connecte mon client
// client.connect();

// // j'exporte mon module client
// module.exports = client;


const { Pool } = require('pg');

// avant, on utilisait Client
// mais Client ne crée qu'une seule connexion
// ce qui peut être insuffisant si on doit gérer des grosses volumétries
// ex: beaucoup de lecteurs en même temps qui demandent beaucoup d'articles
// et surtout, un Client doit être connecté pour que la requête soit envoyée
// et la connexion d'un Client est async, il faut l'await...
// ce qu'on ne peut pas faire dans le contexte global de Node
// la plupart du temps, on se contente de lancer la méthode connect() sans l'attendre
// et on espère que quand on aura une première requête à faire, le Client sera connecté

// Pool change la donne en apportant une solution à ces 2 problèmes en même temps
// un Pool, c'est un ensemble de Clients maintenus connectés par Postgres
// de sorte que, quand quelqu'un a besoin de communiquer avec le SGBD, il puisse passer par ce Pool sans se soucier de :
// 1) connecter un client
// 2) attendre qu'il soit bien connecté
// 3) envoyer sa requête et recevoir sa réponse
// 4) déconnecter le client pour ne pas monopoliser une connexion ouverte
// avec un Pool, ce que fait un client désireux de communiquer avec le SGBD se limite au 3)
// il envoie sa requête au Pool directement et il reçoit ses données :-)
let clientPg;
if (process.env.NODE_ENV && process.env.NODE_ENV === "production") { // prod
    clientPg = new Pool({
        connectionString: process.env.DATABASE_URL
    });
} else { // développement
    clientPg = new Pool();
}

module.exports = clientPg;