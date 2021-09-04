<?php
$SQLServer = "localhost";
$DBName = "agk_db_example"; // Replace with your projects database name
$DBUser = "root"; // Replace with the username required to connect to your MySQL server. MAMP's default username is root.
$DBPass = "root"; // Replace with the password required to connect to your MySQL server. MAMP's default password is root.
$pdo = new PDO("mysql:host=".$SQLServer.";dbname=".$DBName, $DBUser, $DBPass);
?>