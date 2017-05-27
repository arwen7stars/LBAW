<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Event</title>

	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Default stylesheet -->
	<link href="../../css/feed.css" rel="stylesheet">
	<link href="../../css/event.css" rel="stylesheet">
	<link rel="stylesheet" href="../../lib/font-awesome-4.7.0/css/font-awesome.min.css">

</head>

<body>
	<div class="body-flex">	
	{include file='header.tpl'}

		<!-- Main Content -->
		<div class="content">

			<!--  Left -->
			<div class="content-left hidden-xs">
				{include file='content_left_feed.tpl'}
			</div>

			<!--  Middle -->
			<div class="content-middle">
				<!--Event Stuff-->  	
				<div class="text-center event">
					<div class="event-header">
						<div class="event-header-img">
							<i class="fa fa-calendar" id="event-image"></i>
							<h2>{$eventinfo.name}</h2>
						</div>
					</div>
					<div class="btn-group-lg info" role="group" aria-label="...">
						<button type="button" class="btn btn-primary">Interested</button>
						<button type="button" class="btn btn-primary">Going</button>
						<button type="button" class="btn btn-primary">Ignore</button>
					</div>
				
				</div>
			<ul class="event_bar nav nav-tabs nav-justified">
				<li class="active"><a data-toggle="tab" href="#home">Discussion</a></li>
				<li><a data-toggle="tab" href="#about">About</a></li>
				<li><a data-toggle="tab" href="#guests">Guests</a></li>
				{if $public || $belongs}
				<li><a data-toggle="tab" href="#photos">Photos</a></li>
				{/if}
			</ul>

		<div class="tab-content">
			{if $public || $belongs}
			<div id="home" class="tab-pane fade in active">
				{if isset($username_logged)}
				<div class="make-post">
					<form class="form" action="../../actions/posts/post.php" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<br>
							<div class="btn-wrap">
								<input type="hidden" name="id" value="{$id_logged}">
								<input type="hidden" name="event-id" value="{$event_id}">
								<textarea id="make-post" name="body" class="form-control txtarea-post" rows="3" placeholder="Write something to post..."></textarea>
								<span class="button-container">
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
				{/if}
				
				<div id="black" class="black_overlay"></div>
				{foreach $posts as $post}
				<div class="post_space">
				<div class="post">
				
					<div id="edit-{$post.postid}" class="edit_box">
						<a href="javascript:void(0)" id="close-edit-{$post.postid}" class="close-edit pull-right">
						<span class="close glyphicon glyphicon-remove"></span></a>

						<div class="poster">
							<p><a href="../users/profile_feed.php?user-id={$id_logged}"><img src="{$post.charurl}" alt="Profile picture of {$post.name}" class="centered-and-cropped thumb-32px">
								<span>{$post.charname}</span></a>
								<br><span class="post-date">{$post.date|date_format}</span>
							</p>
						</div>

						<form class="form" action="../../actions/posts/edit_post.php" method="post">
							<div class="wrapper">
								<input type="hidden" name="user-id" value="{$id_logged}">
								<input type="hidden" name="post-id" value="{$post.postid}">
								{if !empty($post.url)}
								<textarea name="body" class="form-control" rows="5">{$post.body}</textarea>
								{else}
								<textarea name="body" class="form-control" rows="5" required>{$post.body}</textarea>
								{/if}
								<div class="controls">
									<button class="update" type="submit">Update post</button>
								</div>
							</div>
						</form>
					</div>

					<div id="confirm-{$post.postid}" class="edit_box">
						<div class="modal-body">Are you sure you want to delete this post?</div>
							<div class="modal-footer button-container">
								<form class="form" action="../../actions/posts/delete_post.php" method="post">
									<input type="hidden" name="post-id" value="{$post.postid}">
									<input type="hidden" name="feed" value="false">
									<input type="hidden" name="event-id" value="{$event_id}">
									<button type="button" id="close-delete-{$post.postid}" class="close-delete btn">Cancel</button>
									<input type="submit" class="btn btn-primary" value="Delete">
								</form>
							</div>
					</div>

					<div class="post-body">
						{if $post.user == $id_logged}
						<div class="dropdown pull-right">
							<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
							<ul class="dropdown-menu">
								<li id="edit-post-{$post.postid}" class="edit"><a href="javascript:void(0)">Edit</a></li>
								<li id="delete-post-{$post.postid}" class="delete"><a href="javascript:void(0)">Delete</a></li>
							</ul>
						</div>
						{/if}

						<div class="poster">
							<p><a href="../users/profile_feed.php?user-id={$post.user}"><img src="{$post.charurl}" alt="Profile picture of {$event_posts.name}" class="centered-and-cropped thumb-32px">
								<span>{$post.charname}</span></a>
								<br><span class="post-date">{$post.date|date_format}</span>
							</p>
						</div>
						<div class="post-content">
							{$post.body}
							{if !empty($post.url)}
							<a href="../events/post_event_display.php?user-id={$post.user}&post-id={$post.postid}&event-id={$event_id}"><img src="{$post.url}" alt="{$post.description}" class="ph_display"></a>
							{/if}
						</div>
					</div>

					<div class="opt-group btn-group-justified hidden-sm hidden-xs">
						<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like {$post.likes}</a>
						<a href="../events/post_event_display.php?user-id={$post.user}&post-id={$post.postid}&event-id={$event_id}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
						<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
					</div>

					<div class="opt-group btn-group-justified hidden-lg hidden-md visible-xs visible-sm">
						<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> {$post.likes}</a>
						<a href="../events/post_event_display.php?user-id={$post.user}&post-id={$post.postid}&event-id={$event_id}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> 99</a>
						<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> 99</a>
					</div>
					
					{if isset($username_logged)}
					<div class="make-comment-wrap">
						<form class="form" action="../../actions/posts/comment.php" method="post">
							<div class="form-group">
								<input type="hidden" name="post-id" value="{$post.postid}">
								<input type="hidden" name="user-id" value="{$id_logged}">
								<input type="hidden" name="event-id" value="{$event_id}">
								<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
								<textarea id="make-comment-{$post.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something..."></textarea>
							</div>
							<button type="submit" class="btn btn-default btn-comment">Comment</button>
						</form>
					</div>
					{/if}
				</div>
				</div>
				{/foreach}
			</div>
			{else}
			<div id="home" class="tab-pane fade in active">
				<div id="welcome-message"><h2>This event is private.</h2>
				<h3>You need to be invited to this event to see its posts.</h3></div>
			</div>
			
			{/if}
			<div id="about" class="tab-pane fade">
				<div class="about">
					<div class="about-header">
						<h2>Event information</h2>
					</div>
					<hr>
					<div class="about-body">
						<dl>
							<dt class="col-sm-4">Name</dt>
							<dd class="col-sm-8">{$eventinfo.name}</dd>
						</dl>
						
						<dl>
							<dt class="col-sm-4">Privacy</dt>
							<dd class="col-sm-8">{$privacy}</dd>
						</dl>
						
						<dl>
							<dt class="col-sm-4">Duration of the event:</dt>
							<dd class="col-sm-8">{$eventinfo.start|date_format} - {$eventinfo.finish|date_format}</dd>
						</dl>
						
						<dl>
							<dt class="col-sm-4">Location:</dt>
							<dd class="col-sm-8">{$location.city}, {$location.country}</dd>
						</dl>						
						
						{if !empty($eventinfo.about)}
						<dl>
							<dt class="col-sm-4">Additional information</dt>
							<dd id="about_txt" class="col-sm-8">{$eventinfo.about}</dd>
						</dl>
						{/if}
					</div>
				</div>
			</div>
			
			<div id="guests" class="tab-pane fade">
				<div class="guests">
					<h2>Guests</h2>
					<hr>
					<div class="guests-body">
							{foreach $guests as $guest}
							<figure class="imgContainer">
								<a href="../users/profile_feed.php?user-id={$guest.id}"><img src="{$guest.url}" alt="{$guest.alt}" class="thumb-150px centered-and-cropped"></a>
								{if $guest.type == 'ignore'}
								<figcaption><a href="../users/profile_feed.php?user-id={$guest.id}">IGNORE</a></figcaption>
								{else}
								{if $guest.type == 'going'}
								<figcaption><a href="../users/profile_feed.php?user-id={$guest.id}">GOING</a></figcaption>
								{else}
								<figcaption><a href="../users/profile_feed.php?user-id={$guest.id}">MAYBE</a></figcaption>					
								{/if}
								{/if}
							</figure>
							{/foreach}
					</div>
				</div>
			</div>
				
			{if $public || $belongs}
			<div id="photos" class="tab-pane fade">
				<div class="photos">
					<h2>Photos</h2>
					<hr>
					{if !empty($all_images)}
					<div class="photos-body">
					{foreach $all_images as $img}<a href="../events/post_event_display.php?user-id={$img.user}&post-id={$img.id}&event-id={$event_id}"><img class="centered-and-cropped thumb-150px" src="{$img.url}" alt="{$img.description}"></a> {/foreach}
					</div>
					{else} No photos yet...
					{/if}
				</div>
			</div>
			{/if}
		</div>
      </div>

	<!--  Right -->
	<div class="content-right hidden-xs">
		{include file='content_right_feed.tpl'}
	</div>

    </div>

	{include file='footer.tpl'}
	</div>
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