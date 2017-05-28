<?php
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	
	$group_id = $_POST['group-id'];
	$name = $_POST['name'];
	$public = $_POST['privacy'];
	
	if (!strlen(trim($_POST['about']))){
		$about = null;
	} else {
		$about = $_POST['about'];
	}
	
	updateGroup($group_id, $name, $public, $about);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);

?>