<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  	<title>LBAW</title>

    <!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Default stylesheet -->
    <link href="../../css/profile.css" rel="stylesheet">
    <link href="../../css/default.css" rel="stylesheet">
</head>

<body>

{include file='header_logged.tpl'}

<div class="container">
    <div class="row justify-content-start">
		<div class="user_bar col-md-3 hidden-xs hidden-sm">
			<div class="user_info">
				<img class="centered-and-cropped" src="{$image.url}" alt="{$image.description}">
				<h2>{$character.name}</h2>
				<ul class="list-unstyled">
					<li>
						<span class="glyphicon glyphicon-user"></span>
						<b>Character is</b> <a href="{$character.url}">{$character.name}</a>
					</li>
					<li>
						<span class="glyphicon glyphicon-book"></span>
						<b> Series is</b> <a href="{$series.url}">{$series.name}</a>
					</li>
				</ul>
				{if !($username_page == $username_logged)}
					<b><a href="../../actions/users/friendship.php" class="btn btn-default">Add friend <span class="glyphicon glyphicon-plus"></span></a></b>
				{/if}
			</div>
			{if !empty($previousimg) || !empty($nextimg)}
			<div class="user_photos">
				<h3><b>Photos</b></h3>
				{if !empty($previousimg)}
				<figure class="imgContainer">
					<a href="photo_display.php?user-id={$id}&post-id={$previousimg.id}"><img class="centered-and-cropped thumb-100px" src="{$previousimg.url}" alt="{$previousimg.description}"></a>
					<figcaption><a href="photo_display.php?user-id={$id}&post-id={$previousimg.id}">Previous</a></figcaption>
				</figure>
				{/if}
				
				{if !empty($nextimg)}
				<figure class="imgContainer">
					<a href="photo_display.php?user-id={$id}&post-id={$nextimg.id}"><img class="centered-and-cropped thumb-100px" src="{$nextimg.url}" alt="{$nextimg.description}"></a>
					<figcaption><a href="photo_display.php?user-id={$id}&post-id={$nextimg.id}">Next</a>
				</figure>
				{/if}
            </div>
			{/if}
		</div>
        
        <div class="timeline col-md-7">

			<div class="photo-display">
				<div id="edit-{$post.postid}" class="edit_post">
					<a href="javascript:void(0)" class="pull-right" onclick="document.getElementById('edit-{$post.postid}').style.display='none';document.getElementById('black-{$post.postid}').style.display='none'">
					<span class="close glyphicon glyphicon-remove"></span></a>
					
					<div class="poster">
						<p><a href="profile_feed.php?user-id={$id}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
							<span>{$post.charname}</span></a>
							<br><span class="post-date">{$post.date|date_format}</span>
						</p>
					</div>
					
					<form class="form" action="../../actions/posts/edit_post.php" method="post">
						<div class="wrapper">
							<input type="hidden" name="user-id" value="{$id_logged}">
							<input type="hidden" name="post-id" value="{$post.postid}">
							<input type="hidden" name="profile" value="false">
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
								<button class="update" type="submit">Update</button>
							</div>
						</div>
					</form>
				</div>
				<div id="black-{$post.postid}" class="black_overlay"></div>
			
				{if $post.user == $id_logged}
				<div class="dropdown pull-right">
					<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
					<ul class="dropdown-menu">
						<li class="edit"><a href="javascript:void(0)" onclick="document.getElementById('edit-{$post.postid}').style.display='block';document.getElementById('black-{$post.postid}').style.display='block'">Edit</a></li>
						<li class="delete"><a href="#">Delete</a></li>
					</ul>
				</div>
				{/if}
				<div class="poster">
					<p><a href="profile_feed.php?user-id={$id}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px"></a>
					<a href="profile_feed.php?user-id={$id}">{$post.charname}</a>
						<br><span class="post-date">{$post.date|date_format}</span>
					</p>
				</div>
				<div class="post-content">{$post.body}
				<img src="{$post.url}" alt="{$post.description}" class="ph_display"></div>
			
				<div class="opt-group">
					<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like {$post.likes}</a>
					<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
					<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
				</div>
			
				<hr class="separator">
				<div class="make-comment-wrap">
					<form class="form" action="../../actions/posts/comment.php" method="post">
						<div class="form-group">
							<input type="hidden" name="post-id" value="{$post.postid}">
							<input type="hidden" name="user-id" value="{$id_logged}">
							<input type="hidden" name="profile" value="false">
							<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
							<textarea id="make-comment-{$post.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
						</div>
						<button type="submit" class="btn btn-default btn-comment">Comment</button>
					</form>
				</div>
			</div>
			{foreach $comments as $comment}
				<div class="comment">
					{if $comment.userid == $id_logged}
					<div class="dropdown pull-right">
						<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
						<span class="glyphicon glyphicon-chevron-down"></span></button>
						<ul class="dropdown-menu">
							<li><a href="#">Edit</a></li>
							<li><a href="#">Delete</a></li>
						</ul>
					</div>
					{/if}
					<div class="comment-poster">
						<a href="profile_feed.php?user-id={$comment.userid}"><img src="{$comment.url}" class="centered-and-cropped thumb-32px" alt="Profile picture of {$comment.name}"><b>{$comment.name}</b></a>
					</div>
					
					<p>{$comment.body}</p>
					
					<a href="#"><span class="glyphicon glyphicon-heart"></span> {$comment.likes}</a>
				</div>
			{/foreach}
        </div>

        <div class="col-xs  hidden-xs hidden-sm">
        </div>
    </div>
</div>

  <!-- FOOTER -->
  <footer class="footer">
    <p class="text-muted" align="center">Anibook.com is a property of Anibook, LLC. ©2017 All Rights Reserved.</p>
  </footer>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
	
</body>
</html>