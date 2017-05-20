<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/posts.php');
	
	$id_logged = $_SESSION['id'];
	
	$stmt = getFeedPosts($id_logged);
	$posts = $stmt->fetchAll();

	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('posts', $posts);
	
	$smarty->display($BASE_DIR . 'templates/feed.tpl');
?>
