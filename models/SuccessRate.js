const Sequelize = require('sequelize')
const db = require('../database/db.js')
const SuccessRates = db.sequelize.define(
  'success_rate',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    id_student: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    rate: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    time: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    table_name: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    type_excersice: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    createdAt: {
      field: 'created_at',
      type: Sequelize.DATE,
    },
    updatedAt: {
      field: 'updated_at',
      type: Sequelize.DATE,
    },
  },
  {
    tableName: 'success_rate',
    timestamps: true
  }
)
module.exports = SuccessRates;
