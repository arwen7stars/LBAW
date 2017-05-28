<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	if($_POST['cancel'] == "true"){
		$id1 = $_SESSION['id'];
		$id2 = $_POST['user2-id'];
		
		deleteFriendship($id1, $id2);
		deleteFriendshipNotification($id1, $id2);
	} else {
		$id1 = $_POST['user1-id'];
		$id2 = $_SESSION['id'];
		
		deleteFriendship($id1, $id2);
		deleteFriendshipNotification($id1, $id2);		
	}
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>