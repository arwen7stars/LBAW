<?php

function userExists($username, $password) {
        global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User" WHERE username = ?');
        $stmt->execute(array($username));
        $user = $stmt->fetch();
        return ($user !== false && password_verify($password, $user['password']));
    }
?>