<?php
	session_start();
	include_once('../../config/init.php');
	
	if (isset($_SESSION['login'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['login']) {
			unset($_SESSION['user_not_exists']);
			unset($_SESSION['wrong_password']);
	   }
	}
	unset($_SESSION['login']);
	
	$smarty->display($BASE_DIR . 'templates/forgot_password.tpl');
?>