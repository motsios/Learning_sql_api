const Sequelize = require('sequelize')
const db = require('../database/db.js')
const { use } = require('../routes/api.js')
const sql_random_queries = db.sequelize.define('sql_random_queries',
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        sql_query: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        hideWord: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        table_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            onDelete: 'CASCADE',
        },
    },
    {
        tableName: 'sql_random_queries',
        timestamps: false
    },
)
module.exports = sql_random_queries