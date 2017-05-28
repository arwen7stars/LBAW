<?php
	session_set_cookie_params(3600, "/~lbaw1624/");
	error_reporting(E_ERROR | E_WARNING); // E_NOTICE by default
	$BASE_DIR = dirname(__FILE__) . '/../'; //FIXME
	$BASE_URL = '/~lbaw1624/proto/'; //FIXME
	$dbh = new PDO('pgsql:host=dbm.fe.up.pt;port=5432;dbname=lbaw1624', 'lbaw1624', 'sp58bd97');

	date_default_timezone_set("Europe/Lisbon");
	$db = pg_connect("host=dbm.fe.up.pt port=5432 dbname=lbaw1624 user=lbaw1624 password=sp58bd97");

	$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$dbh->exec('SET SCHEMA \'public\'');

	include_once($BASE_DIR . 'lib/smarty/Smarty.class.php');

	$smarty = new Smarty;
	$smarty->template_dir = $BASE_DIR . 'templates/';
	$smarty->compile_dir = $BASE_DIR . 'templates_c/';
	$smarty->assign('BASE_URL', $BASE_URL);

	$smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
	$smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
	$smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
	$smarty->assign('FORM_VALUES', $_SESSION['form_values']);
	$smarty->assign('USERNAME', $_SESSION['username']);

	unset($_SESSION['success_messages']);
	unset($_SESSION['error_messages']);  
	unset($_SESSION['field_errors']);
	unset($_SESSION['form_values']);
?>

