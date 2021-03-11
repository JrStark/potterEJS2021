// const pg = require("pg");

// // il faut définir les informations de connexion dans un .env
// const client = new pg.Client(process.env.PG_URL);

// // Je connecte mon client
// client.connect();

// // j'exporte mon module client
// module.exports = client;


const { Pool } = require('pg');

let clientPg;
if (process.env.NODE_ENV && process.env.NODE_ENV === "production") { // prod
    clientPg = new Pool({
        connectionString: process.env.DATABASE_URL
    });
} else { // développement
    clientPg = new Pool();
}

module.exports = clientPg;