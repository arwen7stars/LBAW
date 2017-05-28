<?php
	session_start();
	
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	
	$event_id = $_POST['event-id'];
	
	$name = $_POST['name'];
	$public = $_POST['privacy'];
	$event_start = $_POST['event_start'];
	$event_end = $_POST['event_end'];
	$location_id = $_POST['location'];
	
	if (!strlen(trim($_POST['about']))){
		$about = null;
	} else {
		$about = $_POST['about'];
	}
	
	if($event_start > $event_end) {
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		die();
	}

	updateEvent($event_id, $name, $public, $event_start, $event_end, $location_id, $about);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);

?>