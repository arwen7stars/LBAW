<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/groups.php');

	$id_logged = $_SESSION['id'];
	$group = $_GET['group-id'];
	
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
		
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $username_logged);
	$smarty->assign('id_logged', $id_logged);
	$smarty->assign('posts', $posts);
	$smarty->assign('all_images', $images);
	$smarty->assign('group', $group);
	$smarty->assign('groupinfo', $group_info);
	$smarty->assign('privacy', $public);

	$smarty->display($BASE_DIR . 'templates/group.tpl');
?>