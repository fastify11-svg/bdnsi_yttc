<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query("SELECT * FROM config_dictionaries");
while($r = $res->fetch_assoc()) {
    echo $r['key'] . ": " . $r['value'] . "\n";
}
?>
