<?php

include_once('../../config/init.php');

include_once($BASE_DIR . 'database/users.php');

// global variables
$character_name = getUserCharacterName($_SESSION['username']);
$smarty->assign('username', $character_name);
$smarty->assign('user_id', $_SESSION['id']);

// fetch user timeline imags
$stmt = getUserImages($_SESSION['id']);
$images = $stmt->fetchAll();
$smarty->assign('images', $images);

// fetch user posts
$stmt = getUserPosts($_SESSION['id']);
$posts = $stmt->fetchAll();
$smarty->assign('posts', $posts);

$smarty->display($BASE_DIR . 'templates/profile_feed.tpl');
?>
