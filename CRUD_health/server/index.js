const express = require('express')
const app = express()
const mysql = require('mysql')

const connection = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'K0$tas77',
    database: 'mydb'
})

// connection.connect((err) => {
    // console.log('connected as id ' + connection.threadId)
// });

// connection.query('SELECT 1 + 1 AS solution', (error, results, fields) => {
//     console.log('The solution is: ', results[0].solution);
// });
  
// app.get('/', (req, res) => {
//     const sqlSelectAllHealthMetrics = "SELECT source FROM mydb.Exams WHERE id = 1"
//     connection.query(sqlSelectAllHealthMetrics, (err, result) => {
//         console.log("Error is: ", err);
//         console.log("Running SQL query");
//         console.log("SQL query result: ", result);
//         res.send(result);
//     });
// })

app.post("/api/insert", (req, res) => {
    const sqlInsert = "INSERT INTO movie_reviews (movieName, movieReview) VALUES (?, ?)"

    connection.query(sqlInsert, [movieName, movieReview], (err, result) => {
        
    })
});

app.listen(3001, () => {
    console.log("Running on port 3001");
})