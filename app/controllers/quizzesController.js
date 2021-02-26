const { Quiz } = require('../models/indexQuiz');

const mainController = {

  quizzes: async (req, res) => {
    try {
      const quizzes = await Quiz.findAll({
        include: ['author']
      });
      res.render('index', { quizzes });
    } catch (err) {
      console.trace(err);
      res.status(500).send(err);
    }
  }

};


module.exports = mainController;