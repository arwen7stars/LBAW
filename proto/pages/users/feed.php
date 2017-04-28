<?php
include_once('../../config/init.php');

$smarty->assign('username', $_SESSION['username']);



$smarty->display($BASE_DIR . 'templates/feed.tpl');
?>
