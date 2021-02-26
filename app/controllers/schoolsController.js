<<<<<<< HEAD:app/controllers/charactersListController.js
const { Characters } = require('../models/');

const charactersListController = {

  characters: async (req, res) => {
    try {
      const characters = await Characters.findAll();
      
      res.render('characters', { characters });
    } catch (err) {
      console.trace(err);
      res.status(500).send(err);
    }
  }
};

module.exports = charactersListController;
=======
const { Schools } = require('../models/');

const schoolsController = {

  characters: async (req, res) => {
    try {
      const schools = await School.findAll({
        association: "character",
        include: ['name'],
        order : [
          ['position', 'ASC'],
          ['character', 'id', 'ASC']
      ]
      });
      
      res.render('schools', { schools });
    } catch (err) {
      console.trace(err);
      res.status(500).send(err);
    }
  }

};


module.exports = schoolsController;
>>>>>>> schoolController:server/app/controllers/schoolsController.js
