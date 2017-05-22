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
	
	$password = password_hash($p, PASSWORD_DEFAULT);
	$repeat_password = password_hash($rp, PASSWORD_DEFAULT);
	
	if ($password != $repeat_password) {
		$_SESSION['passwords'] = 'Passwords do not match!';
	} else unset($_SESSION['passwords']);

	if(usernameExists($username)) {
		$_SESSION['user_exists'] = 'Username already exists!';
	} else unset($_SESSION['user_exists']);
	
	if(emailExists($email)) {
		$_SESSION['email_exists'] = 'E-mail already exists!';
	} else unset($_SESSION['email_exists']);
	
	if(!(isset($_SESSION['passwords']) || isset($_SESSION['user_exists']) || isset($_SESSION['email_exists'])))
		addUser($name, $username, $password, $email, $date, $character, $location);
	
	$referer = '../../pages/users/signup.php';
	header('Location: ' . $referer);
	
?>