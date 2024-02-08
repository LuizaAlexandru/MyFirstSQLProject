const express = require('express')
var connection = require('./db/connection.js') ;


const app = express()

app.get('/', function (req, res) {
 connection.query('SELECT * FROM Professor', function (error, results, fields) {
   if (error) throw error;
   console.log('The professors was: ', results);
 });

 connection.end();

})

app.listen(3000)