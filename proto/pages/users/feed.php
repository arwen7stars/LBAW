<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

$character_name = getUserCharacterName($_SESSION['username']);
$smarty->assign('username', $character_name);

$smarty->assign('id_logged', $_SESSION['id']);
$smarty->display($BASE_DIR . 'templates/feed.tpl');
?>
