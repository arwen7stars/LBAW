<?php
	include_once('../../database/init.php');
	include_once('../../database/users.php');
	session_start();
	
	if ($_POST['event-id']) {
		$event_id = $_POST['event-id'];
		$group_id = null;		
	} else if ($_POST['group-id']){
		$group_id = $_POST['group-id'];
		$event_id = null;
	} else {
		$group_id = null;
		$event_id = null;
	}

	$user_id = $_POST['id'];

	if (!strlen(trim($_POST['body']))){
		$body = null;
	} else {
		$body = $_POST['body'];
	}
	
	$date = date('m/d/Y', time());
	
	$shared = 'f';	
	$original_poster = null;
	
	$public = 't';		
	
	$query = 'INSERT INTO "Post" ("body", "shared", "date", "public", "user-id", "op-id", "event-id", "group-id") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id';
	$result = pg_query_params($db, $query, array($body, $shared, $date, $public, $user_id, $original_poster, $event_id, $group_id));
	$row = pg_fetch_array($result);
	$post_id = $row['id'];
	
	if (!$result) { 
		$errormessage = pg_last_error(); 
		echo "Error with query: " . $errormessage; 
		exit(); 
	}
	
	if (!empty($_FILES['image']['name'])){
		$name_file = $_FILES['image']['name'];
		$destination = '../../res/common/img/' . $name_file;
		$tmp_file = $_FILES['image']['tmp_name'];

		move_uploaded_file($tmp_file, $destination);

		$user_info = getUserInfo($user_id);
		$username = $user_info['username'];
		$description = "Profile Picture of $username";
		$usr_id = null;
		$path = 'res/common/img/' . $name_file;
		
		$query = 'INSERT INTO "Image" ("url", "description", "date", "post-id", "user-id") VALUES ($1, $2, $3, $4, $5)';
		$result = pg_query_params($db, $query, array($path, $description, $date, $post_id, $usr_id));
		
		if (!$result) { 
			$errormessage = pg_last_error(); 
			echo "Error with query: " . $errormessage; 
			exit(); 
		}
	}
	
    $referer = '../../profile_logged.php?user-id=' . $user_id;
	
	header('Location: ' . $referer);
?>