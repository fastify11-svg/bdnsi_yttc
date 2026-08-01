<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query("SELECT `key`, `value` FROM config_dictionaries");
while($r = $res->fetch_assoc()) {
    if (strpos($r['value'], 'logo') !== false || strpos($r['value'], 'fav_icon') !== false) {
        echo "MATCH: " . $r['key'] . "\n";
    }
}
?>
