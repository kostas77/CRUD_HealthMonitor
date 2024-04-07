SELECT 
  mydb.HealthMetrics.name,
  mydb.ExamResults.metric_result,
  mydb.HealthMetrics.min_value_male,
  mydb.HealthMetrics.max_value_male,
  mydb.HealthMetrics.units,
  mydb.Exams.date
FROM mydb.ExamResults
  INNER JOIN mydb.HealthMetrics
    ON mydb.HealthMetrics.id = mydb.ExamResults.metric_id
  INNER JOIN mydb.Exams
    ON mydb.ExamResults.exam_id = mydb.Exams.id