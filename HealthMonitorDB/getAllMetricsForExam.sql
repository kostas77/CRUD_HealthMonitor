SELECT name, date, metric_result, units, min_value_male, max_value_male FROM mydb.ExamResults 
inner JOIN mydb.Exams on ExamResults.exam_id=exams.id 
inner join mydb.healthmetrics on ExamResults.metric_id=healthmetrics.id
where exam_id = 1
order by metric_id asc;