<?php
	include_once('../../config/init.php');
	include_once('../../database/groups.php');
	include_once('../../database/posts.php');
	
	$group_id = $_POST['group-id'];
	
	$stmt = getGroupPosts($group_id);
	
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
	
	deleteUsersGroup($group_id);
	deleteGroupInvites($group_id);
	deleteGroupNotifications($group_id);
	deleteGroup($group_id);
	
	header('Location: ../../pages/users/feed.php');
?>