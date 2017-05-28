<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	$password = generateRandomString(14);
	$email = $_POST['email'];
		if(emailExists($email)) 
		{
			$subject = 'Anibook :: Recover Password';
			$message = 'You have recently request a password recovery for Anibook Website. 
	Feel free to change your new password by logging in Anibook Website.
	Your new password is ' . password;
			$headers = 'From: webmaster@anibook.com' . "\r\n" .
			'Reply-To: webmaster@example.com' . "\r\n" .
			'X-Mailer: PHP/' . phpversion();
			mail($email, $subject, $message, $headers);
			UpdateEmailPassword($email, $password);
		}
		header('Location: ../../pages/users/login.php');
?>