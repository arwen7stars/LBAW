<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	
	$name = $_POST['group_name'];
	$public = $_POST['group_privacy'];
	
	if (!strlen(trim($_POST['body']))){
		$about = null;
	} else {
		$about = $_POST['group_description'];
	}
	
	$user_id = $_SESSION['id'];
	$admin = 't';
	
	$group_id = addGroup($name, $public, $about);
	addUserGroup($user_id, $group_id, $admin);
	
	header('Location: ../../pages/users/feed.php');

?>
