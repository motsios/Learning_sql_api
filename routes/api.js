var express = require('express')
var router = express.Router()
const sqldb_Web_App = require('../data/sqldb_Web_App.js')
const cors = require("cors")
const jwt = require("jsonwebtoken")
const jwt_decode = require('jwt-decode');
const fs = require('fs');
const dir = __dirname.substring(0, __dirname.indexOf("\\routes"))+ '/uploads';
//const dir = 'C:/Users/Pc/Desktop/diplwmatiki/learning-sql-api/uploads'
//const path = require('path');
//const dir = path.join(__dirname, '/uploads');
process.env.SECRETE_KEY = 'secret'

router.use(cors())

// *******************************************************************************************************
//  Verify Token START
// *******************************************************************************************************

function verifyTeacherToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'teacher') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

function verifyStudentToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'student') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

function verifyTeacherAndStudentToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'student' || decoded['role'] == 'teacher') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

// *******************************************************************************************************
// Verify Token END
// *******************************************************************************************************



// *******************************************************************************************************
//  PDF STORE STARTS
// *******************************************************************************************************

router.get('/allfiles', verifyTeacherAndStudentToken, async (req, res, next) => {
    var files = await fs.readdirSync(dir)
    console.log(files)
    if (files.length == 0) {
        res.send({ files: 'No Pdf yet' })
    } else {
        res.send({ files: files })
    }
});

router.get('/readfile/:file', verifyTeacherAndStudentToken, async (req, res, next) => {
    fs.readFile(dir + '/' + req.params.file, function read(err, data) {
        if (err) {
            throw err;
        }
        res.send({ files: data })
    });
});

router.get('/deletefile/:file', verifyTeacherToken, async (req, res, next) => {
    var deletefile = fs.unlinkSync(dir + '/' + req.params.file)
    console.log(deletefile)
    res.send({ result: 'Success' })
});

router.post('/upload', async (req, res) => {
    console.log(req.files);
    var file = req.files.file_upload
    var filename = file.name
    await file.mv(dir + '/' + filename, function (err) {
        if (err) {
            res.send({ error: err })
        } else {
            res.send({ result: "File Uploaded" })
        }
    })
});

// *******************************************************************************************************
//  PDF STORE ENDS
// *******************************************************************************************************


//get all users
router.get('/users', function (req, res, next) {
    sqldb_Web_App.getAllUsers(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});


//create a user
router.post('/register', function (req, res, next) {
    sqldb_Web_App.createUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//login a user
router.post('/login', function (req, res, next) {
    sqldb_Web_App.loginUser(req)
        .then(result => {
            let token = jwt.sign(result.dataValues, process.env.SECRETE_KEY, {
                expiresIn: 5440//dimiourgw to token
            })
            res.send({ userdetails: result.dataValues, token: token });
        })
        .catch(error => res.json({
            error: "Wrong username or password"
        }));
});

//edit a user
router.put('/editprofile/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.editUser(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//get all users
router.get('/allusers', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.getAllUsers(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ users: result });
            else
                res.json({
                    error: "There aren't users"
                })
        }).catch(error =>
            res.json({
                error: "There aren't users"
            }));
});


// *******************************************************************************************************
//  ENPOINTS ABOUT RESET PASSWORD STARTS
// *******************************************************************************************************

router.get('/findUser/:username', async (req, res, next) => {
    sqldb_Web_App.findUser(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There ins't this user"
                })
        }).catch(error =>
            console.log(error));
});
router.put('/resetpassword/:userid/:code', async (req, res, next) => {
    sqldb_Web_App.resetPassword(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

// *******************************************************************************************************
//  ENPOINTS ABOUT RESET PASSWORD ENDS
// *******************************************************************************************************


//get profile of each user
router.get('/profile/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.showProfileOfUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//get Quiz-scores of each user
router.get('/scores/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.scoreOfOneUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//get Test-rates of each user
router.get('/rates/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.rateOfOneUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//get Best Quiz-scores of all users 
router.get('/bestscores/:category', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.bestScoresOfAllUsers(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//add a Quiz-score
router.post('/addascore/:userid', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.addScore(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add a Test-rate
router.post('/addarate/:userid', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.addRate(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all Quiz-questions by difficulty
router.get('/getquestions/:difficulty', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get 15 Quiz-questions by difficulty
router.get('/get15quizquestions/:difficulty', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.get15QuizQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get 25 Quiz-questions by difficulty
router.get('/get25quizquestions/:difficulty', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.get25QuizQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//add a Quiz-question
router.post('/addquestion', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addQuestion(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//update a Quiz-question
router.put('/editquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.editSqlQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//delete a Quiz-question
router.delete('/question/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//create a table through web app with SQL QUERY
router.post('/createTable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.createTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all tables which edited from teachers written with SQL QUERY
router.get('/getalltables', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllTeachersTables(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There aren't tables"
                })
        }).catch(error =>
            console.log(error));
});

//get all data from a table which edited from teachers written with SQL QUERY
router.post('/getaldataofatable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllDataFromATable(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There aren't data"
                })
        }).catch(error =>
            console.log(error));
});

//delete a table which edited from teachers written with SQL QUERY
router.post('/deleteatable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteATable(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "Delete not working"
                })
        }).catch(error =>
            res.send({ error: error }));
});

//add random SQL-queries fill-field type for a table editing from a teacher 
router.post('/addarrayofqueries', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addRandomSqlQueries(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//add random SQL-queries true or false type for a table editing from a teacher 
router.post('/addarrayofqueriestrueorfalse', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addRandomSqlQueriesTrueOrFalse(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//get all random SQL-queries fill-field type for table editing from a teacher  
router.post('/getallsqlqueriesfromspecifictable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getSqlRandomQueriesForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//get all random SQL-queries true or false type for table editing from a teacher  
router.post('/getallsqlqueriestrueorfalsefromspecifictable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getSqlRandomQueriesTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//delete all random SQL-queries about specific table
router.delete('/deleteallsqlqueriesfromspecifictable/:tablename', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueriesForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});


//update one SQL-query fill-field type for table editing from a teacher
router.put('/updateonesqlqueryfromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.updateSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//update one SQL-query true or false type for table editing from a teacher  
router.put('/updateonesqlquerytrueorfalsefromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.updateSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//delete one SQL-query fill-field type for table editing from a teacher
router.delete('/deleteonesqlqueryfromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//delete one SQL-query true or false type for table editing from a teacher  
router.delete('/deleteonesqlquerytrueorfalsefromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add one SQL-query fill-field type for table editing from a teacher
router.post('/addonesqlqueryfromspecifictable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add one SQL-query true or false type for table editing from a teacher  
router.post('/addonesqlquerytrueorfalsefromspecifictable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//execute a sql query to table editing from a teacher  
router.post('/executesqlquery', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.executeSQLQuery(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//execute a sql SQL-query from Student and check if exists in Test
router.post('/executesqlquerystudent', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.executeSQLQueryFromStudent(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all fillfieldquestions
router.get('/getallfillfieldquestions', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllFillFieldQuestions(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get one fillfieldquestions by id
router.get('/getonefillfieldquestions/:id', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getOneFillFieldQuestions(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//add new question into fill_field_questions table
router.post('/addfillfieldquestion', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addFillFieldQuestion(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//update a fillfieldquestion
router.put('/editfillfieldquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.editFillFieldQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//delete a fillfieldquestion
router.delete('/deletefillfieldquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteFillFieldQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

module.exports = router;