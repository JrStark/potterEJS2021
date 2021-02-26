const Sequelize = require('sequelize');
const sequelize = require('../database');

class School extends Sequelize.Model {};

School.init({
  name: Sequelize.STRING
},{
  sequelize,
  tableName: "school"
});

module.exports = School;