<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$id1 = $_POST['user1-id'];
	$id2 = $_SESSION['id'];
	
	acceptFriendship($id1, $id2);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>