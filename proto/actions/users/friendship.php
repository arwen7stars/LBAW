<?php

//var_dump($_POST);
//die;
include_once('../../config/init.php');

if(isset($_POST['friendship_button'])) 
{ 
    global $dbh;
	$id1 = $_POST['user1'];
	$id2= $_POST['user2'];
	$stmt = $dbh->prepare('INSERT INTO "Friendship" VALUES ( :id1 , :id2 ,false)');
	$stmt->bindParam(':id1', $id1);
	$stmt->bindParam(':id2', $id2);
	$stmt->execute();
}
?>