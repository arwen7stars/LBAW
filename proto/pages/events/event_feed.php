<?php
include_once('../../config/init.php');
include_once('../../database/events.php');
include_once('../../database/posts.php');
include_once('../../database/users.php');

$event_list = listEvents($_SESSION['id']);
$events = getEventInfo($_GET['event-id']);
$character_name = getUserCharacterName($_SESSION['username']);
$eventPosts = getEventPosts($_GET['event-id']);

//var_dump($eventPosts);die();

$smarty->assign('event_posts', $eventPosts);
$smarty->assign('character_name', $character_name);
$smarty->assign('username_logged', $_SESSION['username']);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->assign('eventList', $event_list);
$smarty->assign('event', $events[0]);
$smarty->assign('username', $_SESSION['username']);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->display($BASE_DIR . 'templates/event.tpl');

?>