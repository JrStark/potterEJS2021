const mainController = {
  homePage: (request, response) => {
      response.render('home.ejs');
  },

  notFound: (req, res) => {
      res.render('404');
  }

};

module.exports = mainController;