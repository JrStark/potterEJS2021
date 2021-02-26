const { School } = require('../models');

const schoolController = {
    school: async (req, res) => {
        try {
          const school = await School.findOne({
            include: [
                { association: 'character' },
                { association: 'house' }
            ]
          });
          res.render('school', { school });
        } catch (err) {
          console.trace(err);
          res.status(500).send(err);
        }
      }
  
  };
  
  module.exports = schoolController;