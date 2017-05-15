<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

$id_logged = $_SESSION['id'];
$character_name = getUserCharacterName($_SESSION['username']);
$smarty->assign('username', $character_name);
$smarty->assign('id_logged', $id_logged);

$smarty->display($BASE_DIR . 'templates/settings.tpl');
?>