<?php
$mysqli = new mysqli("127.0.0.1", "root", "", "temp_import");
$res = $mysqli->query("SHOW TABLES");
while($row = $res->fetch_array()) echo $row[0]."\n";
?>
