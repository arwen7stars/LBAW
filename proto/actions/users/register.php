<?php
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	session_start();
	
	$username = $_POST['username'];
	$name = $_POST['name'];
	$p = $_POST['password'];
	$rp = $_POST['repeat_password'];
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
	
	var_dump($p);
	var_dump($rp);
	if ($p != $rp) {
		$_SESSION['passwords'] = 'Passwords do not match!';
	}

	if(usernameExists($username)) {
		$_SESSION['user_exists'] = 'Username already exists!';
	}
	
	if(emailExists($email)) {
		$_SESSION['email_exists'] = 'E-mail already exists!';
	}
	
	$password = password_hash($p, PASSWORD_DEFAULT);
	
	if(!(isset($_SESSION['passwords']) || isset($_SESSION['user_exists']) || isset($_SESSION['email_exists'])))
		addUser($name, $username, $password, $email, $date, $character, $location);
	
	$referer = '../../pages/users/signup.php';
	header('Location: ' . $referer);
	
?>