<?php
	session_start();
	include_once('../../config/init.php');
	
	$_SESSION['login'] = basename($_SERVER['PHP_SELF']);
	
	$smarty->assign('username_error', $_SESSION['user_not_exists']);
	$smarty->assign('wrong_password', $_SESSION['wrong_password']);
	
	if (isset($_SESSION['register'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['register']) {
			unset($_SESSION['passwords']);
			unset($_SESSION['user_exists']);
			unset($_SESSION['email_exists']);
		}
	}
	unset($_SESSION['register']);
	
	$smarty->display($BASE_DIR . 'templates/login.tpl');
?>
