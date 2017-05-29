<?php

session_start();
include_once('../config/init.php');

global $dbh;

$query = $_GET['query'];

$name = '%' . $query . '%';

$stmt = $dbh->prepare('
SELECT "Character"."name" AS "char_name", "Image"."url" AS "char_img_url", "User"."id" AS "user_id"
FROM "Character", "Image", "User", "Character-Image"
WHERE "Character"."name" ILIKE :name
AND "User"."character-id" = "Character"."id"
AND "User"."public" = true
AND "Character-Image"."character-id" = "Character"."id"
AND "Character-Image"."image-id" = "Image"."id"
LIMIT 5;');

$stmt->bindParam(':name', $name);
$stmt->execute();

$userResults = $stmt->fetchAll();

echo json_encode($userResults);

?>
