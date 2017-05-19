<?php
	function getUserPosts($user_id) {
		global $dbh;

		$query = 'SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		COUNT("Likes"."id") AS "likes"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
		  SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
		  FROM "Image"
		  WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN "Likes" ON "Post"."id" = "Likes"."post-id" AND "Likes"."comment-id" IS NULL
		WHERE "Post"."user-id" = ?
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id"
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url"
		ORDER BY date DESC, "Post"."id" DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getCommentsPost($post_id) {
		global $dbh;
		
		$query = 'SELECT "User"."id" AS userid, "Comment"."id", "Comment"."body", "Character"."name", "Image"."url", COUNT("Likes"."id") AS "likes"
		FROM "User", "Character", "Image", "Character-Image", "Comment" 
		LEFT JOIN "Likes" ON "Comment"."id" = "Likes"."comment-id" AND "Likes"."post-id" IS NULL
		WHERE "Comment"."post-id" = ?
		AND "Character-Image"."character-id" = "Character"."id"
		AND "Character-Image"."image-id" = "Image"."id"
		AND "Comment"."user-id" = "User"."id"
		AND "User"."character-id" = "Character"."id"
		AND "Image"."post-id" IS NULL
		GROUP BY "User"."id", "Comment"."id", "Character"."name", "Image"."url"
		ORDER BY "Comment"."id" DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($post_id));
		
		return $stmt;
	}
	
	function getSinglePost($post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Post" WHERE "Post"."id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($post_id));
		
		return $stmt->fetch();
	}
	
	function addPost($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Post" ("body", "shared", "public", "user-id", "op-id", "event-id", "group-id") VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING id';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id));
		$res = $stmt->fetch();
		
		return $res['id'];
	}
	
	function addPostImage($path, $description, $date, $post_id, $usr_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Image" ("url", "description", "date", "post-id", "user-id") VALUES (?, ?, ?, ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($path, $description, $date, $post_id, $usr_id));
	}
	
	function addCommentPost($body, $user_id, $post_id) {
		global $dbh;
		
		$query = 'INSERT INTO "Comment" ("body", "user-id", "post-id") VALUES (?, ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($body, $user_id, $post_id));		
	}
	
	function updatePost($post_id, $body, $public) {
		global $dbh;
		$query = 'UPDATE "Post"
		SET ("body", "public") = (?, ?)
		WHERE "Post"."id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($body, $public, $post_id));
	}
?>