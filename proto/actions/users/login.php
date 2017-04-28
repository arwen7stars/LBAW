<?php
session_start();
include_once('../../config/init.php');
include_once('../../database/users.php');

$username = trim(strip_tags($_POST['username']));
$password= $_POST['password'];

//echo(password_hash("ola123456",PASSWORD_DEFAULT));

if(userExists($username,$password)){
	$_SESSION['username'] = $username;
	$_SESSION['id'] = getLoginID($username);
}
else{
	header('Location: ' . $_SERVER['HTTP_REFERER']);
	die();
}
header('Location: ../../pages/users/feed.php');
