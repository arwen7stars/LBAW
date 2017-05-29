<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Group</title>

	<!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
	<link rel="stylesheet" href="../../lib/bootstrap-3.3.7/css/bootstrap-select.min.css">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="../../lib/font-awesome-4.7.0/css/font-awesome.min.css">
	<link href="../../css/feed.css" rel="stylesheet">
	<link href="../../css/group.css" rel="stylesheet">
	<link href="../../css/default.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>
	
<div class="body-flex">	 
	 {include file='header.tpl'}
	
	{if empty($page_not_found)}
	<div id="black" class="black_overlay"></div>
	
	<!-- Main Content -->
	<div class="content">

		<!--  Left -->
		<div class="content-left hidden-xs">
			{include file='content_left_feed.tpl'}
		</div>

      <!--  Middle -->
		<div class="content-middle">
			<div id="edit-group-box" class="edit_group_box">
				<a href="javascript:void(0)" id="close-edit-group" class="close-edit pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a>
				<h3>Edit group</h3>
				<hr>
				<form class="form" action="../../actions/groups/edit.php" method="post">
					<input type="hidden" name="group-id" value="{$group_id}">
						
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" class="form-control" id="name" name="name" maxlength="20" value="{$groupinfo.name}" required>
					</div>
					<div class="form-group">			
						<label for="privacy">Privacy</label>
						<select class="selectpicker form-control" id="privacy" name="privacy">
							{if $groupinfo.public}
							<option value="t" selected="selected">Public</option>
							<option value="f">Private</option>
							{else}
							<option value="t">Public</option>
							<option value="f" selected="selected">Private</option>
							{/if}
						</select>
					</div>
					
					<div class="form-group">
						<label for="about-txt">About</label>
						<textarea name="about" id="about-txt" class="form-control" rows="3">{$groupinfo.about}</textarea>
					</div>
					<button class="edit-group-opt pull-right" type="submit">Update group</button>
				</form>
			</div>
			
			<div id="confirm-delete-group" class="edit_box">
				<div class="modal-body">Are you sure you want to delete this group?</div>
					<div class="modal-footer button-container">
						<form class="form" action="../../actions/groups/delete.php" method="post">
							<input type="hidden" name="group-id" value="{$group_id}">
							<button type="button" id="close-delete-group" class="close-delete btn">Cancel</button>
							<input type="submit" class="btn btn-primary" value="Delete">
						</form>
					</div>
			</div>
			
			<div id="confirm-leave-group" class="edit_box">
				<div class="modal-body">Are you sure you want to leave this group?</div>
					<div class="modal-footer button-container">
						<form class="form" action="../../actions/groups/leave.php" method="post">
							<input type="hidden" name="group-id" value="{$group_id}">
							<button type="button" id="close-leave-group" class="close-delete btn">Cancel</button>
							<input type="submit" class="btn btn-primary" value="Leave">
						</form>
					</div>
			</div>
			
			
			<div class="group-header">
				<div class="group-header-img">
					<i class="fa fa-group" id="group-image"></i>
					<h2>{$groupinfo.name}</h2>
				</div>
			</div>
			{if ($admin || $isWebPageAdmin === '1')}
			<p class="user-options">
				<button id="click-edit-group" class="group-opt btn btn-default"><i class="fa fa-pencil-square-o"></i> Edit</button>
				<button id="click-delete-group" class="group-opt btn btn-default"><i class="fa fa-times"></i> Delete</button>
			</p>
			{else}
			{if $belongs}
			<p class="user-options">
				<button id="click-leave-group" class="group-opt btn btn-default"><i class="fa fa-sign-out"></i> Leave</button>
			</p>
			{else}
			{if $public}
			<div class="user-options">
				<form class="form" action="../../actions/groups/join_group.php" method="post">
					<input type="hidden" name="group-id" value="{$group_id}">
					<button type="submit" class="group-opt btn btn-default"><i class="fa fa-sign-in"></i> Join</button>
				</form>
			</div>
			{/if}
			{/if}
			{/if}
			<!--Group Stuff-->  	
			<ul class="group_bar nav nav-tabs nav-justified">
				<li class="active"><a data-toggle="tab" href="#home">Feed</a></li>
				<li><a data-toggle="tab" href="#about">About</a></li>
				<li><a data-toggle="tab" href="#members">Members</a></li>
				{if $public || $belongs}
				<li><a data-toggle="tab" href="#photos">Photos</a></li>
				{/if}
			</ul>
		
			<div class="tab-content">
				{if $public || $belongs}
				<div id="home" class="tab-pane fade in active">
					{if $belongs && isset($username_logged)}
					<!-- MAKE-POST -->
					<div class="make-post">
						<form class="form" action="../../actions/posts/post.php" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<br>
								<div class="btn-wrap">
									<input type="hidden" name="id" value="{$id_logged}">
									<input type="hidden" name="group-id" value="{$group_id}">
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

					{foreach $posts as $post}
					<div class="post_space"><div class="post">
					
						<div id="edit-{$post.postid}" class="edit_box">
							<a href="javascript:void(0)" id="close-edit-{$post.postid}" class="close-edit pull-right">
							<span class="close glyphicon glyphicon-remove"></span></a>
							
							<div class="poster">
								<p><a href="../users/profile_feed.php?user-id={$id_logged}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
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
										<input type="hidden" name="group-id" value="{$group_id}">
										<button type="button" id="close-delete-{$post.postid}" class="close-delete btn">Cancel</button>
										<input type="submit" class="btn btn-primary" value="Delete">
									</form>
								</div>
						</div>

						<div class="post-body">
								{if ($post.user == $id_logged || $admin || $isWebPageAdmin === '1')}
								<div class="dropdown pull-right">
									<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
									<ul class="dropdown-menu">
										<li id="edit-post-{$post.postid}" class="edit"><a href="javascript:void(0)">Edit</a></li>
										<li id="delete-post-{$post.postid}" class="delete"><a href="javascript:void(0)">Delete</a></li>
									</ul>
								</div>
								{/if}

							<div class="poster">
								<p><a href="../users/profile_feed.php?user-id={$post.user}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
									<span>{$post.charname}</span></a>
									<br><span class="post-date">{$post.date|date_format}</span>
								</p>
							</div>
							<div class="post-content">
								{$post.body}
								{if !empty($post.url)}
								<a href="../groups/post_group_display.php?user-id={$post.user}&post-id={$post.postid}&group-id={$group_id}"><img src="{$post.url}" alt="{$post.description}" class="ph_display"></a>
								{/if}
							</div>

						</div>
						
						<div class="opt-group btn-group-justified">
							<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like <span class="badge">{$post.likes}</span></a>
							<a href="../groups/post_group_display.php?user-id={$post.user}&post-id={$post.postid}&group-id={$group_id}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment <span class="badge">{$post.comments}</span></a>
						</div>
						
						{if (isset($username_logged) && $belongs)}
						<div class="make-comment-wrap">
							<form class="form" action="../../actions/posts/comment.php" method="post">
								<div class="form-group">
									<input type="hidden" name="post-id" value="{$post.postid}">
									<input type="hidden" name="user-id" value="{$id_logged}">
									<input type="hidden" name="group-id" value="{$group_id}">
									<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
									<textarea id="make-comment-{$post.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something..."></textarea>
								</div>
								<button type="submit" class="btn btn-default btn-comment">Comment</button>
							</form>
						</div>
						{/if}
					</div></div>
					{/foreach}
				</div>
				{else}
				<div id="home" class="tab-pane fade in active">
				<div id="welcome-message"><h2>This group is private.</h2>
				<h3>You need to be a member of this group to see its posts.</h3></div>
				</div>
				
				{/if}
			  
				<div id="about" class="tab-pane fade">
					<div class="about">
						<div class="about-header">
							<h2>Group information</h2>
						</div>
						<hr>
						<div class="about-body">
							<dl>
								<dt class="col-sm-4">Name</dt>
								<dd class="col-sm-8">{$groupinfo.name}</dd>
							</dl>
							
							<dl>
								<dt class="col-sm-4">Privacy</dt>
								<dd class="col-sm-8">{$privacy}</dd>
							</dl>
							
							{if !empty($groupinfo.about)}
							<dl>
								<dt class="col-sm-4">Additional information</dt>
								<dd id="about_txt" class="col-sm-8">{$groupinfo.about}</dd>
							</dl>
							{/if}
						</div>
					</div>
				</div>
				
				<div id="members" class="tab-pane fade">
					<div class="members">
						<h2>Members</h2>
						<hr>
						<div class="members-body">
							{foreach $members as $member}
							<figure class="imgContainer">
								<a href="../users/profile_feed.php?user-id={$member.id}"><img src="{$member.url}" alt="{$member.alt}" class="thumb-150px centered-and-cropped"></a>
								{if $member.admin}
								<figcaption><a href="../users/profile_feed.php?user-id={$member.id}">Admin</a></figcaption>
								{else}
								<figcaption><a href="../users/profile_feed.php?user-id={$member.id}">Normal member</a></figcaption>
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
						{foreach $all_images as $img}
						<a href="../groups/post_group_display.php?user-id={$img.user}&post-id={$img.id}&group-id={$group_id}">
						<img class="centered-and-cropped thumb-150px" src="{$img.url}" alt="{$img.description}"></a> {/foreach}
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
	{else}
	<div id="not-found"><h1>{$page_not_found}</h1></div>
	{/if}
	{include file='footer.tpl'}
	</div>
	
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<script src="../../javascript/script.js"></script>
	<script src="../../javascript/group.js"></script>
	<script src="../../javascript/feed.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>

</body>

</html>