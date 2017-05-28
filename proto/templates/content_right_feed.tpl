{if isset($id_logged)}
<div class="notifications">
	<h3><a href="#">Notifications</a></h3>
	<ul class="notification-list list-unstyled">
		{foreach $notifications as $notification}
		
		<div id="confirm-friendship-{$notification.id}" class="edit_box">
		
			<div class="modal-body">
				<a href="javascript:void(0)" id="close-friendship-{$notification.id}" class="close-friendship pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a>
				
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
		<button id="click-event-invitation-{$notification.id}" class="event btn btn-default event-invitation">
		<i class="fa fa-calendar"></i> Event invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		</li>
		{else}
		{if !empty($notification.groupid)}
		<hr>
		<li>
		<button id="click-group-invitation-{$notification.id}" class="group btn btn-default group-invitation">
		<i class="fa fa-users"></i> Group invitation</button>
		<div class="small-txt">{$notification.date|date_format}</div>
		</li>
		{/if}
		{/if}
		{/if}
		{/foreach}
	</ul>
</div>

        <div class="recent-news">
          <h3><a href="#">Recent News </a></h3>
          <p>{$news.body}</p>
          <div class="read-more"><a href="{$news.moreInfo}" target="_blank">Read more...</a></div>
        </div>
		{/if}