<?php

function userExists($username, $password) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
        $user = $stmt->fetch();
		return ($user !== false && /*$password==$user['password']*/password_verify($password, $user['password']));
    }
	
/*function checkFriendship($user1id, $user2id)
	{
		global $dbh;
		$stmt = $dbh->prepare('SELECT "user1-id","user2-id" FROM "Friendship" WHERE "user1-id" = ? AND "user2-id" = ?)';
        //$stmt->bindParam(':user1id', $user1id);
		//$stmt->bindParam(':user2id', $user2id);		
		$stmt->execute(array($user1id,$user2id));
        $exists = $stmt->fetch();
		return($exists !== false);
	}*/
	
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
	
	function getUserPosts($user_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Post" WHERE "user-id" = ? ORDER BY date DESC, id DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
	
	function getImagePost($post_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Image" WHERE "post-id" = ?';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($post_id));
		
		return $stmt->fetch();
		
	}
	
	function getUserImages($user_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Post", "Image" WHERE "Post"."user-id" = ? AND "post-id" = "Post".id ORDER BY "Post".date DESC, "Post".id DESC LIMIT 6';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id));
		
		return $stmt;
	}
/*
	function getUserInfo($id) {
		global $dbh;

		$stmt = $dbh->prepare('SELECT * FROM "User" WHERE id=:userid');
		$stmt->bindParam(':userid', $id);
		$stmt->execute();

		return $stmt->fetch();
	}*/
	
	function getUserCharacterName($username)
	{
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Character"."name" FROM "Character","User" WHERE "User".username = :username AND "User".id = "Character".id');
		$stmt->bindParam(':username', $username);
        $stmt->execute(array($username));
        $name = $stmt->fetch();
		return $name['name'];
	}
?>