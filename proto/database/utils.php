<?php

function getNextId($table) {
	global $db;
	
	$stmt = $db->prepare('select max(id) from Post');

	// fetch max id
	$stmt->execute(array($table));
	$maxId = (int) $row['max(id)'];

	//return next id
	return $maxId + 1;
}

?>