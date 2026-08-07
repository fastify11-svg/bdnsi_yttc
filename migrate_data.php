<?php

$host = '127.0.0.1';
$user = 'root';
$pass = '';

try {
    $tempDb = new PDO("mysql:host=$host;dbname=yttccomb_temp", $user, $pass);
    $mainDb = new PDO("mysql:host=$host;dbname=yttccomb_bdnsi", $user, $pass);
    
    $tempDb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $mainDb->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Disable foreign key checks
    $mainDb->exec('SET FOREIGN_KEY_CHECKS=0;');
    
    // Truncate tables in main DB
    $tables = ['config_dictionaries', 'sessions', 'centers', 'users', 'students'];
    foreach ($tables as $table) {
        $mainDb->exec("TRUNCATE TABLE `$table`");
        echo "Truncated $table...\n";
    }
    
    // Function to copy table
    function copyTable($tableName, $tempDb, $mainDb) {
        $stmt = $tempDb->query("SELECT * FROM `$tableName`");
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        if (empty($rows)) {
            echo "No rows in $tableName.\n";
            return;
        }
        
        $stmtMain = $mainDb->query("DESCRIBE `$tableName`");
        $mainCols = $stmtMain->fetchAll(PDO::FETCH_COLUMN);
        
        $columns = array_intersect(array_keys($rows[0]), $mainCols);
        $columnsStr = '`' . implode('`, `', $columns) . '`';
        $placeholders = ':' . implode(', :', $columns);
        
        $insertQuery = "INSERT INTO `$tableName` ($columnsStr) VALUES ($placeholders)";
        $insertStmt = $mainDb->prepare($insertQuery);
        
        foreach ($rows as $row) {
            $insertData = [];
            foreach ($columns as $col) {
                $insertData[$col] = $row[$col] ?? '';
            }
            $insertStmt->execute($insertData);
        }
        echo "Copied " . count($rows) . " rows to $tableName.\n";
    }
    
    foreach ($tables as $table) {
        copyTable($table, $tempDb, $mainDb);
    }
    
    // Re-enable foreign key checks
    $mainDb->exec('SET FOREIGN_KEY_CHECKS=1;');
    
    echo "Migration completed successfully!\n";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
