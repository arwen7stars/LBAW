<?php

	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');
	include_once($BASE_DIR . 'database/posts.php');

	$id = $_GET['user-id'];					// profile id
	$postid = $_GET['post-id'];				// post id

	$user = getUserInfo($id);
	$username_page = $user['username'];

	$character = getUserCharacter($username_page);
	$image = getUserProfileImage($character['charid']);
	$series = getAnime($character['charid']);
	$friendship = checkFriendship($_SESSION['id'], $id);		// check friendship between logged-in user and profile user

	$smarty->assign('username_logged', $_SESSION['username']);	// logged-in username
	$smarty->assign('username_page', $username_page);			// username of profile's user
	$smarty->assign('id_logged', $_SESSION['id']);				// logged-in id
	$smarty->assign('id', $id);									// id of profile's user
	
	$smarty->assign('character', $character);
	$smarty->assign('series', $series);
	
	$smarty->assign('image', $image);
	$smarty->assign('postid', $postid);
	$smarty->assign('friendship', $friendship);

	// get post
	$post = getPost($postid);
	$smarty->assign('post', $post);

	// get next photo
	$next_img = getNextImage($id, $post['imgid']);
	$smarty->assign('nextimg', $next_img);

	// get previous photo
	$previous_img = getPreviousImage($id, $post['imgid']);
	$smarty->assign('previousimg', $previous_img);

	// get post comments
	$stmt = getCommentsPost($postid);
	$comments = $stmt->fetchAll();
	$smarty->assign('comments', $comments);

	$smarty->display($BASE_DIR . 'templates/post_display.tpl');
?>