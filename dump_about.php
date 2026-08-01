<?php
$m = new mysqli('127.0.0.1', 'root', '', 'yttccomb_bdnsi');
$res = $m->query("SELECT value FROM config_dictionaries WHERE `key`='about_us'");
var_dump($res->fetch_assoc()['value']);
?>
