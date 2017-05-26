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
?>