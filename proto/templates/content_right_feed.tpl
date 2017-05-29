{if isset($id_logged)}
<div class="notifications">
	<h3>Notifications</h3>
	{if empty($notifications)}
		<hr>
		No pending notifications...
	{else}
	<ul class="notification-list list-unstyled">
		{foreach $notifications as $notification}
		
		<div id="confirm-friendship-{$notification.id}" class="edit_box">
		
			<div class="modal-body">
				<p><a href="javascript:void(0)" id="close-friendship-{$notification.id}" class="close-friendship pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a></p>
				
				<div class="poster">					
					<p><a href="profile_feed.php?user-id={$notification.userid}"><img src="{$notification.charurl}" alt="Profile picture of {$notification.charname}" class="centered-and-cropped thumb-32px"></a>
						<span><a href="profile_feed.php?user-id={$notification.userid}">{$notification.charname}</a> has sent you a friend request!</span></a>
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
		
		{if ($id_logged == $notification.usertwo)}
		<hr>
		<li>
			<button id="click-friendship-{$notification.id}" class="friendship btn btn-default">
			<i class="fa fa-user-plus"></i> Friend request</button>
			<div class="small-txt">{$notification.date|date_format}</div>
		</li>
		{else}
		{if !empty($notification.eventid)}
		<hr>
		<li>
		<button id="click-event-invitation-{$notification.id}" class="event-invitation btn btn-default">
		<i class="fa fa-calendar"></i> Event invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		</li>
		{else}
		{if !empty($notification.groupid)}
		<hr>
		<li>
		<button id="click-group-invitation-{$notification.id}" class="group-invitation btn btn-default">
		<i class="fa fa-users"></i> Group invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		</li>
		{/if}
		{/if}
		{/if}
		{/foreach}
	</ul>
	{/if}
</div>

        <div class="recent-news">
          <h3>Recent News</h3>
          <p>{$news.body}</p>
          <div class="read-more"><a href="{$news.moreInfo}" target="_blank">Read more...</a></div>
        </div>
		{/if}