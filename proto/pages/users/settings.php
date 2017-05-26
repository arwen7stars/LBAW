<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$_SESSION['previous'] = basename($_SERVER['PHP_SELF']);
	$id_logged = $_SESSION['id'];
	$character_name = getUserCharacterName($_SESSION['username']);

	$user = getUserInfo($id_logged);

	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $id_logged);
	$smarty->assign('user', $user);
	$smarty->assign('password_error', $_SESSION['passwords']);
	$smarty->assign('username_error', $_SESSION['user_exists']);
	$smarty->assign('email_error', $_SESSION['email_exists']);
	$smarty->assign('old_password', $_SESSION['old-password']);
	$smarty->assign('password_success', $_SESSION['password-success']);

	$smarty->display($BASE_DIR . 'templates/settings.tpl');
?>