<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	
	$admin_id = $_SESSION['id'];
	$user_id = $_POST['user-id'];
	$event_id = $_POST['event-id'];
	
	addEventInvite($admin_id, $user_id, $event_id);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>