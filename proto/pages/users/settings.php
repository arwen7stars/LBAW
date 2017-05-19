<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

$id_logged = $_SESSION['id'];

$smarty->assign('username_logged', $_SESSION['username']);
$smarty->assign('id_logged', $id_logged);

$smarty->display($BASE_DIR . 'templates/settings.tpl');
?>