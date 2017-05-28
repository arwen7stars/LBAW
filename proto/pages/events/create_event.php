<?php 
	session_start();
	
	include_once('../../config/init.php');
	include_once('../../database/users.php');

	$id_logged = $_SESSION['id'];
	$location = getUserLocation($id_logged);
	$stmt = getLocations();
	$locations = $stmt->fetchAll();
	$username_logged = $_SESSION['username'];
	$character_name = getUserCharacterName($_SESSION['username']);
	$now = date('Y-m-d', time());
	
	$_SESSION['previous_dates'] = basename($_SERVER['PHP_SELF']);

	$smarty->assign('location', $location);
	$smarty->assign('locations', $locations);
	$smarty->assign('wrong_dates', $_SESSION['wrong_dates']);
	$smarty->assign('now', $now);
	
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged',$username_logged);
	$smarty->assign('id_logged',$id_logged);

	$smarty->display($BASE_DIR . 'templates/create_event.tpl');
?>