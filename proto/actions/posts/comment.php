<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	session_start();
	
	$user_id = $_POST['user-id'];
	$post_id = $_POST['post-id'];
	
	if (!strlen(trim($_POST['body']))){
		$body = null;
	} else {
		$body = $_POST['body'];
		
		addCommentPost($body, $user_id, $post_id);
	}
	
	if($_POST['profile'] == "true") {
		$referer = '../../pages/users/profile_feed.php?user-id=' . $user_id;
	} else {
		$referer = '../../pages/users/photo_display.php?user-id=' . $user_id . '&post-id=' . $post_id;
	}
	header('Location: ' . $referer);
?>