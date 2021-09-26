var express = require('express')
var bodyParser = require('body-parser')
var upload = require('express-fileupload')

var sql_api = require('./routes/api')
var cors = require('cors')

var port = 3000

var app = express()
app.use(upload())
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/api', sql_api)
app.listen(port, function () {
    console.log('Server started on port ' + port)
})