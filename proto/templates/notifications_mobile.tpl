<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Notifications</title>

	<!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
	<link rel="stylesheet" href="../../lib/font-awesome-4.7.0/css/font-awesome.min.css">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/groups_events.css" rel="stylesheet">
	<link href="../../css/feed.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>
	{include file='header.tpl'}
	<div id="black" class="black_overlay"></div>
	<div id="group-event-box">
		<h2>Notifications</h2>
		<ul class="notification-list list-unstyled">
		{foreach $notifications as $notification}
		
		{if ($id_logged == $notification.usertwo)}
		<div id="confirm-friendship-{$notification.id}" class="edit_box">
		
			<div class="modal-body">
				<p><a href="javascript:void(0)" id="close-friendship-{$notification.id}" class="close-friendship pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a></p>
				
				<div class="poster">					
					<p><a href="profile_feed.php?user-id={$notification.userid}"><img src="{$notification.charurl}" alt="Profile picture of {$notification.charname}" class="centered-and-cropped thumb-32px"></a>
						<span><a href="profile_feed.php?user-id={$notification.userid}">{$notification.charname}</a> has sent you a friend request!</span>
					</p>
				</div>
				
			</div>
			<div class="modal-footer button-container">
				<form class="form" action="../../actions/users/delete_friendship.php" method="post">
					<input type="hidden" name="cancel" value="false">
					<input type="hidden" name="user1-id" value="{$notification.userid}">
					<input type="submit" class="btn" value="Delete">
				</form>
				
				<form class="form" action="../../actions/users/accept_friendship.php" method="post">
					<input type="hidden" name="user1-id" value="{$notification.userid}">
					<input type="submit" class="btn btn-primary" value="Accept">
				</form>
			</div>
		</div>
		{/if}
		<div id="confirm-event-{$notification.id}" class="edit_box">
		
			<div class="modal-body">
				<p><a href="javascript:void(0)" id="close-event-{$notification.id}" class="close-event pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a></p>
				
									
				<p>You have been invited to participate in <a href="../events/event_feed.php?event-id={$notification.eventid}">{$notification.eventname}!</a></p>
				<div class="event-info">
					<dl class="dl-horizontal">
						<dt>Duration of event</dt>
						<dd>{$notification.start|date_format} - {$notification.finish|date_format}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>Location</dt>
						<dd>{$notification.city}, {$notification.country}</dd>
					</dl>
				</div>
				
			</div>
			<div class="modal-footer button-container">
				<form class="form" action="../../actions/events/accept_invite.php" method="post">
						<input type="hidden" name="event-id" value="{$notification.eventid}">
						<button type="submit" class="btn btn-primary" name="type" value="going">Going</button>
						<button type="submit" class="btn btn-primary" name="type" value="maybe">Maybe</button>
						<button type="submit" class="btn btn-primary" name="type" value="ignore">Ignore</button>
				</form>
			</div>
		</div>
		
		<div id="confirm-group-{$notification.id}" class="edit_box">
		
			<div class="modal-body">
				<p><a href="javascript:void(0)" id="close-group-{$notification.id}" class="close-group pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a></p>
				
				<p>You have been invited to join <a href="../groups/feed.php?group-id={$notification.groupid}">{$notification.groupname}!</a></p>
				
			</div>
			<div class="modal-footer button-container">
				<form class="form" action="../../actions/groups/ignore_invite.php" method="post">
					<input type="hidden" name="group-id" value="{$notification.groupid}">
					<input type="submit" class="btn" value="Ignore">
				</form>
				
				<form class="form" action="../../actions/groups/accept_invite.php" method="post">
					<input type="hidden" name="group-id" value="{$notification.groupid}">
					<input type="submit" class="btn btn-primary" value="Accept">
				</form>
			</div>
		</div>
		
		<div class="notification-content">
		{if ($id_logged == $notification.usertwo)}
		<hr>
			<button id="click-friendship-{$notification.id}" class="friendship btn btn-default">
			<i class="fa fa-user-plus"></i> Friend request</button>
			<div class="small-txt">{$notification.date|date_format}</div>
		{else}
		{if !empty($notification.eventid)}
		<hr>
		<button id="click-event-invitation-{$notification.id}" class="event-invitation btn btn-default">
		<i class="fa fa-calendar"></i> Event invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		{else}
		{if !empty($notification.groupid)}
		<hr>
		<button id="click-group-invitation-{$notification.id}" class="group-invitation btn btn-default">
		<i class="fa fa-users"></i> Group invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		{/if}
		{/if}
		{/if}
		</div>
		{/foreach}
		</ul>
	</div>
	
	{include file='footer.tpl'}
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="../../javascript/feed.js"></script>
</body>

</html>