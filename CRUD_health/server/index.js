const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const mysql = require('mysql')

const connection = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'password',
    database: 'mydb'
})

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

// app.get("/" , (req, res) => {
//     res.send("hello world")
// });

// connection.connect((err) => {
//     console.log('connected as id ' + connection.threadId)
// });

// connection.query('SELECT 1 + 1 AS solution', (error, results, fields) => {
//     console.log('The solution is: ', results[0].solution);
// });

app.get('/api/get', (req, res) => {
    const sqlSelect = "SELECT * FROM mydb.HealthMetricsCategories"
    connection.query(sqlSelect, (err, result) => {
        console.log("Error is: ", err);
        console.log("Running SQL query");
        console.log("SQL query result: ", result);
        res.send(result);
    });
})

app.get('/api/getAllMetricsForExam/:exam_id', (req, res) => {
    const examId = req.params.exam_id;
    const sqlSelect =
        "SELECT name, date, metric_result, units, min_value_male, max_value_male FROM mydb.ExamResults \n" +
        "inner JOIN mydb.Exams on ExamResults.exam_id=exams.id \n" +
        "inner join mydb.healthmetrics on ExamResults.metric_id=healthmetrics.id\n" +
        "where exam_id = ?\n" +
        "order by metric_id asc;"
    connection.query(sqlSelect, [examId], (err, result) => {
        console.log("Error is: ", err);
        console.log("Running SQL query");
        console.log("SQL query result: ", result);
        res.send(result);
    });
})

app.get('/api/getAllExamResultsForMetric/:metric_id', (req, res) => {
    const metricId = req.params.metric_id;
    const sqlSelect =
        "SELECT name, date, metric_result, units, min_value_male, max_value_male FROM mydb.ExamResults\n" +
        "inner JOIN mydb.Exams on ExamResults.exam_id=exams.id \n" +
        "inner join mydb.healthmetrics on ExamResults.metric_id=healthmetrics.id \n" +
        "where metric_id = ?\n" +
        "order by date asc;"
    connection.query(sqlSelect, [metricId], (err, result) => {
        console.log("Error is: ", err);
        console.log("Running SQL query");
        console.log("SQL query result: ", result);
        res.send(result);
    });
})

app.post("/api/insert", (req, res) => {
    const nameParam = req.body.nameParam;
    const addressParam = req.body.addressParam;
    const websiteParam = req.body.websiteParam;
    const sqlInsert = "INSERT INTO ExamProviders (name, address, website) VALUES (?, ?, ?)"
    connection.query(sqlInsert, [nameParam, addressParam, websiteParam], (err, result) => {
        console.log(result);
        console.log(err);
    })
});

app.listen(3001, () => {
    console.log("Running on port 3001");
})