<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query("SELECT duration, COUNT(*) as c FROM sessions GROUP BY duration ORDER BY duration");
while($r = $res->fetch_assoc()) {
    echo ($r['duration'] ?? 'NULL') . " months: " . $r['c'] . "\n";
}

echo "\n--- Students Group by duration ---\n";
$res = $m->query("SELECT course_duration, COUNT(*) as c FROM students GROUP BY course_duration ORDER BY course_duration");
while($r = $res->fetch_assoc()) {
    echo ($r['course_duration'] ?? 'NULL') . ": " . $r['c'] . "\n";
}

echo "\n--- Sessions with non-standard durations ---\n";
$res = $m->query("SELECT id, name, duration FROM sessions WHERE duration NOT IN (1,2,3,6,12,18,24,36,48) OR duration IS NULL");
while($r = $res->fetch_assoc()) {
    echo "ID " . $r['id'] . ": " . $r['name'] . " => " . ($r['duration'] ?? 'NULL') . "\n";
}
?>
