<?php
	function addEvent($eventName, $startDate, $endDate, $eventPrivacy, $description, $eventLocation)
	{
		global $dbh;
		$query = 'INSERT INTO "Event" ("name", "start", "finish", "public", "location-id", "about")
		VAlUES ( :eventName , :startDate, :endDate, :eventPrivacy, :locationId, :description) RETURNING id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':eventName', $eventName);
		$stmt->bindParam(':startDate', $startDate);
		$stmt->bindParam(':endDate', $endDate);
		$stmt->bindParam(':eventPrivacy', $eventPrivacy);
		$stmt->bindParam(':locationId', $eventLocation);
		$stmt->bindParam(':description', $description);
		$stmt->execute(array($eventName, $startDate, $endDate, $eventPrivacy, $eventLocation, $description));
		$res = $stmt->fetch();
		
		return $res['id'];
	}
	
	function listEvents($userId)
	{
		global $dbh;
		$query = 'SELECT * FROM "Event","User-Event" Where "User-Event"."user-id" = :userid AND "Event".id = "User-Event"."event-id" ORDER BY "Event"."start"';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':userid', $userId);
		$stmt->execute(array($userId));
		return $stmt->fetchAll();
	}
	
	function getEventInfo($event_id)
	{
		global $dbh;
		$query = 'SELECT * FROM "Event" WHERE "Event".id = :event_id';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event_id', $event_id);
		$stmt->execute(array($event_id));
		return $stmt->fetch();
	}
	
	function addUserEvent($user_id, $event_id, $admin, $participation) {
        global $dbh;
		$query = 'INSERT INTO "User-Event" ("user-id", "event-id","admin", "type") VAlUES (? , ?, ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id, $event_id, $admin, $participation));
	}
	
	function getEventPosts($event_id)
	{
		global $dbh;
		$query = 'SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		"Likes-Comments"."likes", "Comments-Likes"."comments" AS "comments"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
		  SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
		  FROM "Image"
		  WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN (
			SELECT "Likes"."post-id", COUNT("Likes"."id") AS "likes", "Comments"."comments" FROM "Likes" 
			LEFT JOIN
			(
				SELECT COUNT("Comment"."id") AS "comments", "Comment"."post-id" AS id
				FROM "Comment"
				GROUP BY "Comment"."post-id"
			) AS "Comments"
			ON "Comments"."id" = "Likes"."post-id"
			GROUP BY "Comments"."comments", "Likes"."post-id"
		) AS "Likes-Comments"
		ON "Post"."id" = "Likes-Comments"."post-id"
		LEFT JOIN (
		SELECT "Comment"."post-id", COUNT("Comment"."id") AS "comments", "NoLikes"."likes", "NoLikes"."postid" FROM "Comment"
			LEFT JOIN
			(
				SELECT COUNT("Likes"."id") AS "likes", "Likes"."post-id" AS postid
				FROM "Likes"
				GROUP BY "Likes"."post-id"
			) AS "NoLikes"
			ON "NoLikes"."postid" = "Comment"."post-id"
			GROUP BY "Comment"."post-id", "NoLikes"."likes", "NoLikes"."postid"
		) AS "Comments-Likes"
		ON "Post"."id" = "Comments-Likes"."post-id"
		WHERE "Post"."event-id" = :event_id
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id" AND "Post"."group-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url", "Likes-Comments"."likes", "Comments-Likes"."comments"
		ORDER BY date DESC, "Post"."id" DESC';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event_id', $event_id);
		$stmt->execute(array($event_id));
		return $stmt->fetchAll();
	}
	
	function getEventImages($event_id) {
		global $dbh;
		
		$query = 'SELECT "Post"."id" AS id, "Post"."user-id" AS "user", "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id" FROM "Post", "Image" WHERE "Post"."event-id" = ? AND "post-id" = "Post".id ORDER BY "Post".date DESC, "Post".id DESC';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($event_id));
		
		return $stmt->fetchAll();
	}
	
	function getEvent($event_id) {
		global $dbh;
		
		$query = 'SELECT * FROM "Event" WHERE "Event"."id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));
		
		return $stmt->fetch();
	}
	
	function getNextImageEvent($event_id, $image_id) {
		global $dbh;
		$stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."event-id" = :event AND "post-id" = "Post".id AND "Image"."id" > :img
				ORDER BY "Image"."id"
				LIMIT 1');
		$stmt->bindParam(':event', $event_id);
		$stmt->bindParam(':img', $image_id);
		$stmt->execute(array($event_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function getPreviousImageEvent($event_id, $image_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Post"."id" AS id, "Image"."id" as imgid, "Image"."url" AS url, "Image"."description" AS description, "Image"."post-id"
				FROM "Post", "Image"
				WHERE "Post"."event-id" = :event AND "post-id" = "Post".id AND :img > "Image"."id"
				ORDER BY "Image"."id" DESC LIMIT 1');
		$stmt->bindParam(':event', $event_id);
		$stmt->bindParam(':img', $image_id);
        $stmt->execute(array($event_id, $image_id));
		
		$img = $stmt->fetch();
		
		return $img;	
	}
	
	function isPostFromEvent($post_id, $event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "Post" WHERE "Post"."id" = :post AND "Post"."event-id" = :event');
		$stmt->bindParam(':post', $post_id);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($post_id, $event_id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function getUserEvent($user_id, $event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User-Event", "Event"
		WHERE "User-Event"."event-id" = "Event"."id" AND "Event"."id" = :event AND "User-Event"."user-id" = :user');
		$stmt->bindParam(':event', $event_id);
		$stmt->bindParam(':user', $user_id);
		$stmt->execute(array($event_id, $user_id));
		$res = $stmt->fetch();
		
		return $res;		
	}
	
	function getEventLocation($event_id) {
		global $dbh;
		
		$query = 'SELECT "Location"."id" AS id, "city", "country" FROM "Event", "Location" WHERE "Event"."id" = ? AND "Event"."location-id" = "Location"."id"';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($event_id));
		return $stmt->fetch();
	}
	
	function isUserEventAdmin($id, $event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User-Event", "Event"
		WHERE "User-Event"."event-id" = "Event"."id" AND "Event"."id" = :event AND "User-Event"."user-id" = :user AND "User-Event"."admin" IS TRUE');
		$stmt->bindParam(':event', $event_id);
		$stmt->bindParam(':user', $id);
		$stmt->execute(array($event_id, $id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function getEventGuests($event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT "Image"."url" AS url, "Image"."description" AS alt, "User"."id" AS id, "User-Event"."admin", "User-Event"."type", "Character"."name"
		FROM "Event", "User-Event", "Character-Image", "Character", "Image", "User"
		WHERE "Event"."id" = :event AND "Event"."id" = "User-Event"."event-id" AND "User"."id" = "User-Event"."user-id" AND
		"Character"."id" = "User"."character-id" AND "Character-Image"."character-id" = "Character"."id"
		AND "Character-Image"."image-id" = "Image"."id"
		ORDER BY "User-Event"."type"');
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));
		
		return $stmt->fetchAll();	
	}
	
	function updateEvent($event_id, $name, $public, $event_start, $event_end, $location_id, $about) {
		global $dbh;
		
		$query = 'UPDATE "Event"
		SET("name", "public", "start", "finish", "location-id", "about") = (:name, :public, :start, :finish, :location, :about)
		WHERE "Event"."id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':name', $name);
		$stmt->bindParam(':public', $public);
		$stmt->bindParam(':start', $event_start);
		$stmt->bindParam(':finish', $event_end);
		$stmt->bindParam(':location', $location_id);
		$stmt->bindParam(':about', $about);
		$stmt->bindParam(':event', $event_id);
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($name, $public, $event_start, $event_end, $location_id, $about, $event_id));
	}

	function deleteEvent($event_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Event" WHERE "Event"."id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));
	}
	
	function deleteUsersEvent($event_id) {
		global $dbh;
		
		$query = 'DELETE FROM "User-Event" WHERE "User-Event"."event-id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));	
	}
	
	function deleteEventInvites($event_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Event-Invite" WHERE "Event-Invite"."event-id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));		
	}
	
	function deleteEventNotifications($event_id) {
		global $dbh;
		
		$query = 'DELETE FROM "Notification" WHERE "Notification"."event-id" = :event';
		$stmt = $dbh->prepare($query);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));		
	}
	
	function leaveEvent($id, $event_id) {
		global $dbh;
		
		$stmt = $dbh->prepare('DELETE FROM "User-Event" WHERE "User-Event"."user-id" = :user AND "User-Event"."event-id" = :event');
		$stmt->bindParam(':user', $id);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($id, $event_id));
	}
	
	function isEventValid($event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "Event" WHERE "Event"."id" = :event');
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($event_id));
		$res = $stmt->fetch();
		
		return ($res !== false);
	}
	
	function deleteEventNotification($user_id, $event_id) {
		global $dbh;
		
		$stmt = $dbh->prepare('DELETE FROM "Notification" WHERE "Notification"."user-id" = :user AND "Notification"."event-id" = :event');
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($user_id, $event_id));
	}
	
	function deleteEventInvitation($admin_id, $user_id, $event_id) {
		global $dbh;
		
		$stmt = $dbh->prepare('DELETE FROM "Event-Invite"
		WHERE "Event-Invite"."event-admin-id" = :admin AND "Event-Invite"."user-id" = :user AND "Event-Invite"."event-id" = :event');
		$stmt->bindParam(':admin', $admin_id);
		$stmt->bindParam(':user', $user_id);
		$stmt->bindParam(':event', $event_id);
		$stmt->execute(array($admin_id, $user_id, $event_id));
	}
?>