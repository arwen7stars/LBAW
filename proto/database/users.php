<?php

	function userExists($username, $password) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
        $user = $stmt->fetch();
		return ($user !== false && /*$password==$user['password']*/password_verify($password, $user['password']));
    }
	
	function checkFriendship($user1id, $user2id)
	{
		global $dbh;
		$stmt = $dbh->prepare('SELECT "user1-id","user2-id" FROM "Friendship" WHERE ("user1-id" = :user1id AND "user2-id" = :user2id) OR ("user1-id" = :user2id AND "user2-id" = :user1id)');
        $stmt->bindParam(':user1id', $user1id);
		$stmt->bindParam(':user2id', $user2id);		
		$stmt->execute();
        $exists = $stmt->fetch();
		return($exists !== false);
	}
	
	function getLoginID($username) {
		global $dbh;
		
		$query = 'SELECT * FROM "User" WHERE username = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($username));
		$row = $stmt->fetch();
		
		return $row['id'];
	}
	
	function getUserInfo($id) {
		global $dbh;
		
		$query = 'SELECT * FROM "User" WHERE id = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		$row = $stmt->fetch();
		
		return $row;
	}
	
	function getUserLocation($user_id) {
		global $dbh;
		
		$query = 'SELECT "city", "country" FROM "User", "Location" WHERE "User"."id" = ? AND "User"."location-id" = "Location"."id"';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		return $stmt->fetch();
		
	}
	
	function getUserImages($user_id) {
		global $dbh;
		
		$query = 'SELECT "Post"."id" AS id, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id" FROM "Post", "Image" WHERE "Post"."user-id" = ? AND "post-id" = "Post".id ORDER BY "Post".date DESC, "Post".id DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getUserCharacter($username)
	{
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Character"."id" AS charid, "Character"."url", "Character"."name" AS name FROM "Character","User" WHERE "User".username = :username AND "User".id = "Character".id');
		$stmt->bindParam(':username', $username);
        $stmt->execute(array($username));

		return $stmt->fetch();
	}
	
	function getAnime($id) {
		global $dbh;
		
		$query = 'SELECT "Character-Anime"."character-id", "Character-Anime"."anime-id", "Anime"."id", "Anime"."name" AS name, "Anime"."url" AS url
		FROM "Character-Anime", "Anime"
		WHERE "Character-Anime"."character-id" = ? AND "Anime"."id" = "Character-Anime"."anime-id"';
		$stmt = $dbh->prepare($query);
        $stmt->execute(array($id));
		
		return $stmt->fetch();
		
	}
	
	function getUserProfileImage($id)
	{
		global $dbh;
		$query = 'SELECT "Image".id, "Image".url AS url, "Image".description AS description, "Character-Image"."character-id", "Character-Image"."image-id"
		FROM "Character-Image", "Image"
		WHERE "Character-Image"."character-id" = ? AND "Character-Image"."image-id" = "Image".id';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		return $stmt->fetch();
	}
	
	function getUserDate($id)
	{
		global $dbh;
		$query = 'SELECT "date-of-birth"
		FROM "User"
		WHERE "id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		$result = $stmt->fetch();
		
		return $result['date-of-birth'];
	}
	
	function getUserCharacterName($username)
	{
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Character"."name" FROM "Character","User" WHERE "User".username = :username AND "User".id = "Character".id');
		$stmt->bindParam(':username', $username);
        $stmt->execute(array($username));
        $name = $stmt->fetch();
		return $name['name'];
	}
	
	function getUserFriends($id)
	{
		global $dbh;
		$query = 'SELECT "Character"."name" AS name, "Image"."url" AS url, "Image"."description" AS alt, "User"."id" AS id
		FROM "Character-Image", "Character", "Image", "User", ( 
		  SELECT "user1-id" AS "user-id" FROM "Friendship"
		  WHERE "user2-id" = :id
			AND "accepted" = TRUE
		 
		  UNION
		 
		  SELECT "user2-id" FROM "Friendship"
		  WHERE "user1-id" = :id
			AND "accepted" = TRUE
		 
		  ORDER BY "user-id"
		) AS "Friends"
		WHERE "Friends"."user-id" = "User"."id" AND "Character"."id" = "User"."character-id"
					AND "Character-Image"."character-id" = "Character"."id"
					AND "Character-Image"."image-id" = "Image"."id"
		ORDER BY "User"."id";';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':id', $id);
		$stmt->execute(array($id));
		
		return $stmt;
	}
?>