<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	
	$comment_id = $_POST['comment-id'];
	$post_id = $_POST['post-id'];
	
	$post = getSinglePost($post_id);
	
	$body = $_POST['body'];
	updateComment($comment_id, $body);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>