<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	session_start();
	
	$username = $_POST['username'];
	$name = $_POST['name'];
	$p = $_POST['password'];
	$rp = $_POST['rep_password'];
	$email = $_POST['email'];
	$character = $_POST['character'];
	
	if( $_POST['location'] == -1 ){
		$location = null;
	} else {
		$location = $_POST['location'];
	}

	if(empty($_POST['date'])) {
		$date = null;
	} else {
		$date = $_POST['date'];
	}
	
	unset($_SESSION['passwords']);
	unset($_SESSION['user_exists']);
	unset($_SESSION['email_exists']);
	
	$password = password_hash($p, PASSWORD_DEFAULT);
	
	if ($p != $rp) {
		$_SESSION['passwords'] = 'Passwords do not match!';
	}

	if(usernameExists($username)) {
		$_SESSION['user_exists'] = 'User already exists';
	}
	
	if(emailExists($email)) {
		$_SESSION['email_exists'] = 'E-mail already exists!';
	}
	
	if(!(isset($_SESSION['passwords']) || isset($_SESSION['user_exists']) || isset($_SESSION['email_exists'])))
		addUser($name, $username, $password, $email, $date, $character, $location);
	
	if(!(isset($_SESSION['passwords']) || isset($_SESSION['user_exists']) || isset($_SESSION['email_exists'])))
		$referer = '../../pages/users/login.php';
	else $referer = '../../pages/users/signup.php';
	
	header('Location: ' . $referer);
	
?>