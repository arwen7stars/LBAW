<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

//var_dump($_POST);die();

if ($_POST['event_start'] > $_POST['event_end'])
{
	header('Location: ../../pages/events/create_event.php');
}
else
{
	if ($_POST['event_privacy'] === "true")
		$public = '1';
	if ($_POST['event_privacy'] === "false")
		$public = '0';
	
	addEvent($_SESSION['id'], $_POST['event_name'], $_POST['event_start'], $_POST['event_end'], $public, $_POST['event_description'], $_POST['location']);
	header('Location: ../../pages/users/feed.php');
}



?>
