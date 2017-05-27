<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');

	$username = trim(strip_tags($_POST['username']));
	$password= $_POST['password'];

	unset($_SESSION['user_not_exists']);
	unset($_SESSION['wrong_password']);

	if(usernameExists($username)){
		if (checkPassword($username, $password)) {
			$_SESSION['username'] = $username;
			$_SESSION['id'] = getLoginID($username);			
		} else{
			$_SESSION['wrong_password'] = 'Wrong password';
		
			header('Location: ' . $_SERVER['HTTP_REFERER']);
			die();
		}
	}
	else{
		$_SESSION['user_not_exists'] = 'User does not exist';
		
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		die();
	}
	header('Location: ../../pages/users/feed.php');
?>