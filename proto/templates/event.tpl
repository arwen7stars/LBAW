<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Event - {$event.name}</title>

  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../css/feed.css" rel="stylesheet">
  <link href="../../css/event.css" rel="stylesheet">
</head>

<body>
	  
	{include file='header.tpl'}

  
  <!--Event Stuff-->  	
	<div class="container text-center event">
		<img src="../../images/group.png" class="img-responsive" alt="Group Image">
		<div class="btn-group-lg info" role="group" aria-label="...">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-lg">Interested</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-lg">Going</button>
			</div>
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-lg">Ignore</button>
			</div>
		</div>
	<div class="container details">
	
	<!--<h2 align="left">About</h2>!-->
	<p>{$event.start} - {$event.finish} </p>
	<p>{$event.about}</p>
	</div>
</div>

 <!-- Main Content -->
    <div class="content">

      <!--  Left -->
      <div class="content-left hidden-xs">

        <div class="events">
          <h2><a href="event.html">Events</a></h2>
          <ul class="event-list list-unstyled">
			{foreach $eventList as $event}
			<li><a href="../../pages/events/event_feed.php?event-id={$event.id}"> {$event.name} </a></li>
			{/foreach}
			<li><a href="../../pages/events/create_event.php">+ Create a new Event</li>
          </ul>
        </div>

        <div class="groups">
          <h2><a href="group.html">Groups</a></h2>
          <ul class="group-list list-unstyled">
            <!-- Max 3 list-items at once -->
            <li><a href="#">Duis in vehicula</a></li>
            <li><a href="#">Fermentum eget</a></li>
            <li><a href="#">Maecenas sit</a></li>
          </ul>
        </div>

        <div class="chat">
          <h2><a href="#">Online Friends</a></h2>
          <ul class="contact-list list-unstyled">
            <li><a href="#" align=""><span class="glyphicon glyphicon-user"></span> Hikari</a></li>
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
          <!-- Search bar -->
          <form role="search">
            <div class="form-group chat-search-bar">
              <label for="search-bar" class="sr-only">Search bar</label>
              <div class="input-group">
                <input type="search" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </form>
        </div>

      </div>

      <!--  Middle -->
      <div class="content-middle">
		<!-- MAKE-POST -->
		<div class="make-post">
			<form class="form" action="../../actions/posts/post.php" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<br>
					<div class="btn-wrap">
						<input type="hidden" name="id" value="{$id_logged}">
						<input type="hidden" name="profile" value="false">
						<textarea id="make-post" name="body" class="form-control txtarea-post" rows="3" placeholder="Write something to post..."></textarea>
						<span class="button-container">
							<select name="public" class="selectpicker" data-width="fit">
								<option data-icon="glyphicon-globe" value="t">Public</option>
								<option data-icon="glyphicon-lock" value="f">Private</option>
							</select>

							<label class="btn btn-primary" for="my-file-selector">
								<input id="my-file-selector" type="file" name="image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
								<span class="glyphicon glyphicon-picture"></span> Upload
							</label>
							<span class="label label-info" id="upload-file-info"></span>
							<input type="submit" value="Post"/>
						</span>
					</div>
				</div>
			</form>
		</div>

		<div id="black" class="black_overlay"></div>
		{if empty($event_posts)}
		<div id="welcome-message">
			<p><h1>Welcome to Anibook!</h1></p>
			<p><h3>Start by making some friends or a post!</h3></p>
		</div>
		{else}
		{foreach $event_posts as $eventPosts}
		<div class="post_space">
        <div class="post">
			<div id="edit-{$event_posts.postid}" class="edit_box">
				<a href="javascript:void(0)" id="close-edit-{$event_posts.postid}" class="close-edit pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a>

				<div class="poster">
					<p><a href="users/profile_feed.php?user-id={$id_logged}"><img src="{$event_posts.charurl}" alt="Profile picture of {$event_posts.name}" class="centered-and-cropped thumb-32px">
						<span>{$event_posts.name}</span></a>
						<br><span class="post-date">{$event_posts.date|date_format}</span>
					</p>
				</div>

				<form class="form" action="../../actions/posts/edit_post.php" method="post">
					<div class="wrapper">
						<input type="hidden" name="user-id" value="{$id_logged}">
						<input type="hidden" name="post-id" value="{$event_posts.postid}">
						{if !empty($event_posts.url)}
						<textarea name="body" class="form-control" rows="5">{$event_posts.body}</textarea>
						{else}
						<textarea name="body" class="form-control" rows="5" required>{$event_posts.body}</textarea>
						{/if}
						<div class="controls">
							<select name="public" class="selectpicker" data-width="fit">
								{if $event_posts.public}
									<option data-icon="glyphicon-globe" value="t" selected="selected">Public</option>
									<option data-icon="glyphicon-lock" value="f" >Private</option>
								{else}
									<option data-icon="glyphicon-globe" value="t">Public</option>
									<option data-icon="glyphicon-lock" value="f" selected="selected">Private</option>
								{/if}
							</select>
							<button class="update" type="submit">Update post</button>
						</div>
					</div>
				</form>
			</div>

			<div id="confirm-{$event_posts.postid}" class="edit_box">
				<div class="modal-body">Are you sure you want to delete this post?</div>
					<div class="modal-footer button-container">
						<form class="form" action="../../actions/posts/delete_post.php" method="post">
							<input type="hidden" name="post-id" value="{$event_posts.postid}">
							<input type="hidden" name="feed" value="true">
							<button type="button" id="close-delete-{$event_posts.postid}" class="close-delete btn">Cancel</button>
							<input type="submit" class="btn btn-primary" value="Delete">
						</form>
					</div>
			</div>

			<div class="post-body">
				{if $event_posts.user == $id_logged}
				<div class="dropdown pull-right">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
					<ul class="dropdown-menu">
						<li id="edit-post-{$event_posts.postid}" class="edit"><a href="javascript:void(0)">Edit</a></li>
						<li id="delete-post-{$event_posts.postid}" class="delete"><a href="javascript:void(0)">Delete</a></li>
					</ul>
				</div>
				{/if}

				<div class="poster">
					<p><a href="profile_feed.php?user-id={$event_posts.user-id}"><img src="{$event_posts.charurl}" alt="Profile picture of {$event_posts.name}" class="centered-and-cropped thumb-32px">
						<span>{$event_posts.name}</span></a>
						<br><span class="post-date">{$event_posts.date|date_format}</span>
					</p>
				</div>
				<div class="post-content">
					{$event_posts.body}
					{if !empty($event_posts.url)}
					<a href="post_display.php?user-id={$event_posts.user}&post-id={$event_posts.postid}"><img src="{$event_posts.url}" alt="{$event_posts.description}" class="ph_display"></a>
					{/if}
				</div>
			</div>

			<div class="opt-group btn-group-justified hidden-sm hidden-xs">
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like {$event_posts.likes}</a>
				<a href="post_display.php?user-id={$event_posts.user}&post-id={$event_posts.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
			</div>

			<div class="opt-group btn-group-justified hidden-lg hidden-md visible-xs visible-sm">
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> {$event_posts.likes}</a>
				<a href="post_display.php?user-id={$event_posts.user}&post-id={$event_posts.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> 99</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> 99</a>
			</div>

			<div class="make-comment-wrap">
				<form class="form" action="../../actions/posts/comment.php" method="post">
					<div class="form-group">
						<input type="hidden" name="post-id" value="{$event_posts.postid}">
						<input type="hidden" name="user-id" value="{$id_logged}">
						<label for="make-comment-{$event_posts.postid}" class="sr-only">Write a comment</label>
						<textarea id="make-comment-{$event_posts.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something..."></textarea>
					</div>
					<button type="submit" class="btn btn-default btn-comment">Comment</button>
				</form>
			</div>
        </div>
		</div>
		{/foreach}
		{/if}

      </div>

      <!--  Right -->
      <div class="content-right hidden-xs">

        <div class="notifications">
          <h2><a href="#">Notifications</a></h2>
          <ul class="notification-list list-unstyled">
            <li><a href="#">Maecenas aliquet eleifend nisl nec tincidunt.</a></li>
            <li><a href="#">Praesent tempor ac eros id iaculis. Suspendisse potenti.</a></li>
            <li><a href="#">Donec laoreet dui nec massa mollis, vel posuere metus sodales. Suspendisse dictum, ligula id scelerisque laoreet.</a></li>
            <li><a href="#">Sed non commodo urna. Ut vehicula ornare ipsum a malesuada.</a></li>
          </ul>
        </div>

        <div class="recent-news">
          <h2><a href="#">Recent News </a></h2>
          <p>Urabitur et tincidunt dolor. Mauris in vulputate ante. Praesent vel arcu ac felis iaculis efficitur a ornare sapien. Nam tellus massa.</p>
          <div class="read-more"><a href="#">Read more...</a></div>
        </div>

      </div>

    </div>

   {include file='footer.tpl'}

</body>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>

</html>