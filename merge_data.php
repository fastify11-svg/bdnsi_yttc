<?php
$mysqli = new mysqli("127.0.0.1", "root", "", "yttccomb_bdnsi");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

echo "Merging courses...\n";
// The schemas might be slightly different. Let's use INSERT IGNORE with a list of columns.
// Better yet, since we might have added columns to `yttccomb_bdnsi`, we can do:
$res = $mysqli->query("SHOW COLUMNS FROM temp_import.courses");
$columns = [];
while ($row = $res->fetch_assoc()) {
    $columns[] = "`" . $row['Field'] . "`";
}
$colStr = implode(", ", $columns);

$query = "INSERT IGNORE INTO yttccomb_bdnsi.courses ($colStr) SELECT $colStr FROM temp_import.courses";
if ($mysqli->query($query)) {
    echo "Courses merged successfully. Rows affected: " . $mysqli->affected_rows . "\n";
} else {
    echo "Error merging courses: " . $mysqli->error . "\n";
}

echo "Merging students...\n";
$res = $mysqli->query("SHOW COLUMNS FROM temp_import.students");
$columns = [];
while ($row = $res->fetch_assoc()) {
    $columns[] = "`" . $row['Field'] . "`";
}
$colStr = implode(", ", $columns);

$query = "INSERT IGNORE INTO yttccomb_bdnsi.students ($colStr) SELECT $colStr FROM temp_import.students";
if ($mysqli->query($query)) {
    echo "Students merged successfully. Rows affected: " . $mysqli->affected_rows . "\n";
} else {
    echo "Error merging students: " . $mysqli->error . "\n";
}

$mysqli->close();
?>
