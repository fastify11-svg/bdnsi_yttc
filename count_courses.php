<?php

$file = 'C:\Users\Naeem\Downloads\yttccomb_application.sql';
$contents = file_get_contents($file);

preg_match_all('/INSERT INTO `subjects`.*?;/is', $contents, $matches);

$totalCourses = 0;
foreach ($matches[0] as $query) {
    // Count the number of tuples inserted in each query
    // Each tuple starts with ( and ends with ) and contains values. A simplistic count is counting the occurrences of "),(" plus 1
    $tuples = substr_count($query, '),(') + 1;
    $totalCourses += $tuples;
}
echo 'Total course tuples found: '.$totalCourses."\n";
