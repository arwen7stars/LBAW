<?php 

include_once('../../config/init.php');
include_once('../../database/users.php');


$location = getUserLocation($id_logged);
$stmt = getLocations();
$locations = $stmt->fetchAll();
$username_logged = $_SESSION['username'];
$character_name = getUserCharacterName($_SESSION['username']);

$smarty->assign('location', $location);
$smarty->assign('locations', $locations);
$smarty->assign('character_name', $character_name);
$smarty->assign('username_logged',$username_logged);
$smarty->display($BASE_DIR . 'templates/create_event.tpl');
?>