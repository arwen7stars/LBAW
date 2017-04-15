<?php
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

	function userExists($username, $password) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
        $user = $stmt->fetch();
		return ($user !== false /*&& $password==$user['password']password_verify($password, $user['password'])*/);
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