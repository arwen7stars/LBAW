<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/events.php');

	unset($_SESSION['wrong_dates']);
	
	if ($_POST['event_start'] > $_POST['event_end'])
	{
		$_SESSION['wrong_dates'] = true;
		header('Location: ../../pages/events/create_event.php');
	}
	else
	{
		if ($_POST['event_privacy'] === "true")
			$public = '1';
		if ($_POST['event_privacy'] === "false")
			$public = '0';
		
		$user_id = $_SESSION['id'];
		$participation = $_POST['participation'];
		$admin = 't';
		
		$event_id = addEvent($_POST['event_name'], $_POST['event_start'], $_POST['event_end'], $public, $_POST['event_description'], $_POST['location']);
		addUserEvent($user_id, $event_id, $admin, $participation);
		
		header('Location: ../../pages/users/feed.php');
	}



?>
