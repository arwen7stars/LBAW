<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/posts.php');
	include_once('../../database/groups.php');
	include_once('../../database/events.php');
	
	$id_logged = $_SESSION['id'];
	
	$all_events = listEvents($_SESSION['id']);
	$events = array_slice($all_events, 0, 3);
	$event_length = count($all_events);
	
	$all_groups = listGroups($id_logged);
	$group_length = count($all_groups);
	$groups = array_slice($all_groups, 0, 3);
	
	$stmt = getFeedPosts($id_logged);
	$posts = $stmt->fetchAll();
	$character_name = getUserCharacterName($_SESSION['username']);
	
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('posts', $posts);
	
	$smarty->assign('groups', $groups);
	$smarty->assign('events', $events);
	$smarty->assign('all_groups', $all_groups);
	$smarty->assign('all_events', $all_events);
	$smarty->assign('length_group', $group_length);
	$smarty->assign('length_event', $event_length);

	
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
