<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	
	$admin_id = $_SESSION['id'];
	$user_id = $_POST['user-id'];
	$group_id = $_POST['group-id'];
	
	addGroupInvite($admin_id, $user_id, $group_id);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>