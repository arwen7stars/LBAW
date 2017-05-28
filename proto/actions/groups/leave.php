<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	
	$group_id = $_POST['group-id'];
	$id = $_SESSION['id'];
	
	leaveGroup($id, $group_id);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>