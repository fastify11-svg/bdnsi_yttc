<?php
$host = '145.79.212.19';
$db   = 'u881397359_bdnsi';
$user = 'u881397359_bdnsi';
$pass = 'NJnaeem11.';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
     $pdo = new PDO($dsn, $user, $pass, $options);
     $stmt = $pdo->query('SELECT * FROM students ORDER BY id DESC LIMIT 2');
     while ($row = $stmt->fetch())
     {
         echo json_encode($row) . "\n";
     }
} catch (\PDOException $e) {
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
