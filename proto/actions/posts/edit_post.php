<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	
	$user_id = $_POST['user-id'];
	$post_id = $_POST['post-id'];
	$public = $_POST['public'];
	
	if (!strlen(trim($_POST['body']))){
		$body = null;
	} else {
		$body = $_POST['body'];
	}
	updatePost($post_id, $body, $public);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>