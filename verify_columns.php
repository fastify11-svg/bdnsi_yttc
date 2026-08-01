<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');

$res = $m->query('SHOW COLUMNS FROM students LIKE "payment_status"');
if($res->num_rows > 0) {
    echo "payment_status exists in students\n";
} else {
    echo "MISSING payment_status in students\n";
}

$res2 = $m->query('SHOW COLUMNS FROM sessions LIKE "duration_months"');
if($res2->num_rows > 0) {
    echo "duration_months exists in sessions\n";
} else {
    echo "MISSING duration_months in sessions\n";
}
?>
