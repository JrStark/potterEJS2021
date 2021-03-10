const { Client } = require('pg');

// on tient compte d'Heroku
let client;
if (process.env.NODE_ENV && process.env.NODE_ENV === "production") { // prod
    client = new Client({
        connectionString: process.env.DATABASE_URL
    });
} else { // développement
    require('dotenv').config();
    client = new Pool();
}

// const posts = require('./posts.json');
// const categories = require('./categories.json');

// // IIFE : Immediately Invoked Function Expression

// (async () => {
//     await client.connect();

//     await client.query('DELETE FROM post;');
//     await client.query('DELETE FROM category;');

//     for (const cat of categories) {
//         await client.query('INSERT INTO category (label, route) VALUES ($1, $2);', [cat.label, cat.route]);
//     }

//     for (const post of posts) {
//         await client.query(`
//             INSERT INTO post (slug, title, excerpt, content, category_id)
//             SELECT $1, $2, $3, $4, id
//             FROM category
//             WHERE label = $5;
//         `, [
//             post.slug,
//             post.title,
//             post.excerpt,
//             post.content,
//             post.category
//         ]);
//     }

//     console.log('Données importées');
    
//     await client.end();
// })();
