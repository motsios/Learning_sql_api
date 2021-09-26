const Sequelize = require('sequelize')
const db = require('../database/db.js')
const { use } = require('../routes/api.js')
const sql_random_queries_true_or_false = db.sequelize.define('sql_random_queries_true_or_false',
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true
        },
        sql_query_true_or_false: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        exersice_table_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            onDelete: 'CASCADE',
        },
    },
    {
        tableName: 'sql_random_queries_true_or_false',
        timestamps: false
    },
)
module.exports = sql_random_queries_true_or_false