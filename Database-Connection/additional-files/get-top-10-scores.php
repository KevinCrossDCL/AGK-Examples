<?php
include "credentials.php";

// This bit of code will sort the scores in descending order so that the highest score is at the top and then it will select the top 10 rows from the table.
// I could have written SELECT * FROM scores instead of SELECT id, name, score FROM scores, but if you have a table with a lot of columns and you're only interested in a select few it's a good idea to select only those columns. Selecting fewer columns will increase query speeds when the table is large.
// The LIMIT command says how many records to return. In this example I'm returning 10. If you want to return all records then don't include the LIMIT command.
// The foreach loop will loop through each row and append the data to a JSON array and will then echo (print) it out which we can read in the AGK application.
// For some instructions on how to use the SELECT statement see: https://www.w3schools.com/sql/sql_select.asp
$JSON = array();
$query = $pdo->prepare("SELECT id, name, score FROM scores ORDER BY score DESC LIMIT 10");
$query->execute();
if ($query->rowCount() > 0) {
	foreach ($query as $row) {
		array_push($JSON, array(
			'id' => $row["id"],
			'name$' => $row["name"],
			'score' => $row["score"]
		));
	}
}
echo json_encode($JSON);

$query = null;
$pdo = null;
?>