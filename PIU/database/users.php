<?php

include_once('init.php');

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
		global $db;
		
		$query = 'SELECT * FROM "User" WHERE username = $1';
		$result = pg_query_params($db, $query, array($username));
		$row = pg_fetch_array($result);
		
		return $row['id'];
	}
	
	function getUserInfo($id) {
		global $db;
		
		$query = 'SELECT * FROM "User" WHERE id = $1';
		$result = pg_query_params($db, $query, array($id));
		$row = pg_fetch_array($result);
		
		return $row;
	}
	
	function getUserPosts($user_id) {
		global $db;
		
		$query = 'SELECT * FROM "Post" WHERE "user-id" = $1 ORDER BY date DESC, id DESC';
		$result = pg_query_params($db, $query, array($user_id));
		
		return $result;
	}
	
	function getImagePost($post_id) {
		global $db;
		
		$query = 'SELECT * FROM "Image" WHERE "post-id" = $1';
		$result = pg_query_params($db, $query, array($post_id));
		$row = pg_fetch_array($result);
		
		return $row;
		
	}
	
	function getUserImages($user_id) {
		global $db;
		
		$query = 'SELECT * FROM "Post", "Image" WHERE "Post"."user-id" = $1 AND "post-id" = "Post".id ORDER BY "Post".date DESC, "Post".id DESC LIMIT 6';
		$result = pg_query_params($db, $query, array($user_id));
		
		return $result;
	}
/*
	function getUserInfo($id) {
		global $dbh;

		$stmt = $dbh->prepare('SELECT * FROM "User" WHERE id=:userid');
		$stmt->bindParam(':userid', $id);
		$stmt->execute();

		return $stmt->fetch();
	}*/
?>