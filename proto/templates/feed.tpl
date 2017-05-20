<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Feed</title>
	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
	<link href="../../css/feed.css" rel="stylesheet">

</head>

<body>

<div class="body-flex">

{include file='header_logged.tpl'}



<div class="content">

      <!--  Left -->
      <div class="content-left hidden-xs">

        <div class="events">
          <h2><a href="event.html">Events</a></h2>
          <ul class="event-list list-unstyled">
            <!-- Max 3 list-items at once -->
            <li><a href="#">Etiam vel</a></li>
            <li><a href="#">Phasellus aliquet sapien</a></li>
            <li><a href="#">Donec laoreet dui</a></li>
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
							<span class='label label-info' id="upload-file-info"></span>
							<input type="submit" value="Post"/>
						</span>
					</div>
				</div>
			</form>
		</div>
		
		<div id="black" class="black_overlay"></div>
		{foreach $posts as $post}
        <div class="post">
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
						<input type="hidden" name="feed" value="true">
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
		
			<div class="opt-group btn-group-justified hidden-sm hidden-xs">
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like {$post.likes}</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
			</div>
			
			<div class="opt-group btn-group-justified hidden-lg hidden-md visible-xs visible-sm">
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> {$post.likes}</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span></span> 99</a>
				<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span></span> 99</a>
			</div>
		
			<div class="make-comment-wrap">
				<form class="form" action="../../actions/posts/comment.php" method="post">
					<div class="form-group">
						<input type="hidden" name="post-id" value="{$post.postid}">
						<input type="hidden" name="user-id" value="{$id_logged}">
						<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
						<textarea id="make-comment-{$post.postid}" name="body" class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
					</div>
					<button type="submit" class="btn btn-default btn-comment">Comment</button>
				</form>
			</div>
        </div>
		
		<div class="post_space">
			<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}">Show more comments...</a>
		</div>
		{/foreach}

		
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
          <div class="read-more">
			<a href="#">Read more...</a>
		  </div>
        </div>

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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
</html>
