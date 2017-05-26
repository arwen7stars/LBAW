<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

$events = getEventInfo($_GET['event-id']);
$character_name = getUserCharacterName($_SESSION['username']);


$smarty->assign('character_name', $character_name);
$smarty->assign('username_logged', $_SESSION['username']);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->assign('event', $events);
$smarty->assign('username', $_SESSION['username']);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->display($BASE_DIR . 'templates/event.tpl');

?>