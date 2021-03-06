<?php
	function isProfilePost($post_id, $user_id) {
		global $dbh;
		$query = 'SELECT FROM "Post" WHERE "Post"."user-id" = :user AND "Post"."id" = :post AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':post', $post_id);
		$stmt->execute(array($user_id, $post_id));
		$res = $stmt->fetch();
		return ($res !== false);
	}
	
	function isPostFromUser($post_id, $user_id) {
		global $dbh;
		$query = 'SELECT FROM "Post" WHERE "Post"."user-id" = :user AND "Post"."id" = :post';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':post', $post_id);
		$stmt->execute(array($user_id, $post_id));
		$res = $stmt->fetch();
		return ($res !== false);
	}
	
	function getUserPosts($user_id) {
		global $dbh;

		$query = 'SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		"Likes-Comments"."likes", "Comments-Likes"."comments" AS "comments"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
			SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
			FROM "Image"
			WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN (
			SELECT "Likes"."post-id", COUNT("Likes"."id") AS "likes", "Comments"."comments" FROM "Likes" 
			LEFT JOIN
			(
				SELECT COUNT("Comment"."id") AS "comments", "Comment"."post-id" AS id
				FROM "Comment"
				GROUP BY "Comment"."post-id"
			) AS "Comments"
			ON "Comments"."id" = "Likes"."post-id"
			GROUP BY "Comments"."comments", "Likes"."post-id"
		) AS "Likes-Comments"
		ON "Post"."id" = "Likes-Comments"."post-id"
		LEFT JOIN (
		SELECT "Comment"."post-id", COUNT("Comment"."id") AS "comments", "NoLikes"."likes", "NoLikes"."postid" FROM "Comment"
			LEFT JOIN
			(
				SELECT COUNT("Likes"."id") AS "likes", "Likes"."post-id" AS postid
				FROM "Likes"
				GROUP BY "Likes"."post-id"
			) AS "NoLikes"
			ON "NoLikes"."postid" = "Comment"."post-id"
			GROUP BY "Comment"."post-id", "NoLikes"."likes", "NoLikes"."postid"
		) AS "Comments-Likes"
		ON "Post"."id" = "Comments-Likes"."post-id"
		WHERE "Post"."user-id" = ?
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id" AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url", "Likes-Comments"."likes", "Comments-Likes"."comments"
		ORDER BY date DESC, "Post"."id" DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getFeedPosts($user_id) {
		global $dbh;
		
		$query = 'SELECT "Post"."id" as postid, "Post"."body" as body, "Post"."public" as public, "Post"."date", "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS name, "Image"."url" AS charurl,
		"Likes-Comments"."likes", "Comments-Likes"."comments" AS "comments"
		FROM "Character-Image", "Character", "Image", "User", "Post"
		LEFT JOIN (
		  SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
		  FROM "Image"
		  WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN (
			SELECT "Likes"."post-id", COUNT("Likes"."id") AS "likes", "Comments"."comments" FROM "Likes" 
			LEFT JOIN
			(
				SELECT COUNT("Comment"."id") AS "comments", "Comment"."post-id" AS id
				FROM "Comment"
				GROUP BY "Comment"."post-id"
			) AS "Comments"
			ON "Comments"."id" = "Likes"."post-id"
			GROUP BY "Comments"."comments", "Likes"."post-id"
		) AS "Likes-Comments"
		ON "Post"."id" = "Likes-Comments"."post-id"
		LEFT JOIN (
		SELECT "Comment"."post-id", COUNT("Comment"."id") AS "comments", "NoLikes"."likes", "NoLikes"."postid" FROM "Comment"
			LEFT JOIN
			(
				SELECT COUNT("Likes"."id") AS "likes", "Likes"."post-id" AS postid
				FROM "Likes"
				GROUP BY "Likes"."post-id"
			) AS "NoLikes"
			ON "NoLikes"."postid" = "Comment"."post-id"
			GROUP BY "Comment"."post-id", "NoLikes"."likes", "NoLikes"."postid"
		) AS "Comments-Likes"
		ON "Post"."id" = "Comments-Likes"."post-id", ( 
		  SELECT "user1-id" AS "user-id" FROM "Friendship"
		  WHERE "user2-id" = :id
			AND "accepted" = TRUE
		 
		  UNION
		 
		  SELECT "user2-id" FROM "Friendship"
		  WHERE "user1-id" = :id
			AND "accepted" = TRUE
		 
		  ORDER BY "user-id"
		) AS "Friends"
		WHERE "Friends"."user-id" = "Post"."user-id" AND "Friends"."user-id" = "User"."id" AND "Character"."id" = "User"."character-id"
					AND "Character-Image"."character-id" = "Character"."id"
					AND "Character-Image"."image-id" = "Image"."id" AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url", "Likes-Comments"."likes", "Comments-Likes"."comments"

		
		UNION


		SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		"Likes-Comments"."likes", "Comments-Likes"."comments" AS "comments"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
			SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
			FROM "Image"
			WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN (
			SELECT "Likes"."post-id", COUNT("Likes"."id") AS "likes", "Comments"."comments" FROM "Likes" 
			LEFT JOIN
			(
				SELECT COUNT("Comment"."id") AS "comments", "Comment"."post-id" AS id
				FROM "Comment"
				GROUP BY "Comment"."post-id"
			) AS "Comments"
			ON "Comments"."id" = "Likes"."post-id"
			GROUP BY "Comments"."comments", "Likes"."post-id"
		) AS "Likes-Comments"
		ON "Post"."id" = "Likes-Comments"."post-id"
		LEFT JOIN (
		SELECT "Comment"."post-id", COUNT("Comment"."id") AS "comments", "NoLikes"."likes", "NoLikes"."postid" FROM "Comment"
			LEFT JOIN
			(
				SELECT COUNT("Likes"."id") AS "likes", "Likes"."post-id" AS postid
				FROM "Likes"
				GROUP BY "Likes"."post-id"
			) AS "NoLikes"
			ON "NoLikes"."postid" = "Comment"."post-id"
			GROUP BY "Comment"."post-id", "NoLikes"."likes", "NoLikes"."postid"
		) AS "Comments-Likes"
		ON "Post"."id" = "Comments-Likes"."post-id"
		WHERE "Post"."user-id" = :id
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id" AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url", "Likes-Comments"."likes", "Comments-Likes"."comments"
		ORDER BY date DESC, postid DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $user_id);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getCommentsPost($post_id) {
		global $dbh;
		
		$query = 'SELECT "User"."id" AS userid, "Comment"."id" AS comid, "Comment"."body", "Character"."name", "Image"."url", COUNT("Likes"."id") AS "likes"
		FROM "User", "Character", "Image", "Character-Image", "Comment" 
		LEFT JOIN "Likes" ON "Comment"."id" = "Likes"."comment-id" AND "Likes"."post-id" IS NULL
		WHERE "Comment"."post-id" = :id
		AND "Character-Image"."character-id" = "Character"."id"
		AND "Character-Image"."image-id" = "Image"."id"
		AND "Comment"."user-id" = "User"."id"
		AND "User"."character-id" = "Character"."id"
		AND "Image"."post-id" IS NULL
		GROUP BY "User"."id", "Comment"."id", "Character"."name", "Image"."url"
		ORDER BY "Comment"."id" DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $post_id);
		$stmt->execute(array($post_id));
		
		return $stmt;
	}
	
	function getSinglePost($post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Post" WHERE "Post"."id" = :id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $post_id);
		$stmt->execute(array($post_id));
		
		return $stmt->fetch();
	}
	
	function getPost($id) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		"Likes-Comments"."likes", "Comments-Likes"."comments" AS "comments"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
		  SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
		  FROM "Image"
		  WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
				LEFT JOIN (
			SELECT "Likes"."post-id", COUNT("Likes"."id") AS "likes", "Comments"."comments" FROM "Likes" 
			LEFT JOIN
			(
				SELECT COUNT("Comment"."id") AS "comments", "Comment"."post-id" AS id
				FROM "Comment"
				GROUP BY "Comment"."post-id"
			) AS "Comments"
			ON "Comments"."id" = "Likes"."post-id"
			GROUP BY "Comments"."comments", "Likes"."post-id"
		) AS "Likes-Comments"
		ON "Post"."id" = "Likes-Comments"."post-id"
		LEFT JOIN (
		SELECT "Comment"."post-id", COUNT("Comment"."id") AS "comments", "NoLikes"."likes", "NoLikes"."postid" FROM "Comment"
			LEFT JOIN
			(
				SELECT COUNT("Likes"."id") AS "likes", "Likes"."post-id" AS postid
				FROM "Likes"
				GROUP BY "Likes"."post-id"
			) AS "NoLikes"
			ON "NoLikes"."postid" = "Comment"."post-id"
			GROUP BY "Comment"."post-id", "NoLikes"."likes", "NoLikes"."postid"
		) AS "Comments-Likes"
		ON "Post"."id" = "Comments-Likes"."post-id"
		WHERE "Post"."id" = :id
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id"
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url", "Likes-Comments"."likes", "Comments-Likes"."comments";');
		$stmt->bindParam(':id', $id);
        $stmt->execute(array($id));
        $img = $stmt->fetch();
		return $img;
    }
	
	function getNextImage($user_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."user-id" = :user AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL AND "post-id" = "Post".id AND "Image"."id" > :img
				ORDER BY "Image"."id"
				LIMIT 1');
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($user_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function getRecentNews()
	{
		global $dbh;
		$stmt = $dbh->prepare('SELECT * FROM "News"');
		$stmt->execute();
		return $stmt->fetchAll();
	}
	
	
	function getPreviousImage($user_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."user-id" = :user AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL AND "post-id" = "Post".id AND :img > "Image"."id"
				ORDER BY "Image"."id" DESC LIMIT 1');
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($user_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function getImagePost($post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Image" WHERE "Image"."post-id" = :id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $post_id);
		$stmt->execute(array($post_id));
		
		return $stmt;
	}
	
	function getLikesPost($post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Likes" WHERE "Likes"."post-id" = :id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $post_id);
		$stmt->execute(array($post_id));
		
		return $stmt;
	}

	function getLikesComment($comment_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Likes" WHERE "Likes"."comment-id" = :id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $comment_id);
		$stmt->execute(array($comment_id));
		
		return $stmt;		
	}
	
	function addPost($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Post" ("body", "shared", "public", "user-id", "op-id", "event-id", "group-id") VALUES (:body, :shared, :public, 
		:user_id, :original_poster, :event_id, :group_id) RETURNING id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':body', $body);
		$stmt->bindParam(':shared', $shared);
		$stmt->bindParam(':public', $public);
		$stmt->bindParam(':user_id', $user_id);
		$stmt->bindParam(':original_poster', $original_poster);
		$stmt->bindParam(':event_id', $event_id);
		$stmt->bindParam(':group_id', $group_id);
		$stmt->execute(array($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id));
		$res = $stmt->fetch();
		
		return $res['id'];
	}
	
	function addPostImage($path, $description, $date, $post_id, $user_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Image" ("url", "description", "date", "post-id", "user-id") VALUES (:url, :description, :date, :post_id, :user_id)';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':url', $path);
		$stmt->bindParam(':description', $description);
		$stmt->bindParam(':date', $date);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->bindParam(':user_id', $user_id);
		$stmt->execute(array($path, $description, $date, $post_id, $usr_id));
	}
	
	function addCommentPost($body, $user_id, $post_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Comment" ("body", "user-id", "post-id") VALUES (:body, :user_id, :post_id)';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':body', $body);
		$stmt->bindParam(':user_id', $user_id);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->execute(array($body, $user_id, $post_id));		
	}
	
	function updatePost($post_id, $body, $public) {
		global $dbh;
		$query = 'UPDATE "Post"
		SET ("body", "public") = (:body, :public)
		WHERE "Post"."id" = :post_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':body', $body);
		$stmt->bindParam(':public', $public);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->execute(array($body, $public, $post_id));
	}
	
	function updateComment($comment_id, $body) {
		global $dbh;
		$query = 'UPDATE "Comment"
		SET ("body") = (:body)
		WHERE "Comment"."id" = :comment_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':body', $body);
		$stmt->bindParam(':comment_id', $comment_id);
		$stmt->execute(array($body, $comment_id));
	}
	
	function deleteImagePost($img_id) {
		global $dbh;
		$query = 'DELETE FROM "Image" WHERE "Image"."id" = :img_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':img_id', $img_id);
		$stmt->execute(array($img_id));
	}
	
	function deletePost($post_id) {
		global $dbh;
		$query = 'DELETE FROM "Post" WHERE "Post"."id" = :post_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->execute(array($post_id));	
	}
	
	function deleteComment($comment_id) {
		global $dbh;
		$query = 'DELETE FROM "Comment" WHERE "Comment"."id" = :comment_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':comment_id', $comment_id);
		$stmt->execute(array($comment_id));	
	}
	
	function deleteCommentNotification($comment_id) {
		global $dbh;
		$query = 'DELETE FROM "Notification" WHERE "Notification"."comment-id" = :comment_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':comment_id', $comment_id);
		$stmt->execute(array($comment_id));	
	}
	
	function deleteLikeNotification($like_id) {
		global $dbh;
		$query = 'DELETE FROM "Notification" WHERE "Notification"."like-id" = :like_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':like_id', $like_id);
		$stmt->execute(array($like_id));
	}
	
	function deleteLike($like_id) {
		global $dbh;
		$query = 'DELETE FROM "Likes" WHERE "Likes"."id" = :like_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':like_id', $like_id);
		$stmt->execute(array($like_id));			
	}
	
	function deleteNotificationsPost($post_id) {
		global $dbh;
		$query = 'DELETE FROM "Notification" WHERE "Notification"."post-id" = :post_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->execute(array($post_id));	
	}
	
	function hasUserLikedPost($user_id, $post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Likes" WHERE "Likes"."user-id" = :user_id AND "Likes"."post-id" = :post_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':post_id', $post_id);
		$stmt->bindParam(':user_id', $user_id);
		$stmt->execute(array($user_id, $post_id));
		$res = $stmt->fetch();
		return ($res !== false);
	}
	
	function hasUserLikedComment($user_id, $comment_id) {
		global $dbh;

		$query = 'SELECT * FROM "Likes" WHERE "Likes"."user-id" = :user_id AND "Likes"."comment-id" = :comment_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':comment_id', $comment_id);
		$stmt->bindParam(':user_id', $user_id);
		$stmt->execute(array($user_id, $comment_id));
		$res = $stmt->fetch();
		return ($res !== false);
	}
?>