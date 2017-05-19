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
						{if !($username_page == $username_logged)}{if !($friendship) }
							<b><a href="../../actions/users/friendship.php" class="btn btn-default">Add friend <span class="glyphicon glyphicon-plus"></span></a></b>
						{/if}{/if}
                    </div>
					{if !empty($images)}
                    <div class="user_photos">
                        <h3><b>Photos</b></h3>{foreach $images as $img}<a href="photo_display.php?user-id={$id}&post-id={$img.id}"><img class="centered-and-cropped thumb-64px" src="{$img.url}" alt="{$img.description}"></a> {/foreach}
                        <br>
                        <a href="#photos" data-toggle="tab">
                            View more...
                        </a>
                    </div>
					{/if}
                </div>

                <div class="timeline col-md-7">
				
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
											<input type="hidden" name="id" value="{$id}">
											<textarea id="make-post" name="body" class="form-control txtarea-post" rows="3" placeholder="Write something to post..."></textarea>
											<span class="button-container">
												<label class="btn btn-primary" for="my-file-selector">
													<input id="my-file-selector" type="file" name="image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
													Upload photo
												</label>
												
												<span class='label label-info' id="upload-file-info"></span>
												<input type="submit" value="Post"/>
											</span>
										</div>
									</div>
								</form>
							</div>
							{/if}

							{foreach $posts as $post}
							<div class="post">
							  <div class="white_content"><a href="javascript:void(0)" class="pull-right"><span class="glyphicon glyphicon-remove"></span></a>
							  <textarea>{$post.body}</textarea></div>
							  <div class="black_overlay"></div>
							  
								<div class="post-body">
										{if $post.user == $id_logged}
										<div class="dropdown pull-right">
											<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
											<ul class="dropdown-menu">
												<li class="edit"><a href="javascript:void(0)">Edit</a></li>
												<li class="delete"><a href="#">Delete</a></li>
											</ul>
										</div>
										{/if}

									<div class="poster">
										<p><a href="profile_feed.php?user-id={$id}"><img src="{$post.charurl}" alt="Profile picture of {$post.charname}" class="centered-and-cropped thumb-32px">
											<span>{$post.charname}</span></a>
											<br><span class="post-date">{$post.date|date_format}</span>
										</p>
									</div>
									<div class="post-content">
										{$post.body}
										{if !empty($post.url)}
										<a href="photo_display.php?user-id={$id}&post-id={$post.postid}"><img src="{$post.url}" alt="{$post.description}" class="ph_display"></a>
										{/if}
									</div>

								</div>
								
								<div class="opt-group">
									<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-heart"></span> Like {$post.likes}</a>
									<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-comment"></span> Comment 99</a>
									<a href="#" class="btn btn-default post-opt"><span class="glyphicon glyphicon-share"></span> Share 99</a>
								</div>

								<div class="make-comment-wrap">
									<form class="form">
										<div class="form-group">
											<label for="make-comment-{$post.postid}" class="sr-only">Write a comment</label>
											<textarea id="make-comment-{$post.postid}" class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
										</div>
									</form>
									<button type="submit" class="btn btn-default btn-comment">Comment</button>
								</div>
							</div>
							<div class="post_space">
								
								<div class="comments">
								{foreach from=$comments key=k item=v}{if $k == $post.postid}{if !empty($v)}
								<a class="read-more-show hide" href="#">Show more comments...</a><span class="read-more-content">
								{foreach $v as $comment}
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
											<p>{$comment.body}</p>
										</div>
										
										<a href="#"><span class="glyphicon glyphicon-heart"></span> {$comment.likes}</a>
									</div>
								{/foreach}
								<a class="read-more-hide hide" href="#">Show less comments...</a></span>
								{/if}{/if}{/foreach}
								</div>
							</div>
								
							{/foreach}
						</div>
						<div id="about" class="tab-pane fade">
							<div class="about">
								<div class="about-header">
									<a href="#" class="btn btn-default pull-right"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
									<h2>Information about user</h2>
								</div>
								<hr>
								<div class="about-body">
								<p><b>Name:</b> {$name}</p>
								<p><b>Nickname:</b> {$username_page}</p>
								{if !empty($age)}
								<p><b>Age:</b> {$age}</p>
								{/if}
								{if !empty($location)}
								<p><b>Location:</b> {$location.city}, {$location.country}</p>
								{/if}
								{if !empty($about)}
								<p><b>Additional information:</b> {$about}</p>
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
								{foreach $all_images as $img}<a href="photo_display.php?user-id={$id}&post-id={$img.id}"><img class="centered-and-cropped thumb-150px" src="{$img.url}" alt="{$img.description}"></a> {/foreach}
								</div>
								{else} No photos yet...
								{/if}
							</div>
						</div>
					  </div>

                </div>
            </div>
        </div>
        <!-- FOOTER -->
        <footer class="footer">
            <p class="text-muted" align="center">Anibook.com is a property of Anibook, LLC. ©2017 All Rights Reserved.
            </p>
        </footer>
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="../../lib/jquery-3.1.1.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script src="../../javascript/script.js"></script>
        
</body>

</html>
