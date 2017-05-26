<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Profile</title>
    <!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <!-- Default stylesheet -->
    <link href="../../css/profile.css" rel="stylesheet">
    <link href="../../css/default.css" rel="stylesheet">
</head>

<body>

  {include file='header.tpl'}
  
		<div class="container">
            <div class="row">
				<div class="col-md-3 pull-md-9 hidden-xs hidden-sm">
						<div class="user_bar affix">
							<div class="user_info">
								<a href="profile_feed.php?user-id={$id}"><img class="centered-and-cropped" src="{$image.url}" alt="{$image.description}"></a>
								<h2 class="name">{$character.name}</h2>
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
								{if !($id == $id_logged) && isset($username_logged)}
									{if !($friendship)}
									<form action="../../actions/users/friendship.php" method="post">
										<button name="user2-id" value="{$id}" type="submit" class="btn btn-default">Add friend <span class="glyphicon glyphicon-plus"></span></button>
									</form>
									{else}
										{if ($friend.accepted)}
											{if ($friend.user1 == $id)}
												<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-ok"></span> Friends</button>
													<ul class="dropdown-menu">
														<li>
															<form id="unfriend-form" action="../../actions/users/delete_friendship.php" method="post">
																<input type="hidden" name="cancel" value="false">
																<input type="hidden" name="user1-id" value="{$id}">
																<a href="javascript:void(0)" onclick="document.getElementById('unfriend-form').submit(); return false;">Unfriend</a>
															</form>
														</li>
													</ul>
												</div>
											{else}
												<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-ok"></span> Friends</button>
													<ul class="dropdown-menu">
														<li>
															<form id="unfriend-form" action="../../actions/users/delete_friendship.php" method="post">
																<input type="hidden" name="cancel" value="true">
																<input type="hidden" name="user2-id" value="{$id}">
																<a href="javascript:void(0)" onclick="document.getElementById('unfriend-form').submit(); return false;">Unfriend</a>
															</form>
														</li>
													</ul>
												</div>
											{/if}
										{else}
											{if ($friend.user1 == $id)}
												<div class="dropdown">
													<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon glyphicon-user"></span> Accept request</button>
													<ul class="dropdown-menu">
														<li>
															<form id="confirm-form" action="../../actions/users/accept_friendship.php" method="post">
																<input type="hidden" name="user1-id" value="{$id}">
																<a href="javascript:void(0)" onclick="document.getElementById('confirm-form').submit(); return false;">Confirm</a>
															</form>
														</li>
														<li>
															<form id="delete-form" action="../../actions/users/delete_friendship.php" method="post">
																<input type="hidden" name="cancel" value="false">
																<input type="hidden" name="user1-id" value="{$id}">
																<a href="javascript:void(0)" onclick="document.getElementById('delete-form').submit(); return false;">Delete</a>
															</form>
														</li>
													</ul>
												</div>
											{else}
												<form action="../../actions/users/delete_friendship.php" method="post">
													<input type="hidden" name="cancel" value="true">
													<input type="hidden" name="user2-id" value="{$id}">
													<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span> Cancel request</button>
												</form>
											{/if}
										{/if}
									{/if}
								{/if}
							</div>
							{if !empty($images)}
							<div class="user_photos">
								<h3><b>Photos</b></h3>							
								{foreach $images key=k item=img}
									<a href="post_display.php?user-id={$id}&post-id={$img.id}"><img class="centered-and-cropped thumb-64px" src="{$img.url}" alt="{$img.description}"></a>
									{if $k == 2}
										<br>
									{/if}
								{/foreach}
								<br>
								<a href="#photos" data-toggle="tab">
									View more...
								</a>
							</div>
							{/if}
						</div>
                </div>
				
                <div class="col-md-9 push-md-3">
					<div class="timeline">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
							<li><a data-toggle="tab" href="#about">About</a></li>
							<li><a data-toggle="tab" href="#friends">Friends</a></li>
							<li><a data-toggle="tab" href="#photos">Photos</a></li>
						</ul>
				
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
							  {if $username_page == $username_logged }
								<!-- MAKE-POST -->
								<div class="make-post">
									<form class="form" action="../../actions/posts/post.php" method="post" enctype="multipart/form-data">
										<div class="form-group">
											<br>
											<div class="btn-wrap">
												<input type="hidden" name="id" value="{$id_logged}">
												<input type="hidden" name="profile" value="true">
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
								{/if}
								
								<div id="black" class="black_overlay"></div>
								{foreach $posts as $post}{if ($id_logged == $post.user) || $post.public}
								<div class="post_space"><div class="post">
								
									<div id="edit-{$post.postid}" class="edit_box">
										<a href="javascript:void(0)" id="close-edit-{$post.postid}" class="close-edit pull-right">
										<span class="close glyphicon glyphicon-remove"></span></a>
										
										<div class="poster">
											<p><a href="profile_feed.php?user-id={$id_logged}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
												<span>{$post.charname}</span></a>
												<br><span class="post-date">{$post.date|date_format}</span>
											</p>
										</div>
										
										<form class="form" action="../../actions/posts/edit_post.php" method="post">
											<div class="wrapper">
												<input type="hidden" name="user-id" value="{$id_logged}">
												<input type="hidden" name="post-id" value="{$post.postid}">
												<input type="hidden" name="feed" value="false">
												<input type="hidden" name="profile" value="true">
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
													<input type="hidden" name="feed" value="false">
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
											<p><a href="profile_feed.php?user-id={$post.user}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
												<span>{$post.charname}</span></a>
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
										<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
										<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
									</div>
									
									<div class="opt-group btn-group-justified hidden-lg hidden-md visible-xs visible-sm">
										<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> {$post.likes}</a>
										<a href="post_display.php?user-id={$post.user}&post-id={$post.postid}" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> 99</a>
										<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> 99</a>
									</div>
									
									{if ((isset($username_logged) && $friendship && $friend.accepted) || ($id == $id_logged))}
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
									{/if}
								</div></div>
								{/if}
								{/foreach}
							</div>
							<div id="about" class="tab-pane fade">
								<div class="about">
									<div class="about-header">
										{if $id == $id_logged}
										<a href="edit_profile.php" class="btn btn-default pull-right"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
										{/if}
										<h2>User information</h2>
									</div>
									<hr>
									<div class="about-body">
										<dl>
											<dt class="col-sm-4">Name</dt>
											<dd class="col-sm-8">{$name}</dd>
										</dl>

										{if !empty($age)}
										<dl>
											<dt class="col-sm-4">Age</dt>
											<dd class="col-sm-8">{$age}</dd>
										</dl>
										{/if}
										
										{if !empty($location)}
										<dl>
											<dt class="col-sm-4">Location</dt>
											<dd class="col-sm-8">{$location.city}, {$location.country}</dd>
										</dl>
										{/if}
										
										{if !empty($about)}
										<dl>
											<dt class="col-sm-4">Additional information</dt>
											<dd class="col-sm-8">{$about}</dd>
										</dl>
										{/if}
									</div>
								</div>
							</div>
							<div id="friends" class="tab-pane fade">
								<div class="friends">
									<h2>Friends</h2>
									<hr>
									{if !empty($friends)}
									<div class="friends-body">
										{foreach $friends as $friend}
										<figure class="imgContainer">
											<a href="profile_feed.php?user-id={$friend.id}"><img src="{$friend.url}" alt="{$friend.alt}" class="thumb-150px centered-and-cropped"></a>
											<figcaption><a href="profile_feed.php?user-id={$friend.id}">{$friend.name}</a></figcaption>
										</figure>
										{/foreach}
									</div>
									{else}No friends yet...
									{/if}
								</div>
							</div>
							<div id="photos" class="tab-pane fade">
								<div class="photos">
									<h2>Photos</h2>
									<hr>
									{if !empty($all_images)}
									<div class="photos-body">
									{foreach $all_images as $img}<a href="post_display.php?user-id={$id}&post-id={$img.id}"><img class="centered-and-cropped thumb-150px" src="{$img.url}" alt="{$img.description}"></a> {/foreach}
									</div>
									{else} No photos yet...
									{/if}
								</div>
							</div>
						</div>
					</div>
                </div>
			
            </div>
		</div>
		
        {include file='footer.tpl'}
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
