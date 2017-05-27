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
	
	function addUserEvent($user_id, $event_id, $admin) {
        global $dbh;
		$query = 'INSERT INTO "User-Event" ("user-id", "event-id","admin") VAlUES (? , ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id, $event_id, $admin));
	}
	
	function getEventPosts($event_id)
	{
		global $dbh;
		$query = 'SELECT "Post"."id" AS postid, "Post"."body" AS body, "Post"."public" as public, "Post"."date" AS date, "Post"."user-id" as user,
		"Post-Images"."id" as imgid, "Post-Images"."url" AS url, "Post-Images"."description" AS description,
		"Character"."name" AS charname, "Image"."url" AS "charurl",
		COUNT("Likes"."id") AS "likes"
		FROM "User", "Character-Image", "Character", "Image", "Post"		
		LEFT JOIN (
		  SELECT "Image"."id", "Image"."url", "Image"."description", "Image"."post-id"
		  FROM "Image"
		  WHERE "Image"."post-id" IS NOT NULL
		) AS "Post-Images"
		ON "Post"."id" = "Post-Images"."post-id"
		LEFT JOIN "Likes" ON "Post"."id" = "Likes"."post-id" AND "Likes"."comment-id" IS NULL
		WHERE "Post"."event-id" = :event_id
			AND "User".id = "Post"."user-id"
			AND "Character"."id" = "User"."character-id"
			AND "Character-Image"."character-id" = "Character"."id"
			AND "Character-Image"."image-id" = "Image"."id" AND "Post"."group-id" IS NULL
		GROUP BY "Post"."id", "Post-Images"."id", "Post-Images"."url", "Post-Images"."description", "Character"."name", "Image"."url"
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
	
	function isUserFromEvent($user_id, $event_id) {
		global $dbh;
        $stmt = $dbh->prepare('SELECT * FROM "User-Event", "Event"
		WHERE "User-Event"."event-id" = "Event"."id" AND "Event"."id" = :event AND "User-Event"."user-id" = :user');
		$stmt->bindParam(':event', $event_id);
		$stmt->bindParam(':user', $user_id);
		$stmt->execute(array($event_id, $user_id));
		$res = $stmt->fetch();
		
		return ($res !== false);		
	}
?>