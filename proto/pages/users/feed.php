<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

$smarty->assign('username_logged', $_SESSION['username']);

$smarty->assign('id_logged', $_SESSION['id']);
$smarty->display($BASE_DIR . 'templates/feed.tpl');
?>
