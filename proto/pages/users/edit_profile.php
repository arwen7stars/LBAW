<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$id_logged = $_SESSION['id'];
	
	$location = getUserLocation($id_logged);
	$user = getUserInfo($id_logged);
	$stmt = getLocations();
	$locations = $stmt->fetchAll();
	$now = date('Y-m-d', time());
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $id_logged);
	$smarty->assign('user', $user);
	$smarty->assign('date', $user['date-of-birth']);
	$smarty->assign('now', $now);
	$smarty->assign('location', $location);
	$smarty->assign('locations', $locations);

	$smarty->display($BASE_DIR . 'templates/edit_profile.tpl');
?>