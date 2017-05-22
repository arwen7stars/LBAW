<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');

	$now = date('Y-m-d', time());

	$characters = getCharacters();
	$locations = getLocations();

	$smarty->assign('now', $now);
	$smarty->assign('password_error', $_SESSION['passwords']);
	$smarty->assign('username_error', $_SESSION['user_exists']);
	$smarty->assign('email_error', $_SESSION['email_exists']);
	$smarty->assign('characters', $characters);
	$smarty->assign('locations', $locations);

	$smarty->display($BASE_DIR . 'templates/signup.tpl');
?>
