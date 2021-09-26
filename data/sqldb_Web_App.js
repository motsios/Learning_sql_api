
var users = require('../models/User');
var scores = require('../models/Score');
var rates = require('../models/SuccessRate');
var questions = require('../models/Questions');
var randomQueries = require('../models/RandomQueries');
var randomQueriesTrueOrFalse = require('../models/RandomQueriesTrueOrFalse')
var excersice_tables = require('../models/ExcersiceTables')
var fill_field_questions = require('../models/Fill_Field_Questions')
var Sequelize = require("sequelize");
const bcrypt = require('bcryptjs');
const db = require('../database/db.js')
const nodemailer = require('nodemailer');
const { v4: uuidv4 } = require('uuid');
const { where } = require('sequelize');

var dbOperations = {

    createUser: async (req, res) => {
        const username = req.body.username;
        const password = req.body.password;
        const first_name = req.body.first_name;
        const last_name = req.body.last_name;
        const email = req.body.email;
        const role = req.body.role;
        const sex = req.body.sex;
        const phone = req.body.phone;
        const checkUserame = await users.findOne({
            where: {
                username: username
            }
        })
        if (!checkUserame) {
            const salt = bcrypt.genSaltSync(10);
            await users.create({
                username: username,
                password: bcrypt.hashSync(password, salt),
                first_name: first_name,
                last_name: last_name,
                phone: phone,
                email: email,
                role: role,
                sex: sex
            })
            return "Registration completed";
        } else {
            return "Username already exists";
        }
    },

    loginUser: async (req, res) => {
        const findUser = await users.findOne({
            attributes: ['id', 'first_name', 'last_name', 'email', 'phone', 'username', 'role', 'password'],
            where: {
                username: req.body.username,
            },
        });
        if (findUser != null) {
            if (bcrypt.compareSync(req.body.password, findUser.password)) {
                return findUser
            } else {
                return "Wrong username or password"
            }
        } else {
            return "Wrong username or password"
        }
    },

    editUser: async (req, res) => {
        if (req.body.password) {
            const salt = bcrypt.genSaltSync(10);
            req.body.password = bcrypt.hashSync(req.body.password, salt)
        }
        const checkUserame = await users.findOne({
            where: {
                id: req.params.userid
            }
        })
        if (checkUserame) {
            await users.update(
                req.body,
                { where: { id: checkUserame.id } }
            );
            return "Updated completed";
        } else {
            return "Username not exists";
        }
    },

    findUser: async (req, res) => {
        const findUser = await users.findOne({
            where: { username: req.params.username }
        });

        if (findUser) {
            let verification_code = uuidv4();
            await users.update({ verification_code }, { where: { id: findUser.id } });
            let transporter = nodemailer.createTransport({
                host: 'smtp.gmail.com',
                port: 465,
                secure: true, // true for 465, false for other ports
                auth: {
                    user: 'diplwmatikisql@gmail.com',
                    pass: 'xrisiDiplwmatikis!',
                },
            });

            const mailOptions = {
                from: '"Forgot My Password"', // sender address
                to: findUser.email, // list of receivers
                subject: 'Reset Password ✔', // Subject line
                text: 'Καλησπέρα σας,', // plain text body
                html:
                    '<p>Πατήστε <a href="http://localhost:4200/resetpassword' +
                    '/' +
                    findUser.id +
                    '/' +
                    String(verification_code) +
                    '"><button>ΕΔΩ</button></a> για αλλαγή του κωδικού πρόσβασης σας στην SQL web εφαρμογή!</p>', // html body
            };

            await transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.log(error)
                    return { error: 'There is not this email' };
                } else {
                    return 'Email just sended';
                }
            });
            return 'Email just sended';
        } else {
            return { error: 'There ins΄t this user' };
        }
    },

    resetPassword: async (req, res) => {
        const checkCode = await users.findOne({
            where: {
                id: req.params.userid,
                verification_code: req.params.code
            }
        })
        if (checkCode) {
            const salt = bcrypt.genSaltSync(10);
            req.body.password = bcrypt.hashSync(req.body.password, salt)

            await users.update(
                req.body,
                { where: { id: checkCode.id } }
            );
            await users.update({ verification_code: '' }, { where: { id: checkCode.id } })
            return "Updated completed";
        } else {
            return "Unauthorized";
        }
    },

    getAllUsers: async (req, res) => {
        return users.findAll()
    },

    showProfileOfUser: async (req, res) => {
        const findUserScore = await users.findOne({
            where: {
                id: req.params.userid,
            }
        });
        return findUserScore
    },

    scoreOfOneUser: async (req, res) => {
        const findUserScore = await users.findAll({
            where: {
                id: req.params.userid,
            },
            include: [{
                model: scores, separate: true,
                order: [['created_at', 'desc']]
            }],
        });
        return findUserScore
    },

    rateOfOneUser: async (req, res) => {
        const findUserScore = await users.findAll({
            where: {
                id: req.params.userid,
            },
            include: [{
                model: rates, separate: true,
                order: [['created_at', 'desc']]
            }],
        });
        return findUserScore
    },


    bestScoresOfAllUsers: async (req, res) => {
        var lowestToHighest = [];
        const findBestUserScore = await users.findAll({
            attributes: ['id', 'first_name', 'last_name', 'email', 'username'],
            where: { role: 'student' },
            include: [{
                model: scores, separate: true,
                where: { category: req.params.category },
                order: [['score', 'desc']], limit: 1
            }],
        });
        for (i in findBestUserScore) {
            if (findBestUserScore[i].score_tables.length != 0) {
                lowestToHighest.push(findBestUserScore[i])
            }
        }
        const ascentingArray = lowestToHighest.sort((a, b) => (a.score_tables[0].score < b.score_tables[0].score) ? 1 : -1)
        return ascentingArray
    },

    addScore: async (req, res) => {
        const userid = req.params.userid;
        const checkUserid = await users.findOne({
            where: {
                id: userid,
                role: 'student'
            }
        })
        if (checkUserid != null) {
            await scores.create({
                student_id: userid,
                score: req.body.score,
                category: req.body.category,
                difficulty: req.body.difficulty,
                time: req.body.time,
            })
            return "Score added";
        } else {
            return "This user are not a student";
        }
    },

    addRate: async (req, res) => {
        const userid = req.params.userid;
        const checkUserid = await users.findOne({
            where: {
                id: userid,
                role: 'student'
            }
        })
        if (checkUserid != null) {
            await rates.create({
                id_student: userid,
                rate: req.body.rate,
                table_name: req.body.table_name,
                type_excersice: req.body.type_excersice,
                time: req.body.time,
            })
            return "Rate added";
        } else {
            return "This user are not a student";
        }
    },


    getQuestionsByDifficulty: async (req, res) => {
        const difficulty = req.params.difficulty
        const hardoreasyquestions = await questions.findAll({
            where: {
                difficulty: difficulty
            }
        })
        return hardoreasyquestions;
    },

    get15QuizQuestionsByDifficulty: async (req, res) => {
        const difficulty = req.params.difficulty
        const hardoreasyquestions = await questions.findAll({
            order: Sequelize.literal('rand()'), where: {
                difficulty: difficulty,
            }, limit: 15
        }).then((encounters) => {
            return encounters;
        });
        return hardoreasyquestions;
    },

    get25QuizQuestionsByDifficulty: async (req, res) => {
        const difficulty = req.params.difficulty
        const hardoreasyquestions = await questions.findAll({
            order: Sequelize.literal('rand()'), where: {
                difficulty: difficulty,
            }, limit: 25
        }).then((encounters) => {
            return encounters;
        });
        return hardoreasyquestions;
    },

    addQuestion: async (req, res) => {
        const add = await questions.create(req.body, {})
        if (add) {
            return "Question added";
        } else {
            return "Question not added";
        }
    },

    editSqlQuestion: async (req, res) => {
        const checkuetion = await questions.findOne({
            where: {
                id: req.params.questionid
            }
        })
        if (checkuetion) {
            await questions.update(
                req.body,
                { where: { id: checkuetion.id } }
            );
            return "Updated completed";
        } else {
            return "Question not exists";
        }
    },

    deleteSqlQuestion: async (req, res) => {
        const checkuetion = await questions.findOne({
            where: {
                id: req.params.questionid
            }
        })
        if (checkuetion) {
            await questions.destroy(
                { where: { id: checkuetion.id } }
            );
            return "Deleted completed";
        } else {
            return "Question not exists";
        }
    },

    createTable: async (req, res) => {
        var tablename = req.body.tablename
        var sqlQueryString = req.body.sqlQueryString
        const exists = await db.sequelize.query(`SELECT *
            FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = 'diplwmatiki'
            AND TABLE_NAME = '${tablename}';`)
        if (exists[0].length == 1 && exists[1].length == 1)
            return 'Table already exists'
        else {
            await excersice_tables.create({
                table_name: tablename
            })
            await db.sequelize.query(sqlQueryString)
                .then(print => {
                    console.log(print)
                    return print
                })
        }
    },

    getAllTeachersTables: async (req, res) => {
        var tablenamelist = [];
        var tablecolumnslist = [];
        const alltables = await db.sequelize.query(`SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' AND TABLE_SCHEMA='diplwmatiki'`)
        for (i in alltables[0]) {
            if (alltables[0][i].TABLE_NAME != 'score_table' && alltables[0][i].TABLE_NAME != 'sql_questions' && alltables[0][i].TABLE_NAME != 'user_table' && alltables[0][i].TABLE_NAME != 'sql_random_queries' && alltables[0][i].TABLE_NAME != 'excersice_tables' && alltables[0][i].TABLE_NAME != 'fill_fields_questions' && alltables[0][i].TABLE_NAME != 'success_rate' && alltables[0][i].TABLE_NAME != 'sql_random_queries_true_or_false') {
                tablenamelist.push(alltables[0][i].TABLE_NAME)
            }
        }
        for (i in tablenamelist) {
            var temparray = []
            var temparray2 = []
            var getcolumns = await db.sequelize.query(`SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='${tablenamelist[i]}' AND TABLE_SCHEMA='diplwmatiki';`)
            var getForeignKeys = await db.sequelize.query(`SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME='${tablenamelist[i]}' AND TABLE_SCHEMA='diplwmatiki';`)

            for (j in getcolumns[0]) {
                temparray.push({
                    COLUMN_NAME: getcolumns[0][j].COLUMN_NAME, IS_NULLABLE: getcolumns[0][j].IS_NULLABLE, COLUMN_TYPE: getcolumns[0][j].COLUMN_TYPE,
                    COLUMN_KEY: getcolumns[0][j].COLUMN_KEY, EXTRA: getcolumns[0][j].EXTRA
                })
            }
            for (k in getForeignKeys[0]) {
                if (getForeignKeys[0][k] != undefined)
                    temparray2.push({ OTHER_VALUES: getForeignKeys[0][k] })
            }
            tablecolumnslist.push({ table_name: tablenamelist[i], temparray, temparray2 })
        }
        return tablecolumnslist
    },

    getAllDataFromATable: async (req, res) => {
        var sqlQueryString = req.body.sqlQueryString
        const data = await db.sequelize.query(sqlQueryString)
        if (data[0].length == 0 && data[1].length == 0)
            return 'Empty Table'
        else {
            return data
        }
    },

    deleteATable: async (req, res) => {
        var sqlQueryString = req.body.sqlQueryString
        const data = await db.sequelize.query(sqlQueryString).then(print => {
            console.log(print)
            return print
        })
        if (data[0].length == 0 && data[1].length == 0)
            return 'Empty Table'
        else {
            return data
        }
    },

    addRandomSqlQueries: async (req, res) => {
        const queriesArray = req.body.queriesArray
        const hiddenWordsArray = req.body.hiddenWordsArray
        console.log(queriesArray)
        console.log(req.body.table_name)
        const findTableFromExcersiceTable = await excersice_tables.findOne({
            where: {
                table_name: req.body.table_name
            }
        })
        for (question in queriesArray) {
            await randomQueries.create({
                sql_query: queriesArray[question],
                hideWord: hiddenWordsArray[question],
                table_id: findTableFromExcersiceTable.id
            })
        }
        return "Sql Queries successfully created!";
    },

    addRandomSqlQueriesTrueOrFalse: async (req, res) => {
        const queriesArray = req.body.queriesArray
        const findTableFromExcersiceTable = await excersice_tables.findOne({
            where: {
                table_name: req.body.table_name
            }
        })
        for (question in queriesArray) {
            await randomQueriesTrueOrFalse.create({
                sql_query_true_or_false: queriesArray[question],
                exersice_table_id: findTableFromExcersiceTable.id
            })
        }
        return "Sql Queries successfully created!";
    },

    getSqlRandomQueriesForSpecificTable: async (req, res) => {
        const table = await excersice_tables.findOne({
            where: {
                table_name: req.body.tablename
            }, include: [{ model: randomQueries, separate: true, }]
        })
        return table;
    },

    getSqlRandomQueriesTrueOrFalseForSpecificTable: async (req, res) => {
        const table = await excersice_tables.findOne({
            where: {
                table_name: req.body.tablename
            }, include: [{ model: randomQueriesTrueOrFalse, separate: true, }]
        })
        return table;
    },

    deleteSqlRandomQueriesForSpecificTable: async (req, res) => {
        const findTableid = await excersice_tables.findOne({
            where: {
                table_name: req.params.tablename
            }
        })
        console.log(findTableid)
        await randomQueries.destroy({
            where: {
                table_id: findTableid.id
            }
        })
        await randomQueriesTrueOrFalse.destroy({
            where: {
                exersice_table_id: findTableid.id
            }
        })
        const sql_queries = await excersice_tables.destroy({
            where: {
                table_name: req.params.tablename
            }
        })
        return sql_queries;
    },

    updateSqlRandomQueryForSpecificTable: async (req, res) => {
        const updateguery = await randomQueries.update(
            req.body,
            { where: { id: req.params.id } }
        );
        if (updateguery)
            return "Updated completed";
        else
            return "Updated not completed";
    },

    updateSqlRandomQueryTrueOrFalseForSpecificTable: async (req, res) => {
        const updateguery = await randomQueriesTrueOrFalse.update(
            req.body,
            { where: { id: req.params.id } }
        );
        if (updateguery)
            return "Updated completed";
        else
            return "Updated not completed";
    },

    deleteSqlRandomQueryForSpecificTable: async (req, res) => {
        const deletequery = await randomQueries.destroy({
            where: {
                id: req.params.id
            }
        })
        return deletequery;
    },

    deleteSqlRandomQueryTrueOrFalseForSpecificTable: async (req, res) => {
        const deletequery = await randomQueriesTrueOrFalse.destroy({
            where: {
                id: req.params.id
            }
        })
        return deletequery;
    },

    addSqlRandomQueryForSpecificTable: async (req, res) => {
        const findTableid = await excersice_tables.findOne({
            where: {
                table_name: req.body.tablename
            }
        })
        const createquery = await randomQueries.create({
            sql_query: req.body.sql_query,
            hideWord: req.body.hideWord,
            table_id: findTableid.id
        })
        return createquery;
    },

    addSqlRandomQueryTrueOrFalseForSpecificTable: async (req, res) => {
        const findTableid = await excersice_tables.findOne({
            where: {
                table_name: req.body.tablename
            }
        })
        const createquery = await randomQueriesTrueOrFalse.create({
            sql_query_true_or_false: req.body.sql_query,
            exersice_table_id: findTableid.id
        })
        return createquery;
    },

    executeSQLQuery: async (req, res) => {
        var sqlQuery = req.body.sqlQueryString
        var lowercasesqlQueryString = sqlQuery.toLowerCase()
        console.log(sqlQuery)
        if (lowercasesqlQueryString.includes('delete')) {
            console.log('fdsdfsdff')
            await db.sequelize.query(sqlQuery)
                .then(print => {
                    return print
                })
        } else {
            const results = await db.sequelize.query(sqlQuery)
            console.log(results[0])
            return results[0]
        }
    },


    executeSQLQueryFromStudent: async (req, res) => {
        var sqlQuery = req.body.sqlQueryString
        var lowercasesqlQueryString = sqlQuery.toLowerCase()
        console.log(sqlQuery)
        if (lowercasesqlQueryString.includes('delete')) {
            await db.sequelize.query(sqlQuery)
                .then(print => {
                    return print
                })
        } else {
            const results = await db.sequelize.query(sqlQuery)
            console.log(results[0])
            return results[0]
        }
    },

    getAllFillFieldQuestions: async (req, res) => {
        return await fill_field_questions.findAll({});
    },

    getOneFillFieldQuestions: async (req, res) => {
        return await fill_field_questions.findAll({ where: { id: req.params.id } });
    },

    addFillFieldQuestion: async (req, res) => {
        const add = await fill_field_questions.create(req.body, {})
        if (add) {
            return "Question added";
        } else {
            return "Question not added";
        }

    },

    editFillFieldQuestion: async (req, res) => {
        const checkuetion = await fill_field_questions.findOne({
            where: {
                id: req.params.questionid
            }
        })
        if (checkuetion) {
            await fill_field_questions.update(
                req.body,
                { where: { id: checkuetion.id } }
            );
            return "Updated completed";
        } else {
            return "Question not exists";
        }
    },

    deleteFillFieldQuestion: async (req, res) => {
        const checkuetion = await fill_field_questions.findOne({
            where: {
                id: req.params.questionid
            }
        })
        if (checkuetion) {
            await fill_field_questions.destroy(
                { where: { id: checkuetion.id } }
            );
            return "Deleted completed";
        } else {
            return "Question not exists";
        }
    },
}

module.exports = dbOperations;