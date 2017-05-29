		{if isset($id_logged)}
		<div id="all-events" class="edit_box">
			<a href="javascript:void(0)" id="close-events" class="close-edit pull-right">
			<span class="close glyphicon glyphicon-remove"></span></a>
			<h2>Event</h2>
			<hr>
			<ul class="events-content list-group row">
			{foreach $all_events as $event}
				<li class="list-group-item col-xs-6"><a href="../../pages/events/event_feed.php?event-id={$event.id}"><i class="fa fa-calendar"></i> {$event.name}</a>
				<p>{$event.start|date_format} - {$event.finish|date_format}</p></li>
			{/foreach}
			</ul>
		</div>

        <div class="events">
			<div class="add-instance pull-right"><a class="border-create" href="../../pages/events/create_event.php"><span class="glyphicon glyphicon-plus"></span></a></div>
			<h3>Events</h3>
			<hr>
			{if empty($events)}
			No events yet...
			{else}
			<ul class="event-list list-unstyled">
				{foreach $events as $event}
				<li><a href="../../pages/events/event_feed.php?event-id={$event.id}"><i class="fa fa-calendar"></i> {$event.name}</a></li>
				{/foreach}
			</ul>
			{if ($length_event > 3)}
			<a id="see-events" href="javascript:void(0)">See more...</a>
			{/if}
			{/if}
        </div>
		
		<div id="all-groups" class="edit_box">
			<a href="javascript:void(0)" id="close-groups" class="close-edit pull-right">
			<span class="close glyphicon glyphicon-remove"></span></a>
			<h2>Groups</h2>
			<hr>
			<ul class="groups-content list-group row">
			{foreach $all_groups as $group}
				<li class="list-group-item col-xs-6"><a href="../../pages/groups/feed.php?group-id={$group.id}"><i class="fa fa-group"></i> {$group.name}</a></li>
			{/foreach}
			</ul>
		</div>
		
        <div class="groups">
			<div class="add-instance pull-right"><a class="border-create" href="../../pages/groups/create_group.php"><span class="glyphicon glyphicon-plus"></span></a></div>
			<h3>Groups</h3>
			<hr>
			{if empty($groups)}
			No groups yet...
			{else}
			<ul class="group-list list-unstyled">
				{foreach $groups as $group}
				<li><a href="../../pages/groups/feed.php?group-id={$group.id}"><i class="fa fa-group"></i> {$group.name}</a></li>
				{/foreach}
			</ul>
			{if ($length_group > 3)}
			<a id="see-groups" href="javascript:void(0)">See more...</a>
			{/if}
			{/if}
        </div>
		
		<div class="friend-invite">
			<h3>Invite Friends to Anibook!</h3>
			<hr>
			<form id="invite_friend" action="../../actions/users/invite.php" method="post">
				<input class="invite-text" type="email" name="email" placeholder=" + Insert your friend's e-mail address...">
				<h5 id="result"></h5>
			</form>
        </div>

        <!-- <div class="chat">
          <h3><a href="#">Online Friends</a></h3>
          <ul class="contact-list list-unstyled">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Hikari</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Himari</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Masamune</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Naruto</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Son Goku</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Vegeta</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Kasuma</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Aqua</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Eris</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Megumin</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Mauve</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Ecchan</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bulma</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sakura</a></li>
          </ul>
          
          <form role="search">
            <div class="form-group chat-search-bar">
              <label for="search-bar-btn" class="sr-only">Search bar</label>
              <div class="input-group">
                <input type="search" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button id="search-bar-btn" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </form>
        </div>-->
		{/if}