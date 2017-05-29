<?php

session_start();
include_once('../config/init.php');

$userid = $_SESSION['id'];
$postid = $_POST['post-id'];

global $dbh;

// update nr of likes

$stmt = $dbh->prepare('
INSERT INTO "Likes" ("user-id", "post-id")
VALUES (:user_id, :post_id)');

$stmt->bindParam(':user_id', $userid);
$stmt->bindParam(':post_id', $postid);
$stmt->execute();

// get updated likes count

$stmt = $dbh->prepare('
SELECT COUNT(*) FROM "Likes"
WHERE "Likes"."post-id" = :post_id;');

$stmt->bindParam(':post_id', $postid);
$stmt->execute();

$likes = $stmt->fetch();

// tell client nr of likes

echo json_encode($likes);

?>
