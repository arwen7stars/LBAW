<?php
	session_start();
	include_once('../../config/init.php');

    global $dbh;
	$id1 = $_SESSION['id'];
	$id2= $_POST['user2-id'];
	$stmt = $dbh->prepare('INSERT INTO "Friendship" VALUES ( :id1 , :id2 ,false)');
	$stmt->bindParam(':id1', $id1);
	$stmt->bindParam(':id2', $id2);
	$stmt->execute();

	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>