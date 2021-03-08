const School = require('../models/School');

const schoolController = {
    // méthode pour la page d'accueil
  schools: (request, response) => {
    // on appelle la méthode pour récupérer les schools,
    // Et on définit le callback, avec une erreur potentielle, et les schools demandées
    School.getAllSchools( (err, schools) => {
      // traitement d'erreur
      if (err) {
        console.error(err);
        // on affiche l'erreur, telle qu'elle, dans le navigateur
        response.status(500).send(err);
      } else {

        // pas d'erreur => on envoie les school dans la view !
        response.render('schools', {schools} );
      }
    });

  },

  // méthode pour la page article
  school: (request, response, next) => {
    // on récupère l'id de l'article cible dans l'url
    const schoolId = request.params.id;

    // on va cherhcer l'info dans la bdd
    School.getSchoolById(schoolId, (err, school) => {
      // traitement d'erreur
      if (err) {
        console.error(err);
        // on affiche l'erreur, telle qu'elle, dans le navigateur
        response.status(500).send(err);
      } else {

        // on oublie pas le traitement des 404 ! 
        if (!school) {
          next();
        } else {
          // on a les infos, on les transmet à la view
          response.render('school', {school});
        }

      }
    });
  },
    // une méthode pour gérer les 404
    notFound: (req, res) => {
      res.status(404).render('404');
    }

};
  
  module.exports = schoolController;