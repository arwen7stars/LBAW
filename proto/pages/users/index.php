<?php
include_once('../../config/init.php');

if(!isset($_SESSION['id'])) {
	header('Location: ../../pages/users/index.php');
	exit();
}
header('Location: ../../pages/users/feed.php');
?>
