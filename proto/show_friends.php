<?php
	include_once('database/init.php');
	
	$stmt = $dbh->prepare('SELECT id FROM "Anime"');
    $stmt->execute();
	$result= $stmt->fetchAll();
	foreach( $result as $row ){
		echo $row["id"];
	}
?>