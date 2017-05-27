<?php
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	include_once('../../database/groups.php');
	include_once('../../database/posts.php');
	include_once('../../database/users.php');
	
	$id_logged = $_SESSION['id'];
	$event_id = $_GET['event-id'];
	
	$all_events = listEvents($id_logged);
	$events = array_slice($all_events, 0, 3);
	$event_length = count($all_events);
	
	$all_groups = listGroups($id_logged);
	$group_length = count($all_groups);
	$groups = array_slice($all_groups, 0, 3);
	$character_name = getUserCharacterName($_SESSION['username']);

	$posts = getEventPosts($event_id);
	$eventinfo = getEventInfo($event_id);
	$all_images = getEventImages($event_id);
	
	if($eventinfo['public']){
		$public = 'public';
	} else {
		$public = 'private';
	}

	$smarty->assign('posts', $posts);

	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('character_name', $character_name);
	$smarty->assign('eventinfo', $eventinfo);
	$smarty->assign('event_id', $event_id);
	$smarty->assign('privacy', $public);
	$smarty->assign('all_images', $all_images);
	
	$smarty->assign('groups', $groups);
	$smarty->assign('events', $events);
	$smarty->assign('all_groups', $all_groups);
	$smarty->assign('all_events', $all_events);
	$smarty->assign('length_group', $group_length);
	$smarty->assign('length_event', $event_length);
	
	$smarty->display($BASE_DIR . 'templates/event.tpl');

?>