<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/posts.php');

	$recentNews = getRecentNews();
	//var_dump($recentNews);die();

	$smarty->assign('news', $recentNews);
	$smarty->display($BASE_DIR . 'templates/homepage.tpl');

?>