<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	session_start();
	
	$post_id = $_POST['post-id'];
	$post = getSinglePost($post_id);
	$user_id = $post['user-id'];
	$stmt = getImagePost($post_id);
	
	if($stmt->rowCount() > 0)  {
		$image = $stmt->fetch();
		deleteImagePost($image['id']);
	}
	
	$stmt = getCommentsPost($post_id);
	if($stmt->rowCount() > 0)  {
		$comments = $stmt->fetchAll();
		
		foreach($comments as $comment) {
			deleteCommentNotification($comment['comid']);
			deleteComment($comment['comid']);
		}
	}
	deletePost($post_id);

	$referer = '../../pages/users/profile_feed.php?user-id=' . $user_id;

	header('Location: ' . $referer);
	
?>