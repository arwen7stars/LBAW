<?php
	session_start();
	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/users.php');
	include_once($BASE_DIR . 'database/posts.php');
	include_once($BASE_DIR . 'database/events.php');
	
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
	
	$event = getEvent($_GET['event-id']);
	
	if(isPostFromUser($postid, $id)){
		if(isPostFromEvent($postid, $_GET['event-id'])){
			$res = getUserEvent($_SESSION['id'], $_GET['event-id']);
			$belongs = ($res !== false);
			
			$next_img = getNextImageEvent($_GET['event-id'], $post['imgid']);
			$smarty->assign('nextimg', $next_img);
			
			$previous_img = getPreviousImageEvent($_GET['event-id'], $post['imgid']);
			$smarty->assign('previousimg', $previous_img);
			
			$event_page = 't';
			$smarty->assign('event_page', $event_page);
			$smarty->assign('event_id', $_GET['event-id']);
			$smarty->assign('event', $event);
			$smarty->assign('belongs', $belongs);
		} else {
			$page_not_found = '404 Error. Page not found.';
			$smarty->assign('page_not_found', $page_not_found);
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
	
	$smarty->display($BASE_DIR . 'templates/post_event_display.tpl');
?>