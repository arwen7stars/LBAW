<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	include_once('../../database/posts.php');
	
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
	
	$shared = 'f';
	$original_poster = null;
	$public = $_POST['public'];
	
	if ($_POST['event-id'] || $_POST['group-id']){
		$public = 't';
	}

	if (!empty($_FILES['image']['name'])){
		$string = $_FILES['image']['name'];
		$name_file = str_replace(' ', '', $string);
		$destination = '../../images/' . $name_file;
		$tmp_file = $_FILES['image']['tmp_name'];

		move_uploaded_file($tmp_file, $destination);

		$user_info = getUserInfo($user_id);
		$username = $user_info['username'];
		$description = "Photo of $username";
		$usr_id = null;
		$path = '../../images/' . $name_file;
		$date = date('Y-m-d', time());
		
		$post_id = addPost($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id);
		addPostImage($path, $description, $date, $post_id, $usr_id);
	} else {
		if(!is_null($body)) {
			addPost($body, $shared, $public, $user_id, $original_poster, $event_id, $group_id);
		}
	}
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
