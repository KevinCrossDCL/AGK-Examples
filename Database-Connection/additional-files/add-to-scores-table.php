<?php
include "credentials.php";

// The below if line is a very basic validation to check that the post data has values before attempting to add it to the table. 
// You may need to do further validation in a real project to make sure the data sent by the user is ok to use.
// The SQL command will add a new row at the end of the scores table.
// For some instructions on how to use the INSERT INTO statement check out: https://www.w3schools.com/sql/sql_insert.asp
// Because the id column has been set up to auto increment we use NULL for the value to let SQL set the id as the next increment.
// In the prepare function you will see things like :name and :score this is kind of saying to expect the values being supplied in variables called name and score.
// In the execute function you provide the variable name on the left and the value so for example 'name' => $_POST['name'] is saying that the variable name expected in the prepare function will be set with the value from the POST form data which is also called name
// Check out this page and look at some of the user supplied examples if it's not clear: https://www.php.net/manual/en/pdo.prepare.php
if ($_POST['name'] != "" && $_POST['score'] > 0) {
	$query = $pdo->prepare("INSERT INTO scores (
		id,
		name,
		score
	) values (
		NULL,
		:name,
		:score
	)");
	$result = $query->execute(array(
		'name' => $_POST['name'],
		'score' => $_POST['score']
	));
	if ($result == 1) {
		echo "Score added";
	} else {
		echo "Score not added";
	}
} else {
	echo "Name or score missing";
}

$query = null;
$pdo = null;
?>