<?php
	session_start();
	include_once('../../config/init.php');
	$smarty->display($BASE_DIR . 'templates/forgot_password.tpl');
?>