<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/posts.php');
	include_once('../../database/groups.php');
	
	$id_logged = $_SESSION['id'];
	
	$event = listEvents($_SESSION['id']);
	$res = listGroups($id_logged);
	$groups = array_slice($res, 0, 3);
	
	$stmt = getFeedPosts($id_logged);
	$posts = $stmt->fetchAll();
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$smarty->assign('events', $event);
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('posts', $posts);
	$smarty->assign('groups', $groups);
	$smarty->assign('all_groups', $res);
	
	if (isset($_SESSION['previous'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['previous']) {
			unset($_SESSION['passwords']);
			unset($_SESSION['old-password']);
			unset($_SESSION['user_exists']);
			unset($_SESSION['email_exists']);
			unset($_SESSION['password-success']);
	   }
	}
	
	$smarty->display($BASE_DIR . 'templates/feed.tpl');
?>
