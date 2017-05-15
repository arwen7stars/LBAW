<?php

include_once('../../config/init.php');
$smarty->assign('username', $_SESSION['username']);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->display($BASE_DIR . 'templates/event.tpl');

?>