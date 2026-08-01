<?php
$mysqli = new mysqli("127.0.0.1", "root", "");
$mysqli->query("CREATE DATABASE IF NOT EXISTS temp_import");
$mysqli->close();
?>
