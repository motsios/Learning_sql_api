const Sequelize = require('sequelize')
const db = require('../database/db.js')
const { use } = require('../routes/api.js')

const sql_questions = db.sequelize.define('sql_questions',
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
        a: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        b: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        c: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        d: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        correct_answer: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        score: {
            type: Sequelize.INTEGER,
            allowNull: false,
        },
        difficulty: {
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        tableName: 'sql_questions',
        timestamps: false
    },
)
module.exports = sql_questions