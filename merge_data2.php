<?php
$mysqli = new mysqli("127.0.0.1", "root", "", "yttccomb_bdnsi");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

echo "Merging subjects (courses)...\n";
$res = $mysqli->query("SHOW COLUMNS FROM temp_import.subjects");
$columns = [];
while ($row = $res->fetch_assoc()) {
    $columns[] = "`" . $row['Field'] . "`";
}
$colStr = implode(", ", $columns);

$query = "INSERT IGNORE INTO yttccomb_bdnsi.subjects ($colStr) SELECT $colStr FROM temp_import.subjects";
if ($mysqli->query($query)) {
    echo "Subjects merged successfully. Rows affected: " . $mysqli->affected_rows . "\n";
} else {
    echo "Error merging subjects: " . $mysqli->error . "\n";
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
