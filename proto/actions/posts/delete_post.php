<?php
	include_once('../../config/init.php');
	include_once('../../database/posts.php');
	
	$post_id = $_POST['post-id'];
	$post = getSinglePost($post_id);
	$user_id = $post['user-id'];
	
	$stmt = getImagePost($post_id);
	if($stmt->rowCount() > 0)  {
		$image = $stmt->fetch();
		
		if (file_exists($image['url'])) {
			unlink($image['url']);
		}
		
		deleteImagePost($image['id']);
	}
	
	$stmt = getLikesPost($post_id);
	if($stmt->rowCount() > 0) {
		$likes = $stmt->fetchAll();
		
		foreach($likes as $like) {
			deleteLikeNotification($like['id']);
			deleteLike($like['id']);
		}
	}
	
	$stmt = getCommentsPost($post_id);
	if($stmt->rowCount() > 0)  {
		$comments = $stmt->fetchAll();
		
		foreach($comments as $comment) {
			$stmt = getLikesComment($comment['comid']);
			
			if($stmt->rowCount() > 0)  {
				$likes = $stmt->fetchAll();
				foreach($likes as $like) {
					deleteLikeNotification($like['id']);
					deleteLike($like['id']);
				}
			}
			
			deleteCommentNotification($comment['comid']);
			deleteComment($comment['comid']);
		}
	}
	deleteNotificationsPost($post_id);
	deletePost($post_id);
	
	if($_POST['feed'] == "true") {
		$referer = '../../pages/users/feed.php';
	} else {
		if($_POST['group-id']){
			$group_id = $_POST['group-id'];
			$referer = '../../pages/groups/feed.php?group-id=' . $group_id;
		} else{
			if($_POST['event-id']) {
				$event_id = $_POST['event-id'];
				$referer = '../../pages/events/event_feed.php?event-id=' . $event_id;
			} else $referer = '../../pages/users/profile_feed.php?user-id=' . $user_id;
		}
	}

	header('Location: ' . $referer);
	
?>