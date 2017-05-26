<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$user_id = $_POST['user-id'];
	
	$user = getUserInfo($user_id);
	
	unset($_SESSION['passwords']);
	unset($_SESSION['old-password']);
	unset($_SESSION['user_exists']);
	unset($_SESSION['email_exists']);
	unset($_SESSION['password-success']);
	
	if(empty($_POST['username'])){
		$username = $user['username'];
	} else {
		$username = $_POST['username'];
		$_SESSION['username'] = $username;
		
		if(usernameExists($username) && $username != $user['username']) {
			$_SESSION['user_exists'] = 'User already exists';
		}
	}
	
	if(empty($_POST['email'])){
		$email = $user['email'];
	} else {
		$email = $_POST['email'];
		
		if(emailExists($email) && $email != $user['email']) {
			$_SESSION['email_exists'] = 'E-mail already exists!';
		}
	}
	
	if(empty($_POST['old-password']) || empty($_POST['new-password']) || empty($_POST['rep-password'])){
		$password = $user['password'];
	} else {	
		if(password_verify($_POST['old-password'], $user['password'])){
			
			if($_POST['new-password'] == $_POST['rep-password']){
				$password = password_hash($_POST['new-password'], PASSWORD_DEFAULT);
				$_SESSION['password-success'] = 'Password changed with success';
			} else {
				$_SESSION['passwords'] = 'Passwords do not match!';
				$password = $user['password'];
			}
		} else {
			$_SESSION['old-password'] = true;
			$password = $user['password'];
		}
	}
	
	if($_POST['notifications'] == 0) {
		$_SESSION['notifications'] = true;
	} else {
		$_SESSION['notifications'] = false;
	}
	
	$privacy = $_POST['privacy'];
	
	if(!(isset($_SESSION['passwords']) || isset($_SESSION['user_exists']) || isset($_SESSION['email_exists']) || isset($_SESSION['old-password'])))
		updateUserSettings($user_id, $username, $password, $email, $privacy);
	
	header('Location: ' . $_SERVER['HTTP_REFERER']);
?>