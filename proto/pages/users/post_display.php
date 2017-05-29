<?php
	session_start();

	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');
	include_once($BASE_DIR . 'database/posts.php');
	include_once($BASE_DIR . 'database/groups.php');
	
	$isWebPageAdmin = IsWebPageAdmin($_SESSION['id']);
	
	if ($isWebPageAdmin['admin'] === true)
		$smarty->assign('isWebPageAdmin', '1');
	else 
		$smarty->assign('isWebPageAdmin', '0');

	$id = $_GET['user-id'];					// profile id
	$postid = $_GET['post-id'];				// post id
	
	$user = getUserInfo($id);
	$username_page = $user['username'];
	$character_name = getUserCharacterName($_SESSION['username']);

	$smarty->assign('username_logged', $_SESSION['username']);	// logged-in username
	$smarty->assign('username_page', $username_page);			// username of profile's user
	$smarty->assign('id_logged', $_SESSION['id']);				// logged-in id
	$smarty->assign('id', $id);									// id of profile's user
	$smarty->assign('character_name', $character_name);
	$smarty->assign('public', $user['public']);					// privacy of profile's user
	$smarty->assign('postid', $postid);

	// get post
	$post = getPost($postid);
	$smarty->assign('post', $post);
	
	$like = hasUserLikedPost($id_logged, $post['postid']);
	$smarty->assign('like', $like);
	
	// get post comments
	$stmt = getCommentsPost($postid);
	$comments = $stmt->fetchAll();
	$smarty->assign('comments', $comments);
	
	$character = getUserCharacter($username_page);
	$image = getUserProfileImage($character['charid']);
	$series = getAnime($character['charid']);
	$res = checkFriendship($_SESSION['id'], $id);				// check friendship between logged-in user and profile user
	$friendship = ($res !== false);
	
	$smarty->assign('character', $character);
	$smarty->assign('series', $series);
	$smarty->assign('image', $image);
	$smarty->assign('friendship', $friendship);
	$smarty->assign('friend', $res);

	if(isPostFromUser($postid, $id)){
		if(isProfilePost($postid, $id)) {
			// get next photo
			$next_img = getNextImage($id, $post['imgid']);
			$smarty->assign('nextimg', $next_img);

			// get previous photo
			$previous_img = getPreviousImage($id, $post['imgid']);
			$smarty->assign('previousimg', $previous_img);
		} else {
			$page_not_found = '404 Error. Page not found.';
			$smarty->assign('page_not_found', $page_not_found);
		}
		
		if (isset($_SESSION['settings'])) {
			if (basename($_SERVER['PHP_SELF']) != $_SESSION['settings']) {
				unset($_SESSION['passwords']);
				unset($_SESSION['old-password']);
				unset($_SESSION['user_exists']);
				unset($_SESSION['email_exists']);
				unset($_SESSION['password-success']);
		   }
		}
		unset($_SESSION['settings']);
		
		if (isset($_SESSION['previous_dates'])) {
			if (basename($_SERVER['PHP_SELF']) != $_SESSION['previous_dates']) {
				unset($_SESSION['wrong_dates']);
		   }
		}
		unset($_SESSION['previous_dates']);
		
	} else {
		$page_not_found = '404 Error. Page not found.';
		$smarty->assign('page_not_found', $page_not_found);
	}

	$smarty->display($BASE_DIR . 'templates/post_display.tpl');
?>