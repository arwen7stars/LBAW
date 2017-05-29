<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	
	$user_id = $_POST['user-id'];
	$event_id = $_POST['event-id'];
	
	leaveEvent($user_id, $event_id);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>