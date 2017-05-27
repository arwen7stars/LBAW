<?php
include_once('../../config/init.php');
include_once('../../database/posts.php');

$recentNews = getRecentNews();

$smarty->assign('news', $recentNews);
$smarty->display($BASE_DIR . 'templates/homepage.tpl');

?>