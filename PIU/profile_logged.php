<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>LBAW
    </title>
    <!-- Bootstrap -->
    <link href="res/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
    <link href="res/common/css/profile.css" rel="stylesheet">
    <link href="res/common/css/default.css" rel="stylesheet">

</head>

<body>
    <?php
		include_once("database/init.php");
		include_once("database/users.php");

		$username = "tirafesi";

		$user_id = getLoginID($username);
	?>

        <!--  Navbar -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- Menu for mobile display -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Website logo -->
                    <a class="navbar-brand" href="#">
                        <img alt="Brand" src="res/common/img/logo.png">
                    </a>
                </div>
                <!-- Navbar content (collapsed in mobile view) -->
                <div id="navbar" class="navbar-collapse collapse">
                    <!-- Float right -->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Home</a></li>
                        <!-- Dropdown under profile name -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <?=$username?> <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="profile.html">Profile</a>
                                </li>
                                <li class="visible-xs">
                                    <a href="#">Notifications</a>
                                </li>
                                <li class="visible-xs">
                                    <a href="group.html">Groups</a>
                                </li>
                                <li class="visible-xs">
                                    <a href="event.html">Events</a>
                                </li>
                                <li>
                                    <a href="settings.html">Settings</a>
                                </li>
                                <li role="separator" class="divider">
                                </li>
                                <li>
                                    <a href="#">Logout </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!--  Search bar -->
                    <form role="search">
                        <div class="form-group">
                            <label for="search-bar" class="sr-only">Search bar
                            </label>
                            <div class="input-group navbar-search-bar">
                                <input type="search" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
									<button class="search-btn btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row justify-content-start">
                <div class="user_bar col-md-3 hidden-xs hidden-sm">
                    <div class="user_info">
                        <img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" alt="Default Profile Photo">
                        <h1><?=$username?></h1>
                        <ul class="list-unstyled">
                            <li>
                                <span class="glyphicon glyphicon-user"></span>
                                <b> Name is</b> Tear Grants
                            </li>
                            <li>
                                <span class="glyphicon glyphicon-home"></span>
                                <b> Lives in</b> Qliphoth
                            </li>
                            <li>
                                <span class="glyphicon glyphicon-glass"></span>
                                <b> Birthday on</b> May 14th
                            </li>
                            <li>
                                <span class="glyphicon glyphicon-time"></span>
                                <b> Joined on</b> 2016-12-04
                            </li>
                        </ul>
                        <div class="user_opt">
                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <a href="./profile.html" class="btn-group" role="group">
                                    <button type="button" class="btn btn-default">
                                        <b>Add friend <span class="glyphicon glyphicon-plus"></span></b>
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="user_photos">
                        <h3><b>Photos</b></h3>
                        <img src="https://s3.postimg.org/x859jx18f/Mieu_Avatar_2.jpg" class="thumb-64px">
                        <img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-64px">
                        <img src="https://s3.postimg.org/7tbc0wcjj/Tear_Avatar_2.jpg" class="thumb-64px">
                        <br>
                        <img src="https://s3.postimg.org/jm95548zj/Tear_Avatar_7.jpg" class="thumb-64px">
                        <img src="https://s3.postimg.org/qiyq3wfwf/Mieu_Avatar.png[" class="thumb-64px">
                        <img src="https://s3.postimg.org/m2ayiyr27/Tear_Avatar_6.jpg" class="thumb-64px">
                        <br>
                        <a href="">
                            <b>View more...</b>
                        </a>
                    </div>
                </div>
                <div class="timeline col-md-7">
                    <div class="profile-header btn-group btn-group-justified" role="group" aria-label="...">
                        <a href="./profile.html" class="btn-group" role="group">
                            <button type="button" class="btn btn-default">Profile</button>
                        </a>
                        <a href="./about.html" class="btn-group" role="group">
                            <button type="button" class="btn btn-default">About</button>
                        </a>
                        <a href="./friends.html" class="btn-group" role="group">
                            <button type="button" class="btn btn-default">Friends</button>
                        </a>
                        <a href="./photos.html" class="btn-group" role="group">
                            <button type="button" class="btn btn-default">Photos</button>
                        </a>
                    </div>
                    <br>

                    <!-- MAKE-POST -->
                    <div class="make-post">
                        <form class="form" action="actions/posts/post.php" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <br>
                                <div class="btn-wrap">
                                    <input type="hidden" name="id" value="<?=$user_id?>">
                                    <textarea id="make-post" name="body" class="form-control txtarea-post" rows="3" placeholder="Write something to post..."></textarea>
                                    <span class="button-container">
										<input type="file" name="image">
										<input type="submit" value="Post"/>
									</span>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="post">
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
                                        <img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-32px">
                                        <?=$username?>
                                    </a>
                                </p>
                            </p>
                            <div class="post-content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu enim augue. Quisque mollis nisi eget urna rutrum laoreet. Nunc vehicula arcu diam, vel elementum nisi pretium nec. Suspendisse sollicitudin neque sed lacus condimentum maximus. Sed id lacus eget velit luctus consequat. Etiam efficitur dui eget ante ornare, quis dapibus ipsum elementum. Ut sit amet iaculis turpis. Sed convallis mi sed libero vestibulum cursus. Sed ut neque urna. Duis sodales urna pellentesque tellus scelerisque lacinia. Quisque vitae enim condimentum, feugiat lectus id, eleifend sapien.
                            </div>
                        </div>

                        <p><span class="opt-group">
							<a href="#" class="opt btn-group" role="group">
							<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-heart"></span> Like</a> <span class="badge">99+</span></button>
                            </a>
                            <a href="#" class="opt btn-group" role="group">
                                <button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comment</a> <span class="badge">99+</span></button>
                            </a>
                            <a href="#" class="opt btn-group" role="group">
                                <button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-share"></span> Share</a> <span class="badge">99+</span></button>
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
                        <a>Show comments...</a>
                    </div>
					
                    <div class="post">
                        <p>
                            <div class="dropdown pull-right">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Edit</a></li>
                                    <li><a href="#">Delete</a></li>
                                </ul>
                            </div>
                            <p class="poster">
                                <a href="#"><img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-32px">
                                    <?=$username?>
                                </a>
                            </p>
                        </p>
                        <div>
                            <center>
                                <img src="https://s17.postimg.org/4jxs2uahr/TEAR.jpg" class="ph_display">
                            </center>
                        </div>
                        <p><span class="opt-group">
							<a href="#" class="opt btn-group" role="group">
								<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-heart"></span> Like</a> <span class="badge">99+</span></button>
                            </a>
                            <a href="#" class="opt btn-group" role="group">
                                <button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comment</a> <span class="badge">99+</span></button>
                            </a>
                            <a href="#" class="opt btn-group" role="group">
                                <button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-share"></span> Share</a> <span class="badge">99+</span></button>
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
                        <a>Show comments...</a>
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
        <script src="res/lib/jquery-3.1.1.min.js">
        </script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="res/lib/bootstrap-3.3.7/js/bootstrap.min.js">
        </script>

        <script src="res/common/js/script.js">
        </script>

</body>

</html>