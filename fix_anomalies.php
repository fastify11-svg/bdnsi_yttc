<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');

// Fix Session 213 (Apr'23 To Mar'25)
$m->query("UPDATE sessions SET duration=24, exam_date='2025-03-20', result_published_date='2025-04-19' WHERE id=213");

// Fix Student typos
$m->query("UPDATE students SET course_duration='Two Years' WHERE course_duration IN ('2 Years', 'Two Year')");
$m->query("UPDATE students SET course_duration='Three Years' WHERE course_duration='3 Years'");
$m->query("UPDATE students SET course_duration='Three Months' WHERE course_duration='Three Month'");

// Re-sync session 213 students
$m->query("UPDATE students SET course_duration='Two Years', exam_date='2025-03-20', result_publised='2025-04-19' WHERE session_id=213");

echo "Fixed remaining anomalies.\n";
?>
