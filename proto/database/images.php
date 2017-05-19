<?php
	function getPost($id) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
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
		WHERE "Post"."id" = ?
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id"
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url";');
        $stmt->execute(array($id));
        $img = $stmt->fetch();
		return $img;
    }
	
	function getNextImage($user_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."user-id" = :user AND "post-id" = "Post".id AND "Image"."id" > :img
				ORDER BY "Image"."id"
				LIMIT 1');
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($user_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function getPreviousImage($user_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."user-id" = :user AND "post-id" = "Post".id AND :img > "Image"."id"
				ORDER BY "Image"."id" DESC LIMIT 1');
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($user_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
?>