const Sequelize = require('sequelize')
const db = {}
const sequelize = new Sequelize('db', 'username', 'password', {
    host: 'localhost',
    dialect: 'mysql',
    timezone: "+02:00",
    operatorsAliases: false,

    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
})
db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db
