<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	
	$user_id = $_POST['user-id'];
	$post_id = $_POST['post-id'];
	if($_POST['public']){
		$public = $_POST['public'];
	} else {
		$public = 't';
	}
	
	if (!strlen(trim($_POST['body']))){
		$body = null;
	} else {
		$body = $_POST['body'];
	}
	updatePost($post_id, $body, $public);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>