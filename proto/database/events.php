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
		return $stmt->fetchAll();
	}
	
	function addUserEvent($user_id, $event_id, $admin) {
        global $dbh;
		$query = 'INSERT INTO "User-Event" ("user-id", "event-id","admin") VAlUES (? , ?, ?)';
		$stmt = $dbh->prepare($query);
		$stmt->execute(array($user_id, $event_id, $admin));
	}
?>