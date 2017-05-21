<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	session_start();
	
	$user_id = $_POST['user-id'];
	$name = $_POST['name'];
	
	if(empty($_POST['date'])) {
		$date = null;
	} else {
		$date = $_POST['date'];
	}
	
	if( $_POST['location'] == -1 ){
		$location = null;
	} else {
		$location = $_POST['location'];
	}
	
	if (!strlen(trim($_POST['about']))){
		$about = null;
	} else {
		$about = $_POST['about'];
	}
	
	updateUser($user_id, $name, $date, $location, $about);
	
	$referer = '../../pages/users/profile_feed.php?user-id=' . $user_id;
	
	header('Location: ' . $referer);
?>