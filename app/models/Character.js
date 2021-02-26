//const tableName = 'character';
const client = require('../database');

const Character = {
    getAllCharacters: (callback) => {
        // 1. On écrit la requête
        const sql = `SELECT * FROM character`;

        // 2. On exécute la requête
        client.query( sql, (err, data) => {
            // 3. passer le resultat au callback
            const characters = data.rows;
            callback(err, characters );
        });
    },

getCharacterById: (id, callback) => {
    const sql = `SELECT * FROM "character" WHERE "id" = $1;`;
    const values = [id];
    client.query( sql, values, (err, data) => {
        // 3. transmetrte les infos au callback
        if (err) {
            console.log(err);
        }
        const character = data.rows[0];
        callback( err, character );
    });
}
// class Character {
//     constructor(data = {}) {
//         //super(data);
//         for (const prop in data) {
//             this[prop] = data[prop];
//         }
//       }
//         static async getAllCharacters(callback) {
//             try{  
//                 const sql =  await client.query(`SELECT * FROM character;`);
//                   return sql.rows;
//                 } catch (error) {
//                   console.log(error);
//                   res.status(500).render('500');
//                 }
//               }
//               static async getCharacterById(characterId) {
//                 try{  
//                     const character =  await client.query(`SELECT * FROM character WHERE "id" = $1;`, [characterId]);
//                     return character.rows[0];
//                     } catch (error) {
//                       console.log(error);
//                       res.status(500).render('500');
//                     }
//                   }
    //,
    // getTypes: (callback) => {
    //     // on execute qui prend un certain temps
    //     // quand query a fini il va executer la fonction qu'on lui donne en 2ème argument, on peut très bien lui passer la défintion de callback directement
    //     // db.query('SELECT * FROM "types";', callback);
    //     db.query('SELECT * FROM "type";', (error, result) => {
    //         callback(error, result);
    //     });
    // }
};


module.exports = Character;