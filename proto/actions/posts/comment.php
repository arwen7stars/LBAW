<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	
	$user_id = $_POST['user-id'];
	$post_id = $_POST['post-id'];
	
	$post = getSinglePost($post_id);
	
	if (!strlen(trim($_POST['body']))){
		$body = null;
	} else {
		$body = $_POST['body'];
		
		addCommentPost($body, $user_id, $post_id);
	}
	
	if($_POST['group-id']){
		$group_id = $_POST['group-id'];
		$referer = '../../pages/users/post_display.php?user-id=' . $post['user-id'] . '&post-id=' . $post_id . '&group-id=' . $group_id;
	}
	else{
		$referer = '../../pages/users/post_display.php?user-id=' . $post['user-id'] . '&post-id=' . $post_id;
	}
	
	header('Location: ' . $referer);
?>