<?php
include "credentials.php";

// Create a scores table if it does not exist with 3 columns: id, name, and score.
// The id column is set up with bigint to allow for a really large number of rows in the table. AUTO_INCREMENT means the id will increment each time a new row is added.
// For some instructions on how to use the CREATE TABLE statement check out: https://www.w3schools.com/sql/sql_create_table.asp
$query = $pdo->prepare("CREATE TABLE IF NOT EXISTS scores (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(25) NOT NULL,
	`score` int NOT NULL,
	PRIMARY KEY (id)
)");
$query->execute();

$query = null;
$pdo = null;
?>