//const tableName = 'school';
const client = require('../database');

const School = {
    getAllSchools: (callback) => {
        // 1. On écrit la requête
        const sql = `SELECT * FROM school`;

        // 2. On exécute la requête
        client.query( sql, (err, data) => {
            // 3. passer le resultat au callback
            const schools = data.rows;
            callback(err, schools );
        });
    },

getSchoolById: (id, callback) => {
    const sql = `SELECT * FROM "school" WHERE "id" = $1;`;
    const values = [id];
    client.query( sql, values, (err, data) => {
        // 3. transmetrte les infos au callback
        if (err) {
            console.log(err);
        }
        const school = data.rows[0];
        callback( err, school );
    });
}

};


module.exports = School;