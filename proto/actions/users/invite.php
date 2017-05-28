<?php
	session_start();
	include_once('../../config/init.php');
	include_once('../../database/users.php');
	
	$email = $_POST['email'];
	if(!emailExists($email))
	{
		$subject = 'Anibook :: Invitation';
			$message = 'You have been invited to register on Anibook by your friend '. getUserCharacterName($_SESSION['username']) . '.
Feel free to join our amazing Anime platform at any time in the following link: https://gnomo.fe.up.pt/~lbaw1624/proto/pages/users/signup.php';
			$headers = 'From: anibook@anibook.com' . "\r\n" .
			'Reply-To: anibook@anibook.com' . "\r\n" .
			'X-Mailer: PHP/' . phpversion();
			mail($email, $subject, $message, $headers);
	}
	header('Location: ../../pages/users/feed.php');
?>