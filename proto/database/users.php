<?php

	function checkPassword($username, $password) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
        $user = $stmt->fetch();
		return ($user !== false && /*$password==$user['password']*/password_verify($password, $user['password']));
    }
	
	function usernameExists($username) {
		global $dbh;
		$stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
		$user = $stmt->fetch();
		return ($user !== false);
	}
	
	function emailExists($email) {
		global $dbh;
		$stmt = $dbh->prepare('SELECT * FROM "User" WHERE email = ?');
        $stmt->execute(array($email));
		$user = $stmt->fetch();
		return ($user !== false);	
	}
	
	function characterExists($character) {
		global $dbh;
		$stmt = $dbh->prepare('SELECT * FROM "User" WHERE "character-id" = ?');
        $stmt->execute(array($character));
		$user = $stmt->fetch();
		return ($user !== false);	
	}
	
	function checkFriendship($user1id, $user2id)
	{
		global $dbh;
		$stmt = $dbh->prepare('SELECT "accepted", "user1-id" AS user1, "user2-id" AS user2 FROM "Friendship" WHERE ("user1-id" = :user1id AND "user2-id" = :user2id) OR ("user1-id" = :user2id AND "user2-id" = :user1id)');
        $stmt->bindParam(':user1id', $user1id);
		$stmt->bindParam(':user2id', $user2id);		
		$stmt->execute();
        $exists = $stmt->fetch();
		return $exists;
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
		
		$query = 'SELECT "Location"."id" AS id, "city", "country" FROM "User", "Location" WHERE "User"."id" = ? AND "User"."location-id" = "Location"."id"';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		return $stmt->fetch();
		
	}
	
	function getUserImages($user_id) {
		global $dbh;
		
		$query = 'SELECT "Post"."id" AS id, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id" FROM "Post", "Image" WHERE "Post"."user-id" = ? AND "post-id" = "Post".id AND "Post"."event-id" IS NULL AND "Post"."group-id" IS NULL ORDER BY "Post".date DESC, "Post".id DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getUserCharacter($username)
	{
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Character"."id" AS charid, "Character"."url", "Character"."name" AS name FROM "Character","User" WHERE "User".username = :username AND "User"."character-id" = "Character".id');
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
        $stmt = $dbh->prepare('SELECT "Character"."name" FROM "Character","User" WHERE "User".username = :username AND "User"."character-id" = "Character".id');
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
	
	function getLocations() {
		global $dbh;
		
		$query = 'SELECT * FROM "Location"';
		$stmt = $dbh->prepare($query);
		$stmt->execute();
		
		return $stmt;
	}
	
	function getUserLikes($user_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Likes" WHERE "Likes"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;		
	}
	
	function getEventInvites($user_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Event-Invite" WHERE "Event-Invite"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}

	function getGroupInvites($user_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Group-Invite" WHERE "Group-Invite"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function deleteEventInvite($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."event-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Event-Invite" WHERE "Event-Invite"."event-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));		
	}
	
	function deleteGroupInvite($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."group-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Event-Invite" WHERE "Group-Invite"."group-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));		
	}
	
	function deleteUserNotifications($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
	}
	
	/*
	function deleteUserGroups($id) {
		global $dbh;
		
		$query = 'DELETE FROM "User-Group" WHERE "User-Group"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));	
	}
	
	function deleteUserEvents($id) {
		global $dbh;
		
		$query = 'DELETE FROM "User-Event" WHERE "User-Event"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));	
	}
	*/
	
	function deleteUserFriendshipNotifications($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."friendship-user1-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));	

		$query = 'DELETE FROM "Notification" WHERE "Notification"."friendship-user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));	
	}
	
	function deleteUserLikes($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Likes" WHERE "Likes"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));			
	}
	
	function deleteUser($id) {
		global $dbh;
		
		$query = 'DELETE FROM "User" WHERE "User"."id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
	}
	
	function updateUser($id, $name, $date, $location, $about) {
		global $dbh;
		
		$query = 'UPDATE "User"
		SET("date-of-birth", "name", "about", "location-id") = (?, ?, ?, ?)
		WHERE "User"."id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($date, $name, $about, $location, $id));
	}
	
	function updateUserSettings($id, $username, $password, $email, $public) {
		global $dbh;
		
		$query = 'UPDATE "User"
		SET("username", "password", "email", "public") = (?, ?, ?, ?)
		WHERE "User"."id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($username, $password, $email, $public, $id));
	}
		
	function updateEmailPassword($email, $password) {
		global $dbh;
		
		$query = 'UPDATE "User" SET ("password") = :password WHERE "User"."email" = :email';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':password', password_hash($password));
		$stmt->bindParam(':email', $email);
		$stmt->execute(array($email,$password));
	}
	
	function acceptFriendship($id1, $id2) {
		global $dbh;
		
		$accepted = "TRUE";
		$query = 'UPDATE "Friendship"
		SET("accepted") = (?)
		WHERE "Friendship"."user1-id" = ? AND "Friendship"."user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($accepted, $id1, $id2));
	}
	
	function deleteFriendship($id1, $id2) {
		global $dbh;
		
		$query = 'DELETE FROM "Friendship"
		WHERE "Friendship"."user1-id" = ? AND "Friendship"."user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id1, $id2));
	}
	
	function deleteFriendshipNotification($id1, $id2) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification"
		WHERE "Notification"."friendship-user1-id" = ? AND "Notification"."friendship-user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id1, $id2));		
	}
	
	function deleteFriendships($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification"
		WHERE "Notification"."friendship-user1-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Notification"
		WHERE "Notification"."friendship-user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Friendship"
		WHERE "Friendship"."user1-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Friendship"
		WHERE "Friendship"."user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
	}
	
	function deletePrivateMessages($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification"
		WHERE "Notification"."pm-user1-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Notification"
		WHERE "Notification"."pm-user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Private-Message"
		WHERE "Private-Message"."user1-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Private-Message"
		WHERE "Private-Message"."user2-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));		
	}
	
	function deleteUserReports($id) {
		global $dbh;
		
		$query = 'DELETE FROM "Report"
		WHERE "Report"."user-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));
		
		$query = 'DELETE FROM "Report"
		WHERE "Report"."admin" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($id));				
	}

	function getCharacters() {
		global $dbh;
		
		$query = 'SELECT "Character".id AS id, "Character".name AS charname, "Character".url AS info, "Image".url as image, "Anime".name AS name
		FROM "Character", "Character-Image", "Image", "Anime", "Character-Anime"
		WHERE "Character-Image"."character-id" = "Character"."id" AND "Character-Image"."image-id" = "Image".id AND "Character-Anime"."character-id" = "Character"."id" AND "Character-Anime"."anime-id" = "Anime"."id" AND "Character".id NOT IN (
    SELECT "User"."character-id" FROM "User", "Character" WHERE "User"."character-id" = "Character".id
)
		ORDER BY name';
		$stmt = $dbh->prepare($query);
		$stmt->execute();
		
		return $stmt;
	}
	
	function addUser($name, $username, $password, $email, $date, $character, $location) {
		global $dbh;

		$query = 'INSERT INTO "User" ("name", "username", "password", "email", "date-of-birth", "character-id", "location-id") VALUES (?, ?, ?, ?, ?, ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($name, $username, $password, $email, $date, $character, $location));

	}
	
	function isUserValid($user_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE "User"."id" = :user');
		$stmt->bindParam(':user', $user_id);
		$stmt->execute(array($user_id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function generateRandomString($length) 
	{
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) 
		{
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}
?>