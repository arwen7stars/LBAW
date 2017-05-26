<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/posts.php');
	
	$user_id = $_POST['user-id'];
	$stmt = getUserPosts($user_id);
	
	if($stmt->rowCount() > 0)  {
		$posts = $stmt->fetchAll();
		
		foreach($posts as $post) {
			$post_id = $post['postid'];
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
			deletePost($post_id);
		}
	}
	
	$stmt = getUserLikes($user_id);
	
	if($stmt->rowCount() > 0) {
		$likes = $stmt->fetchAll();
		
		foreach($likes as $like) {
			deleteLikeNotification($like['id']);
			deleteLike($like['id']);
		}
	}
	
	$stmt = getEventInvites($user_id);
	
	if($stmt->rowCount() > 0) {
		$events = $stmt->fetchAll();
		
		foreach($events as $event) {
			deleteEventInvite($event['event-id']);
		}
	}
	
	$stmt = getGroupInvites($user_id);
	
	if($stmt->rowCount() > 0) {
		$groups = $stmt->fetchAll();
		
		foreach($groups as $group) {
			deleteEventInvite($group['group-id']);
		}
	}
	
	deleteUserFriendshipNotifications($user_id);
	deleteFriendships($user_id);
	deletePrivateMessages($user_id);
	deleteUserNotifications($user_id);
	deleteUserReports($user_id);
	deleteUserLikes($user_id);
	deleteUser($user_id);
	
	session_destroy();
	unset($_SESSION);
	header('Location: ../../index.php');
?>