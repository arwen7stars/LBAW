<?php

	include_once('../../config/init.php');
	
	$smarty->assign('username_error', $_SESSION['user_not_exists']);
	$smarty->assign('wrong_password', $_SESSION['wrong_password']);
	
	$smarty->display($BASE_DIR . 'templates/login.tpl');
?>
