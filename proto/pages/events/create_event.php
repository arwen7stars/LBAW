<?php 

include_once('../../config/init.php');
include_once('../../database/users.php');

$username_logged = $_SESSION['username'];
$character_name = getUserCharacterName($_SESSION['username']);
	
$smarty->assign('character_name', $character_name);
$smarty->assign('username_logged',$username_logged);
$smarty->display($BASE_DIR . 'templates/create_event.tpl');
?>