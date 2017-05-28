<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/posts.php');

	$recentNews = getRecentNews();

	if (isset($_SESSION['login'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['login']) {
			unset($_SESSION['user_not_exists']);
			unset($_SESSION['wrong_password']);
	   }
	}
	unset($_SESSION['login']);
	
	if (isset($_SESSION['register'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['register']) {
			unset($_SESSION['passwords']);
			unset($_SESSION['user_exists']);
			unset($_SESSION['email_exists']);
		}
	}
	unset($_SESSION['register']);

	$smarty->assign('news', $recentNews);
	$smarty->display($BASE_DIR . 'templates/homepage.tpl');

?>