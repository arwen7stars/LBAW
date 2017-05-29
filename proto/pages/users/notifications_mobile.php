<?php
	session_start();

	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$id_logged = $_SESSION['id'];
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$stmt = getNotifications($id_logged);
	$notifications = $stmt->fetchAll();
	
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('character_name', $character_name);
	$smarty->assign('notifications', $notifications);
	
	$smarty->display($BASE_DIR . 'templates/notifications_mobile.tpl');
?>