<?php
session_start();
include_once('../config/init.php');

$userid = $_SESSION['id'];
$commentid = $_POST['comment-id'];

global $dbh;
// update nr of likes
$stmt = $dbh->prepare('
INSERT INTO "Likes" ("user-id", "comment-id")
VALUES (:user_id, :comment_id)');
$stmt->bindParam(':user_id', $userid);
$stmt->bindParam(':comment_id', $commentid);
$stmt->execute();
// get updated likes count
$stmt = $dbh->prepare('
SELECT COUNT(*) FROM "Likes"
WHERE "Likes"."comment-id" = :comment_id;');
$stmt->bindParam(':comment_id', $commentid);
$stmt->execute();
$likes = $stmt->fetch();
// tell client nr of likes
echo json_encode($likes);
?>