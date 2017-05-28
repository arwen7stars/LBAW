<?php
	session_start();

	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');
	include_once($BASE_DIR . 'database/posts.php');

	// fetch user info
	$id = $_GET['user-id'];						// profile id
	$id_logged = $_SESSION['id'];				// id of logged-in user
	
	if($id)
		$valid = isUserValid($id);
	else {
		$valid = false;
	}
	$character_name = getUserCharacterName($_SESSION['username']);
	$smarty->assign('character_name', $character_name);
	$smarty->assign('username_logged', $_SESSION['username']);	// logged-in username
	$smarty->assign('id_logged', $id_logged);					// logged-in id
	
	if(!$valid) {
		$page_not_found = '404 Error. Page not found.';
		$smarty->assign('page_not_found', $page_not_found);
	} else{
	
		
		$location = getUserLocation($id);			// location of profile user
		$user = getUserInfo($id);					// information of profile user
		$username_page = $user['username'];			// username of profile user
		
		$character = getUserCharacter($username_page);					// fetch character info of profile user
		$image = getUserProfileImage($character['charid']);				// fetch profile picture	
		$series = getAnime($character['charid']);						// fetch anime info of character

		$res = checkFriendship($_SESSION['id'], $id);					// check friendship between logged-in user and profile user
		$friendship = ($res !== false);

		if(!empty($user['date-of-birth'])){
		
			$birthDate = explode("-", $user['date-of-birth']);			// birthdate of profile user

			//get age from date or birthdate (year[0] - month[1] - day[2])
			//mktime(hour, minute, second, month, day, year)
			$age = (date("md", date("U", mktime(0, 0, 0, $birthDate[1], $birthDate[2], $birthDate[0]))) > date("md")
				? ((date("Y") - $birthDate[0]) - 1)
				: (date("Y") - $birthDate[0]));
		}
		
		$smarty->assign('username_page', $username_page);			// username of profile's user
		$smarty->assign('id', $id);									// id of profile's user

		$smarty->assign('character', $character);					// character of profile's user
		$smarty->assign('series', $series);							// series of profile's user
		
		$smarty->assign('image', $image);							// profile picture of profile's user
		$smarty->assign('location', $location);						// location of profile's user
		$smarty->assign('about', $user['about']);					// about of profile's user
		$smarty->assign('name', $user['name']);						// name of profile's user
		$smarty->assign('public', $user['public']);					// privacy of profile's user
		$smarty->assign('age', $age);								// age of profile's user
		$smarty->assign('friendship', $friendship);
		$smarty->assign('friend', $res);

		// fetch user photos
		$stmt = getUserImages($id);
		$res = $stmt->fetchAll();

		$images = array_slice($res, 0, 6);
		$smarty->assign('images', $images);		// six-photos preview under user bar
		$smarty->assign('all_images', $res);	// all photos

		// fetch user posts
		$stmt = getUserPosts($id);
		$posts = $stmt->fetchAll();

		// fetch user friends
		$stmt = getUserFriends($id);
		$friends = $stmt->fetchAll();

		$smarty->assign('posts', $posts);
		$smarty->assign('friends', $friends);
	}
	
	if (isset($_SESSION['previous'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['previous']) {
			unset($_SESSION['passwords']);
			unset($_SESSION['old-password']);
			unset($_SESSION['user_exists']);
			unset($_SESSION['email_exists']);
			unset($_SESSION['password-success']);
	   }
	}
	
	if (isset($_SESSION['previous_dates'])) {
		if (basename($_SERVER['PHP_SELF']) != $_SESSION['previous']) {
			unset($_SESSION['wrong_dates']);
	   }
	}

	$smarty->display($BASE_DIR . 'templates/profile_feed.tpl');
?>
