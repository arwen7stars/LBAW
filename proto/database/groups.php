<?php
	function addGroup($name, $public, $about) {
        global $dbh;
		$query = 'INSERT INTO "Group" ("name","public","about") VAlUES (? , ?, ?) RETURNING id';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($name, $public, $about));
		$res = $stmt->fetch();
		
		return $res['id'];
	}
	
	function addUserGroup($user_id, $group_id, $admin) {
        global $dbh;
		$query = 'INSERT INTO "User-Group" ("user-id", "group-id","admin") VAlUES (? , ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id, $group_id, $admin));
	}
	
	function listGroups($userId)
	{
		global $dbh;
		$query = 'SELECT * FROM "Group","User-Group" WHERE "User-Group"."user-id" = ? AND "Group"."id" = "User-Group"."group-id" ORDER BY "Group"."id" DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($userId));
		return $stmt->fetchAll();
	}
	
	function getGroupPosts($group_id) {
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
		WHERE "Post"."group-id" = ?
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id" AND "Post"."event-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url"
		ORDER BY date DESC, "Post"."id" DESC;';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($group_id));
		
		return $stmt;
	}
	
	function getGroupImages($group_id) {
		global $dbh;
		
		$query = 'SELECT "Post"."id" AS id, "Post"."user-id" AS "user", "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id" FROM "Post", "Image" WHERE "Post"."group-id" = ? AND "post-id" = "Post".id ORDER BY "Post".date DESC, "Post".id DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($group_id));
		
		return $stmt;
	}
	
	function getGroup($group_id) {
		global $dbh;
		
		$query = 'SELECT "about", "public", "name" FROM "Group" WHERE "Group"."id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));
		
		return $stmt->fetch();
	}
	
	function getNextImageGroup($group_id, $image_id) {
		global $dbh;
		$stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."group-id" = :group AND "post-id" = "Post".id AND "Image"."id" > :img
				ORDER BY "Image"."id"
				LIMIT 1');
		$stmt->bindParam(':group', $group_id);
		$stmt->bindParam(':img', $image_id);
		$stmt->execute(array($group_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function getPreviousImageGroup($group_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."group-id" = :group AND "post-id" = "Post".id AND :img > "Image"."id"
				ORDER BY "Image"."id" DESC LIMIT 1');
		$stmt->bindParam(':group', $group_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($group_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function isPostFromGroup($post_id, $group_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "Post" WHERE "Post"."id" = :post AND "Post"."group-id" = :group');
		$stmt->bindParam(':post', $post_id);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($post_id, $group_id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function isUserFromGroup($user_id, $group_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User-Group", "Group"
		WHERE "User-Group"."group-id" = "Group"."id" AND "Group"."id" = :group AND "User-Group"."user-id" = :user');
		$stmt->bindParam(':group', $group_id);
		$stmt->bindParam(':user', $user_id);
		$stmt->execute(array($group_id, $user_id));
		$res = $stmt->fetch();
		
		return ($res !== false);		
	}
	
	function isUserAdmin($user_id, $group_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User-Group", "Group"
		WHERE "User-Group"."group-id" = "Group"."id" AND "Group"."id" = :group AND "User-Group"."user-id" = :user AND "User-Group"."admin" IS TRUE');
		$stmt->bindParam(':group', $group_id);
		$stmt->bindParam(':user', $user_id);
		$stmt->execute(array($group_id, $user_id));
		$res = $stmt->fetch();
		
		return ($res !== false);		
	}

	function getGroupMembers($group_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Image"."url" AS url, "Image"."description" AS alt, "User"."id" AS id, "User-Group"."admin"
		FROM "Group", "User-Group", "Character-Image", "Character", "Image", "User"
		WHERE "Group"."id" = :group AND "Group"."id" = "User-Group"."group-id" AND "User"."id" = "User-Group"."user-id" AND
		"Character"."id" = "User"."character-id" AND "Character-Image"."character-id" = "Character"."id"
		AND "Character-Image"."image-id" = "Image"."id"
		ORDER BY "User-Group"."admin" DESC');
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));
		
		return $stmt;		
	}
	
	function updateGroup($group_id, $name, $public, $about) {
		global $dbh;
		
		$query = 'UPDATE "Group"
		SET("name", "public", "about") = (:name, :public, :about)
		WHERE "Group"."id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':name', $name);
		$stmt->bindParam(':public', $public);
		$stmt->bindParam(':about', $about);
		$stmt->bindParam(':group', $group_id);
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($name, $public, $about, $group_id));
	}
	
	function deleteGroup($group_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Group" WHERE "Group"."id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));
	}
	
	function deleteUsersGroup($group_id) {
		global $dbh;
		
		$query = 'DELETE FROM "User-Group" WHERE "User-Group"."group-id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));	
	}
	
	function deleteGroupInvites($group_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Group-Invite" WHERE "Group-Invite"."group-id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));		
	}
	
	function deleteGroupNotifications($group_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."group-id" = :group';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));		
	}
	
	function isGroupValid($group_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "Group" WHERE "Group"."id" = :group');
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($group_id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function leaveGroup($id, $group_id) {
		global $dbh;
		
		$stmt = $dbh->prepare('DELETE FROM "User-Group" WHERE "User-Group"."user-id" = :user AND "User-Group"."group-id" = :group');
		$stmt->bindParam(':user', $id);
		$stmt->bindParam(':group', $group_id);
		$stmt->execute(array($id, $group_id));
	}
?>