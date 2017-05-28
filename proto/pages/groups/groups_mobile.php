<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	include_once('../../database/users.php');

	$id_logged = $_SESSION['id'];
	$username_logged = $_SESSION['username'];
	$all_groups = listGroups($id_logged);
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$smarty->assign('character_name', $character_name);
	$smarty->assign('all_groups', $all_groups);
	$smarty->assign('username_logged', $username_logged);
	$smarty->assign('id_logged', $id_logged);
	
	if (isset($_SESSION['settings'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['settings']) {
			unset($_SESSION['passwords']);
			unset($_SESSION['old-password']);
			unset($_SESSION['user_exists']);
			unset($_SESSION['email_exists']);
			unset($_SESSION['password-success']);
	   }
	}
	unset($_SESSION['settings']);
	
	if (isset($_SESSION['previous_dates'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['previous_dates']) {
			unset($_SESSION['wrong_dates']);
	   }
	}
	unset($_SESSION['previous_dates']);
	
	$smarty->display($BASE_DIR . 'templates/groups_mobile.tpl');
?>