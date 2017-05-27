<?php

	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');
	include_once($BASE_DIR . 'database/posts.php');
	include_once($BASE_DIR . 'database/groups.php');

	$id = $_GET['user-id'];					// profile id
	$postid = $_GET['post-id'];				// post id
	
	if(isPostFromUser($postid, $id)){
		$user = getUserInfo($id);
		$username_page = $user['username'];
		$character_name = getUserCharacterName($_SESSION['username']);

		$smarty->assign('username_logged', $_SESSION['username']);	// logged-in username
		$smarty->assign('username_page', $username_page);			// username of profile's user
		$smarty->assign('id_logged', $_SESSION['id']);				// logged-in id
		$smarty->assign('id', $id);									// id of profile's user
		$smarty->assign('public', $user['public']);					// privacy of profile's user
		$smarty->assign('postid', $postid);

		// get post
		$post = getPost($postid);
		$smarty->assign('post', $post);
		
		// get post comments
		$stmt = getCommentsPost($postid);
		$comments = $stmt->fetchAll();
		$smarty->assign('comments', $comments);
		
		if($_GET['group-id']) {
			$group = getGroup($_GET['group-id']);
			
			if(isPostFromGroup($postid, $_GET['group-id'])){
				$next_img = getNextImageGroup($id, $post['imgid']);
				$smarty->assign('nextimg', $next_img);
				
				$previous_img = getPreviousImageGroup($id, $post['imgid']);
				$smarty->assign('previousimg', $previous_img);
				
				$group_page = 't';
				$smarty->assign('group_page', $group_page);
				$smarty->assign('group_id', $_GET['group-id']);
				$smarty->assign('group', $group);
			} else {
				$page_not_found = '404 Error. Page not found.';
				$smarty->assign('page_not_found', $page_not_found);
			}
		} else{
			// get next photo
			$next_img = getNextImage($id, $post['imgid']);
			$smarty->assign('nextimg', $next_img);

			// get previous photo
			$previous_img = getPreviousImage($id, $post['imgid']);
			$smarty->assign('previousimg', $previous_img);
			
			$character = getUserCharacter($username_page);
			$image = getUserProfileImage($character['charid']);
			$series = getAnime($character['charid']);
			$res = checkFriendship($_SESSION['id'], $id);				// check friendship between logged-in user and profile user
			$friendship = ($res !== false);
			
			$smarty->assign('character', $character);
			$smarty->assign('character_name', $character_name);
			$smarty->assign('series', $series);
			$smarty->assign('image', $image);
			$smarty->assign('friendship', $friendship);
			$smarty->assign('friend', $res);
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
	} else {
		$page_not_found = '404 Error. Page not found.';
		$smarty->assign('page_not_found', $page_not_found);
	}

	$smarty->display($BASE_DIR . 'templates/post_display.tpl');
?>