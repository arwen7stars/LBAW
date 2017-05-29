<?php

session_start();
include_once('../config/init.php');

global $dbh;

$query = $_GET['query'];

$name = '%' . $query . '%';

$stmtu = $dbh->prepare('
SELECT "Character"."name" AS "char_name", "Image"."url" AS "char_img_url", "User"."id" AS "user_id"
FROM "Character", "Image", "User", "Character-Image"
WHERE to_tsvector("Character"."name") @@ plainto_tsquery(:name)
AND "User"."character-id" = "Character"."id"
AND "User"."public" = true
AND "Character-Image"."character-id" = "Character"."id"
AND "Character-Image"."image-id" = "Image"."id"
LIMIT 5;');

$stmtg = $dbh->prepare('
SELECT "Group"."name" AS "group_name", "Group"."id" AS "group_id"
FROM "Group"
WHERE to_tsvector("Group"."name") @@ plainto_tsquery(:name)
LIMIT 5;');

$stmte = $dbh->prepare('
SELECT "Event"."name" AS "event_name", "Event"."id" AS "event_id"
FROM "Event"
WHERE to_tsvector("Event"."name") @@ plainto_tsquery(:name)
LIMIT 5;');

$stmtu->bindParam(':name', $name);
$stmtg->bindParam(':name', $name);
$stmte->bindParam(':name', $name);
$stmtu->execute();
$stmtg->execute();
$stmte->execute();

$userResults = $stmtu->fetchAll();
$groupResults = $stmtg->fetchAll();
$eventResults = $stmte->fetchAll();

echo json_encode([$userResults, $groupResults, $eventResults]);

?>
