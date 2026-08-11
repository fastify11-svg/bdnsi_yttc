<?php

$host = '127.0.0.1';
$user = 'root';
$pass = '';

try {
    $db = new PDO("mysql:host=$host;dbname=yttccomb_bdnsi", $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if user@gmail.com exists
    $stmt = $db->query("SELECT * FROM users WHERE email = 'user@gmail.com'");
    if ($stmt->rowCount() == 0) {
        $centerStmt = $db->query('SELECT id FROM centers LIMIT 1');
        $centerId = $centerStmt->fetchColumn();

        if ($centerId) {
            $insertQuery = "INSERT INTO users (name, username, email, phone, password, center_id) VALUES ('Demo User', 'demouser', 'user@gmail.com', '01700000001', '$2y$10\$C320LM1ayYxzBQn.AQcC9OSGNZorXXIma7zpusYz6O6o.gfKo10XK', :center_id)";
            $stmt = $db->prepare($insertQuery);
            $stmt->execute([':center_id' => $centerId]);
            echo "Inserted user@gmail.com\n";
        } else {
            echo "No centers found!\n";
        }
    } else {
        echo "user@gmail.com already exists.\n";
    }
} catch (Exception $e) {
    echo 'Error: '.$e->getMessage()."\n";
}
