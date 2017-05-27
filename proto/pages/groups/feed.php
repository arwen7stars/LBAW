<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/groups.php');

	$id_logged = $_SESSION['id'];
	$group = $_GET['group-id'];
	
	$belongs = isUserFromGroup($id_logged, $group);
	$username_logged = $_SESSION['username'];
	$character_name = getUserCharacterName($_SESSION['username']);
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
	
	$event = listEvents($_SESSION['id']);
	$res = listGroups($id_logged);
	
	$group_length = count($res);
	$groups = array_slice($res, 0, 3);
	
	$stmt = getGroupMembers($_GET['group-id']);
	$members = $stmt->fetchAll();
		
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $username_logged);
	$smarty->assign('id_logged', $id_logged);
	
	$smarty->assign('belongs', $belongs);
	$smarty->assign('posts', $posts);
	$smarty->assign('all_images', $images);
	$smarty->assign('group', $group);
	$smarty->assign('groupinfo', $group_info);
	$smarty->assign('privacy', $public);
	$smarty->assign('public', $group_info['public']);
	$smarty->assign('events', $event);
	$smarty->assign('groups', $groups);
	$smarty->assign('group_id', $_GET['group-id']);
	$smarty->assign('all_groups', $res);
	$smarty->assign('length_group', $group_length);
	$smarty->assign('members', $members);

	$smarty->display($BASE_DIR . 'templates/group.tpl');
?>