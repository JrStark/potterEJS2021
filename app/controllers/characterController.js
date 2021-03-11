const Character = require('../models/Character');

const characterController = {
  
  // characters: async (req, res) => {
  //   // on fait appel à notre modèle
  //   const characters = await Character.getAllCharacters();

  //   // et on retourne le tout au client
  //   res.render('characters');
  // },

  // character: async (req, res) => {
  //   const character = await Character.getCharacterById(req.params.id);

  //   if (character) {
  //       res.render('character');
  //   } else {
  //       res.status(404).json('no such character');
  //   }

    
  // },




    // autre version
    // méthode pour la page d'accueil
  characters: (request, response) => {
    // on appelle la méthode pour récupérer les characters,
    // Et on définit le callback, avec une erreur potentielle, et les characters demandées
    Character.getAllCharacters( (err, characters) => {
      // traitement d'erreur
      if (err) {
        console.error(err);
        // on affiche l'erreur, telle qu'elle, dans le navigateur
        response.status(500).send(err);
      } else {

        // pas d'erreur => on envoie les character dans la view !
        response.render('characters', {characters} );
      }
    });

  },

  // méthode pour la page article
  character: (request, response, next) => {
    // on récupère l'id de l'article cible dans l'url
    const characterId = request.params.id;

    // on va cherhcer l'info dans la bdd
    Character.getCharacterById(characterId, (err, character) => {
      // traitement d'erreur
      if (err) {
        console.error(err);
        // on affiche l'erreur, telle qu'elle, dans le navigateur
        response.status(500).send(err);
      } else {

        // on oublie pas le traitement des 404 ! 
        if (!character) {
          next();
        } else {
          // on a les infos, on les transmet à la view
          response.render('character', {character});
        }

      }
    });
  },
    

};
  
  module.exports = characterController;
