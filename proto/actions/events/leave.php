<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	
	$event_id = $_POST['event-id'];
	$id = $_SESSION['id'];
	
	leaveEvent($id, $event_id);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>