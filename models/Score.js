const Sequelize = require('sequelize')
const db = require('../database/db.js')
const Scores = db.sequelize.define(
  'score_table',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    student_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    score: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    time: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    category: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    difficulty: {
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
    tableName: 'score_table',
    timestamps: true
  }
)
module.exports = Scores;
