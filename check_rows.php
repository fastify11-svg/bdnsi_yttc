<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
echo 'Students: ' . $m->query('SELECT COUNT(*) FROM students')->fetch_row()[0] . "\n";
echo 'Subjects: ' . $m->query('SELECT COUNT(*) FROM subjects')->fetch_row()[0] . "\n";
?>
