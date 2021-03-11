const mainController = {
  homePage: async (req, res) => {
    // on fait appel à notre modèle
    res.render('home');
  },

  notFound: (req, res) => {
      res.render('404');
  }

};

module.exports = mainController;