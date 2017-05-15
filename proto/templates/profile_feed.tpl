<!DOCTYPE html>
<html>

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
                        <center><h2>{$character.name}</h2></center>
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
						{if ! ($username == $username_logged) }
                        <div class="user_opt">
                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <a href="../../actions/users/friendship.php" class="btn-group" role="group">
									{if !($friends) }
                                    <button type="submit" value="Post" name="friendship-button" class="btn btn-default">
                                        <b>Add friend <span class="glyphicon glyphicon-plus"></span></b>
                                    </button>
									{/if}
                                </a>
                            </div>
                        </div>
						{/if}
                    </div>
					{if !empty($images)}
                    <div class="user_photos">
                        <h3><b>Photos</b></h3>{foreach $images as $img}<img class="centered-and-cropped thumb-64px" src="{$img.url}" alt="{$img.description}"> {/foreach}
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
						  {if $username == $username_logged }
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
							<p><div class="post">
								<div class="post-body">
									<p>
										<div class="dropdown pull-right">
											<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
											<ul class="dropdown-menu">
												<li><a href="#">Edit</a></li>
												<li><a href="#">Delete</a></li>
											</ul>
										</div>

										<p class="poster">
											<a href="#">
												<img src="{$post.charurl}" class="centered-and-cropped thumb-32px">
												{$post.charname}
											</a>
										</p>
									</p>
									<div class="post-content">
										{$post.body}
										<img src="{$post.url}" alt="{$post.description}" class="ph_display">
									</div>

								</div>
								
								<p><span class="opt-group">
									<a href="#" class="opt btn-group" role="group">
									<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-heart"></span> Likes {$post.likes}</a></button>
									</a>
									<a href="#" class="opt btn-group" role="group">
										<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comments {$post.comments}</a></button>
									</a>
									<a href="#" class="opt btn-group" role="group">
										<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-share"></span> Shares 99</a></button>
									</a>
								</span></p>

								<div class="make-comment-wrap">
									<form class="form">
										<div class="form-group">
											<label for="make-comment" class="sr-only">Write a comment</label>
											<textarea id="make-comment" class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
										</div>
									</form>
									<button type="submit" class="btn btn-default btn-comment">Comment</button>
								</div>
							</div>
							<div class="post_space">
								<div class="comments {$post.postid}">
								{foreach from=$comments key=k item=v}{if $k == $post.postid}{foreach $v as $comment}
									<div class="comment">
										<p>
											<div class="dropdown pull-right">
												<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
												<span class="glyphicon glyphicon-chevron-down"></span></button>
												<ul class="dropdown-menu">
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>
												</ul>
											</div>
										<a href="profile_feed.php?user-id={$comment.userid}"><img src="{$comment.url}" class="centered-and-cropped thumb-32px"><b>{$comment.name}</b></a>
										</p>
										<p>{$comment.body}</p>
												
										
										<a href="#"><span class="glyphicon glyphicon-heart"></span> {$comment.likes}</a>
									</div>
								{/foreach}{/if}{/foreach}
								</div>
								
							</div></p>
								
							{/foreach}
						</div>
						<div id="about" class="tab-pane fade">
							<div class="about">
								<div class="about-header">
									<a href="#" class="btn-group pull-right" role="group">
										<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
									</a>
									<h2>Information about user</h2>
								</div>
								<hr>
								<div class="about-body">
								<p><b>Name:</b> {$name}</p>
								<p><b>Nickname:</b> {$username}</p>
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
								<div class="friends-body">
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/6s38iwe0l/Luke_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Luke Fon Fabre</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/qdrpf3gfp/Van.jpg" class="thumb-150px">
										<figcaption>Van Grants</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/j99w6296d/Natalia_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Natalia Luzu</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s11.postimg.org/chyn6djj7/Anise_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Anise Tatlin</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/z2a98s6ph/Ion_Avatar.jpg" class="thumb-150px">
										<figcaption>Ion</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/mmdjf1ddh/Guy_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Guy Cecil</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/vk2uq4v79/Jade_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Jade Curtiss</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/dq2rb3mr9/Asch_Avatar_1.png" class="thumb-150px">
										<figcaption>Asch the Bloody</figcaption></a>
									</div>
								</div>
							</div>
						</div>
						<div id="photos" class="tab-pane fade">
							<div class="photos">
								<h2>Photos</h2>
								<hr>
								<div class="photos-body">
								{foreach $all_images as $img}<img class="centered-and-cropped thumb-150px" src="{$img.url}" alt="{$img.description}"> {/foreach}
								</div>
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
