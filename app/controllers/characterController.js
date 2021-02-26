const Character = require('../models/Character');

const characterController = {
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
    // une méthode pour gérer les 404
    notFound: (req, res) => {
      res.status(404).render('404');
    }

};
  
  module.exports = characterController;

