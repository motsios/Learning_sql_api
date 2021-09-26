const Sequelize = require('sequelize')
const db = require('../database/db.js')
const { use } = require('../routes/api.js')
const Scores = require('./Score')
const SuccessRates = require('./SuccessRate')


const Users = db.sequelize.define('user_table',
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        first_name: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        last_name: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        phone: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        email: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: true
        },
        password: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        role: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        sex: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        verification_code: {
            type: Sequelize.STRING,
            allowNull: true,
        },
    },
    {
        tableName: 'user_table',
        timestamps: false
    },
)
Users.hasMany(Scores, {
    foreignKey: "student_id"
});
Users.hasMany(SuccessRates, {
    foreignKey: "id_student"
});

module.exports = Users