const express = require('express');

// importer les controllers
const mainController = require('./controllers/mainController');
const characterController = require('./controllers/characterController');
// const houseController = require('./controllers/houseController.js');
// const familyController = require('./controllers/familyController.js');
const schoolController = require('./controllers/schoolController.js');

// const organisationController = require('./controllers/organisationController.js');
// const spellsController = require('./controllers/spellsController.js');
// const quizController = require('./controllers/quizController');
// const tagController = require('./controllers/tagController');
const userController = require('./controllers/userController');
// const adminController = require('./controllers/adminController');

// importer les middlewares
//const adminMiddleware = require('./middlewares/admin');
  
const router = express.Router();

// page d'accueil
router.get('/', mainController.homePage);

// pages liées à PotterWorld et son wiki : 

// Liste de tous les personnages
router.get('/characters', characterController.characters );

// Page Character Details
router.get('/character/:id', characterController.character);
/*
// Page des maisons de Poudlard
router.get('/house', houseController);

// Page détails d'une maison
router.get('/house/:id', houseController);
*/
//Page des écoles de magie dans le monde
router.get('schools', schoolController.schools);
router.get('/school/:id', schoolController.school);
//Page de détails d'une école de magie
//router.get('/school/id:', schoolController);
/*
// Page contenant la liste de tous les sortilèges
router.get('/spells', spellsController);

// Page du détails d'un sortilège
router.get('/spell/:id', spellsController);

// Page contenant la liste des familles
router.get('/families', familyController);

// Page contenant le détails d'une famille
router.get('/family/:id', familyController);

// Page contenant la liste des organisations
router.get('/orgasniations', organisationController);

// page détails d'une organisation
router.get('/organisation/:id', organisation);

// Partie comprenant le PotterQuiz:

// page "quizz"
router.get('/quiz/:id', quizController.quizzPage);
router.post('/quiz/:id', quizController.quizzAnswer);

// page "tags" ("sujets")
router.get('/tags', tagController.tagList);

// quizzes par tag
router.get('/quizzes/tag/:id', quizController.listByTag);
*/
// user signup/login
router.get('/signup', userController.signupPage);
//router.get('/login', userController.loginPage);
/*
router.post('/signup', userController.signupAction);
router.post('/login', userController.loginAction);

router.get('/disconnect', userController.disconnect);

router.get('/profile', userController.profilePage);

// admin
router.get('/admin', adminMiddleware, adminController.adminPage);
*/

module.exports = router;