<?php
include "credentials.php";

// This bit of code will delete a specific record/row matching the given ID.
// You can delete more than one record at a time by changing the WHERE clause.
// For instructions on how to use the DELETE statement see: https://www.w3schools.com/sql/sql_delete.asp
if ($_POST['id'] != "") {
	$query = $pdo->prepare("DELETE FROM scores WHERE id = :id");
	$query->execute(array('id' => $_POST['id']));
	$deletedCount = $query->rowCount();
	if ($deletedCount > 0) {
		echo "Score deleted";
	} else {
		echo "ID not found";
	}
} else {
	echo "ID missing";
}

$query = null;
$pdo = null;
?>