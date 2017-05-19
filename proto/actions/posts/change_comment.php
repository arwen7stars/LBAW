<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	session_start();
	
	$comment_id = $_POST['comment-id'];
	$post_id = $_POST['post-id'];
	
	$post = getSinglePost($post_id);
	
	$body = $_POST['body'];
	updateComment($comment_id, $body);
	
	$referer = '../../pages/users/post_display.php?user-id=' . $post['user-id'] . '&post-id=' . $post_id;
	
	header('Location: ' . $referer);
?>