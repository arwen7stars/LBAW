<?php
	session_start();

	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/groups.php');
	include_once('../../database/events.php');
	include_once('../../database/posts.php');
	
	$recentNews = getRecentNews();
	
	$id_logged = $_SESSION['id'];
	$group = $_GET['group-id'];
	
	$username_logged = $_SESSION['username'];
	$character_name = getUserCharacterName($_SESSION['username']);
	
	if($group) {
		$valid = isGroupValid($group);
	} else {
		$valid = false;
	}
	
	$smarty->assign('news',$recentNews[0]);
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $username_logged);
	$smarty->assign('id_logged', $id_logged);
	
	if(!$valid) {
		$page_not_found = '404 Error. Page not found.';
		$smarty->assign('page_not_found', $page_not_found);
	} else {
		$stmt = getNotifications($id_logged);
		$notifications = $stmt->fetchAll();
		$belongs = isUserFromGroup($id_logged, $group);
		$admin = isUserAdmin($id_logged, $group);
		
		$stmt = getGroupPosts($group);
		$posts = $stmt->fetchAll();
	
		$stmt = getGroupImages($group);
		$images = $stmt->fetchAll();
		
		$group_info = getGroup($group);
		
		if($group_info['public']){
			$public = 'public';
		} else {
			$public = 'private';
		}
	
		$all_events = listEvents($_SESSION['id']);
		$events = array_slice($all_events, 0, 3);
		$event_length = count($all_events);
		
		$all_groups = listGroups($id_logged);
		$group_length = count($all_groups);
		$groups = array_slice($all_groups, 0, 3);
		
		$stmt = getGroupMembers($_GET['group-id']);
		$members = $stmt->fetchAll();
		
		$smarty->assign('belongs', $belongs);
		$smarty->assign('admin', $admin);
		
		$smarty->assign('groupinfo', $group_info);
		$smarty->assign('privacy', $public);
		$smarty->assign('posts', $posts);
		$smarty->assign('members', $members);
		$smarty->assign('all_images', $images);
		$smarty->assign('notifications', $notifications);

		$smarty->assign('public', $group_info['public']);
		$smarty->assign('group_id', $group);
		
		$smarty->assign('groups', $groups);
		$smarty->assign('events', $events);
		$smarty->assign('all_groups', $all_groups);
		$smarty->assign('all_events', $all_events);
		$smarty->assign('length_group', $group_length);
		$smarty->assign('length_event', $event_length);
	}

	$smarty->display($BASE_DIR . 'templates/group.tpl');
?>