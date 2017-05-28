<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	
	$user_id = $_SESSION['id'];
	$event_id = $_POST['event-id'];
	$type = $_POST['type'];
	
	$admin = 'f';
	
	deleteEventNotification($user_id, $event_id);
	addUserEvent($user_id, $event_id, $admin, $type);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>