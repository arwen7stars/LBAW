<?php
	session_start();

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
	
	$stmt = getLocations();
	$locations = $stmt->fetchAll();
	
	if($event_id) {
		$valid = isEventValid($event_id);
	} else {
		$valid = false;
	}
	
	$smarty->assign('username_logged', $_SESSION['username']);
	$smarty->assign('id_logged', $_SESSION['id']);
	$smarty->assign('character_name', $character_name);
	
	if(!$valid) {
		$page_not_found = '404 Error. Page not found.';
		$smarty->assign('page_not_found', $page_not_found);
	} else {

		$posts = getEventPosts($event_id);
		$eventinfo = getEventInfo($event_id);
		$all_images = getEventImages($event_id);
		$location = getEventLocation($event_id);
		$belongs = isUserFromEvent($id_logged, $event_id);
		$admin = isUserEventAdmin($id_logged, $event_id);
		$now = date('Y-m-d', time());
		$guests = getEventGuests($event_id);

		
		if($eventinfo['public']){
			$public = 'Public';
		} else {
			$public = 'Private';
		}

		$smarty->assign('posts', $posts);
		
		$smarty->assign('belongs', $belongs);
		$smarty->assign('admin', $admin);
		
		$smarty->assign('eventinfo', $eventinfo);
		$smarty->assign('event_id', $event_id);
		$smarty->assign('privacy', $public);
		$smarty->assign('public', $eventinfo['public']);
		$smarty->assign('all_images', $all_images);
		$smarty->assign('location', $location);
		$smarty->assign('guests', $guests);
		$smarty->assign('locations', $locations);
		$smarty->assign('now', $now);
		
		$smarty->assign('groups', $groups);
		$smarty->assign('events', $events);
		$smarty->assign('all_groups', $all_groups);
		$smarty->assign('all_events', $all_events);
		$smarty->assign('length_group', $group_length);
		$smarty->assign('length_event', $event_length);
	}
	
	$smarty->display($BASE_DIR . 'templates/event.tpl');

?>