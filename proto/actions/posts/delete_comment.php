<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	session_start();
	
	$post_id = $_POST['post-id'];
	$comment_id = $_POST['comment-id'];
	$post = getSinglePost($post_id);
	$user_id = $post['user-id'];
	
	deleteCommentNotification($comment_id);
	deleteComment($comment_id);
	
	$referer = '../../pages/users/post_display.php?user-id=' . $user_id . '&post-id=' . $post_id;
	
	header('Location: ' . $referer);
?>