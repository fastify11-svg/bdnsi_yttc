<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query('SELECT id, name FROM sessions');
while($r = $res->fetch_assoc()) {
    echo $r['id'] . ': ' . $r['name'] . "\n";
}
?>
