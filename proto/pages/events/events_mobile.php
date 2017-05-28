<?php
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	include_once('../../database/users.php');

	$id_logged = $_SESSION['id'];
	$username_logged = $_SESSION['username'];
	$all_events = listEvents($id_logged);
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$smarty->assign('character_name', $character_name);
	$smarty->assign('all_events', $all_events);
	$smarty->assign('username_logged', $username_logged);
	$smarty->assign('id_logged', $id_logged);
	
	$smarty->display($BASE_DIR . 'templates/events_mobile.tpl');
?>