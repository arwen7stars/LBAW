<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<title>Anibook</title>

    <!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
	<link rel="stylesheet" href="../../lib/bootstrap-3.3.7/css/bootstrap-select.min.css">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="../../lib/font-awesome-4.7.0/css/font-awesome.min.css">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/feed.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

</head>

<body>

<div class="body-flex">

{include file='header.tpl'}

<div class="content">

      <!--  Left -->
      <div class="content-left hidden-xs">
		{include file='content_left_feed.tpl'}
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
		{if empty($posts)}
		<div id="welcome-message">
			<p><h1>Welcome to Anibook!</h1></p>
			<p><h3>Start by making some friends or a post!</h3></p>
		</div>
		{else}
		{foreach $posts as $post}
		<div class="post_space">
        <div class="post" id="post-{$post.postid}">
			<div id="edit-{$post.postid}" class="edit_box">
				<a href="javascript:void(0)" id="close-edit-{$post.postid}" class="close-edit pull-right">
				<span class="close glyphicon glyphicon-remove"></span></a>

				<div class="poster">
					<p><a href="profile_feed.php?user-id={$id_logged}"><img src="{$post.charurl}" alt="Profile picture of {$post.name}" class="centered-and-cropped thumb-32px">
						<span>{$post.name}</span></a>
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
							<select name="public" class="selectpicker" data-width="fit">
								{if $post.public}
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

			<div id="confirm-{$post.postid}" class="edit_box">
				<div class="modal-body">Are you sure you want to delete this post?</div>
					<div class="modal-footer button-container">
						<form class="form" action="../../actions/posts/delete_post.php" method="post">
							<input type="hidden" name="post-id" value="{$post.postid}">
							<input type="hidden" name="feed" value="true">
							<button type="button" id="close-delete-{$post.postid}" class="close-delete btn">Cancel</button>
							<input type="submit" class="btn btn-primary" value="Delete">
						</form>
					</div>
			</div>

			<div class="post-body">
				{if ($post.user == $id_logged || $isAdmin === '1')}
				<div class="dropdown pull-right">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
					<ul class="dropdown-menu">
						<li id="edit-post-{$post.postid}" class="edit"><a href="javascript:void(0)">Edit</a></li>
						<li id="delete-post-{$post.postid}" class="delete"><a href="javascript:void(0)">Delete</a></li>
					</ul>
				</div>
				{/if}

				<div class="poster">
					<p><a href="profile_feed.php?user-id={$post.user}"><img src="{$post.charurl}" alt="Profile picture of {$post.name}" class="centered-and-cropped thumb-32px">
						<span>{$post.name}</span></a>
						<br><span class="post-date">{$post.date|date_format}</span>
					</p>
				</div>
				<div class="post-content">
					{$post.body}
					{if !empty($post.url)}
					<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}"><img src="{$post.url}" alt="{$post.description}" class="ph_display"></a>
					{/if}
				</div>
			</div>

			<div class="opt-group btn-group-justified">
				{foreach from=$likes key=k item=v}
				{if $k == $post.postid}
				
				{if $v}
				<a href="#" class="btn btn-default post-opt like-btn"><span class="glyphicon glyphicon-heart"></span> Dislike <span class="badge like-number">{$post.likes}</span></a>
				{else}
				
				{if $post.likes == 0}
				<a href="#" class="btn btn-default post-opt like-btn"><span class="glyphicon glyphicon-heart"></span> Like <span class="badge like-number">0</span></a>
				{else}
				<a href="#" class="btn btn-default post-opt like-btn"><span class="glyphicon glyphicon-heart"></span> Like <span class="badge like-number">{$post.likes}</span></a>
				{/if}
				
				{/if}
				
				{/if}
				{/foreach}
				{if $post.comments == 0}
				<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment <span class="badge">0</span></a>
				{else}
				<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment <span class="badge">{$post.comments}</span></a>
				{/if}
			</div>

			<div class="make-comment-wrap">
				<form class="form" action="../../actions/posts/comment.php" method="post">
					<div class="form-group">
						<input type="hidden" name="post-id" value="{$post.postid}">
						<input type="hidden" name="user-id" value="{$id_logged}">
						<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
						<textarea id="make-comment-{$post.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something..."></textarea>
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
			{include file='content_right_feed.tpl'}
		</div>
    </div>

{include file='footer.tpl'}

</div>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
	<script src="../../javascript/search-bar.js"></script>
	<script src="../../javascript/feed.js"></script>
	<script src="../../javascript/like.js"></script>
</body>
</html>
