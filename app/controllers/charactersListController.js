

const dataMapper = require('../dataMapper');

const characterListController = {
  characters: (req, res, next) => {
    
    dataMapper.getAllCharacters((characters) => {
        res.render('characters', {
          characters
        });
        console.log('characters')
    });
}
};

module.exports = characterListController;