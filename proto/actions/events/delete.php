<?php
	include_once('../../config/init.php');
	include_once('../../database/events.php');
	include_once('../../database/posts.php');
	
	$event_id = $_POST['event-id'];
	
	$stmt = getEventPosts($event_id);
	$no_events = count($stmt);
	
	if($no_events > 0)  {
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
	
	deleteUsersEvent($event_id);
	deleteEventInvites($event_id);
	deleteEventNotifications($event_id);
	deleteEvent($event_id);
	
	header('Location: ../../pages/users/feed.php');
?>