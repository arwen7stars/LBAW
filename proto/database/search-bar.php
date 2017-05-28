<?php

session_start();
include_once('../config/init.php');

global $dbh;

$query = $_GET['query'];

$name = '%' . $query . '%';

$stmt = $dbh->prepare('
  SELECT *
  FROM "User"
  WHERE "User"."name" ILIKE :name
  AND "public" = true;');

$stmt->bindParam(':name', $name);
$stmt->execute();

$userResults = $stmt->fetchAll();

echo json_encode($userResults);

?>
