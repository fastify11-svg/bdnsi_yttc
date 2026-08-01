<?php
$mysqli = new mysqli("127.0.0.1", "root", "", "yttccomb_bdnsi");
$mysqli->query("SET FOREIGN_KEY_CHECKS=0");

$res = $mysqli->query("SHOW TABLES FROM temp_import");
$tables = [];
while ($row = $res->fetch_row()) {
    $tables[] = $row[0];
}

foreach ($tables as $table) {
    if (in_array($table, ['migrations', 'users', 'config_dictionaries', 'course_subjects', 'mark_sheet_subjects', 'mark_sheets'])) {
        continue; 
    }

    // Check if table exists in yttccomb_bdnsi
    $check = $mysqli->query("SHOW TABLES LIKE '$table'");
    if ($check->num_rows == 0) {
        continue;
    }

    echo "Merging $table...\n";
    
    $old_res = $mysqli->query("SHOW COLUMNS FROM temp_import.$table");
    $old_cols = [];
    while ($r = $old_res->fetch_assoc()) { $old_cols[] = $r['Field']; }

    $new_res = $mysqli->query("SHOW COLUMNS FROM yttccomb_bdnsi.$table");
    $new_cols = [];
    while ($r = $new_res->fetch_assoc()) { $new_cols[] = $r['Field']; }

    $common_cols = array_intersect($old_cols, $new_cols);
    if (empty($common_cols)) continue;

    $colStr = implode(", ", array_map(function($c) { return "`$c`"; }, $common_cols));

    $query = "INSERT IGNORE INTO yttccomb_bdnsi.$table ($colStr) SELECT $colStr FROM temp_import.$table";
    if ($mysqli->query($query)) {
        echo "$table merged successfully. Rows affected: " . $mysqli->affected_rows . "\n";
    } else {
        echo "Error merging $table: " . $mysqli->error . "\n";
    }
}

$mysqli->query("SET FOREIGN_KEY_CHECKS=1");
$mysqli->close();
?>
