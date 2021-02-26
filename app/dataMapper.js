const client = require('./database');

const dataMapper = {
    
        getAllCharacters: (callback) => {
            // 1. On écrit la requête
            const sql = `SELECT * FROM character`;
    
            // 2. On exécute la requête
            client.query(sql, (err, data) => {
                // 3. On récupère le résultat de la requête, et on le passe au callback
                if (err) {
                    console.log(err);
                } else {
                    callback(data.rows);
                }
            });
        },
    
    getCharacterById: (id, callback) => {
        const query = `SELECT * FROM "character" WHERE "id" = $1;`;
        client.query(query, [ id ], (error, result) => {
            callback(error, result);
        });
    }//,
    // getTypes: (callback) => {
    //     // on execute qui prend un certain temps
    //     // quand query a fini il va executer la fonction qu'on lui donne en 2ème argument, on peut très bien lui passer la défintion de callback directement
    //     // db.query('SELECT * FROM "types";', callback);
    //     db.query('SELECT * FROM "type";', (error, result) => {
    //         callback(error, result);
    //     });
    // }
};

module.exports = dataMapper;