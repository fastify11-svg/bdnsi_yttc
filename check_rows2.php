<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query('SHOW TABLES');
echo "Tables in yttccomb_bdnsi:\n";
while($r = $res->fetch_row()) {
    $table = $r[0];
    $count = $m->query("SELECT COUNT(*) FROM $table")->fetch_row()[0];
    echo "$table: $count rows\n";
}
?>
