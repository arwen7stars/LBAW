<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/images.php');

// global variables
$id = $_GET['user-id'];
$postid = $_GET['post-id'];
$location = getUserLocation($id);
$user = getUserInfo($id);
$username_page = $user['username'];

$character = getUserCharacter($username_page);
$image = getUserProfileImage($character['charid']);
$series = getAnime($character['charid']);

if(!empty($user['date-of-birth'])){
	
	$birthDate = explode("-", $user['date-of-birth']);

	//get age from date or birthdate (year[0] - month[1] - day[2])
	//mktime(hour, minute, second, month, day, year)
	$age = (date("md", date("U", mktime(0, 0, 0, $birthDate[1], $birthDate[2], $birthDate[0]))) > date("md")
		? ((date("Y") - $birthDate[0]) - 1)
		: (date("Y") - $birthDate[0]));
}

$smarty->assign('username_logged', $_SESSION['username']);
$smarty->assign('username_page', $username_page);
$smarty->assign('id', $id);
$smarty->assign('id_logged', $_SESSION['id']);
$smarty->assign('character', $character);
$smarty->assign('image', $image);
$smarty->assign('user_id', $id);
$smarty->assign('location', $location);
$smarty->assign('about', $user['about']);
$smarty->assign('name', $user['name']);
$smarty->assign('series', $series);
$smarty->assign('age', $age);

// fetch user timeline images
$stmt = getUserImages($id);
$res = $stmt->fetchAll();
$images = array_slice($res, 0, 6);
$smarty->assign('images', $images);

$post = getPost($postid);
$smarty->assign('post', $post);

$next_img = getNextImage($id, $post['imgid']);
$smarty->assign('nextimg', $next_img);

$previous_img = getPreviousImage($id, $post['imgid']);
$smarty->assign('previousimg', $previous_img);

$stmt = getCommentsPost($postid);
$comments = $stmt->fetchAll();
$smarty->assign('comments', $comments);

$smarty->display($BASE_DIR . 'templates/photo_display.tpl');
?>