const Sequelize = require('sequelize')
const db = require('../database/db.js')
const { use } = require('../routes/api.js')
const Scores = require('./Score')

const FillFields = db.sequelize.define('fill_fields_questions',
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        question: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        fill_field_question: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        hideWord: {
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        tableName: 'fill_fields_questions',
        timestamps: false
    },
)

module.exports = FillFields