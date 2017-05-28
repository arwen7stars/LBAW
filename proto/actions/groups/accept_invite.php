<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	
	$user_id = $_SESSION['id'];
	$group_id = $_POST['group-id'];
	
	$admin = 'f';
	$ignored = 'f';
	$accepted = 't';
	
	deleteGroupNotification($user_id, $group_id);
	updateGroupInvite($user_id, $ignored, $accepted, $group_id);
	addUserGroup($user_id, $group_id, $admin);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>