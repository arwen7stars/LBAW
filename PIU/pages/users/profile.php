<?php
session_start();
if(!isset($_SESSION['username'])){
	header('Location: login.php');
	die();
}
?>

<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  	<title>LBAW</title>

  	<!-- Bootstrap -->
  	<link href="../../res/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Default stylesheet -->
  	<link href="../../res/common/css/profile.css" rel="stylesheet">
  	<link href="../../res/common/css/default.css" rel="stylesheet">
</head>

<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="#"><img class="navbar-brand" src="../../res\common\img\logo.png"></a>
			</div>
			
			<!-- SEARCH-BAR TODO change search-bar width to match moqup -->
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<label class="sr-only" for="search-bar">Search bar</label>
					<div class="input-group">
						<input type="search" id="search-bar" class="form-control" placeholder="Search..." autocomplete="on">
							<span class="input-group-btn">
								<button class="search btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
							</span>
					</div>
				</div>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>

<div class="container">
    <div class="row justify-content-start">
        <div class="user_bar col-md-3 hidden-xs hidden-sm">
			<div class= "user_info">
				<img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" alt="Default Profile Photo">
				<h1>7thfonist</h1>

				<ul class="list-unstyled">
					<li><span class="glyphicon glyphicon-user"></span><b> Name is</b> Tear Grants</li> <!--nome-->
					<li><span class="glyphicon glyphicon-home"></span><b> Lives in</b> Qliphoth</li> <!--cidade-->
					<li><span class="glyphicon glyphicon-glass"></span><b> Birthday on</b> May 14th</li>	  <!--data-->
					<li><span class="glyphicon glyphicon-time"></span><b> Joined on</b> 2016-12-04</li> <!--join-->
				</ul>
			</div>

			<div class= "user_photos">
		<h3><b>Photos</b></h3> <!-- FOTOS!!!!-->
		<img src="https://s3.postimg.org/x859jx18f/Mieu_Avatar_2.jpg" class="thumb-64px"> 
		<img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-64px"> 
		<img src="https://s3.postimg.org/7tbc0wcjj/Tear_Avatar_2.jpg" class="thumb-64px"><br>
		<img src="https://s3.postimg.org/jm95548zj/Tear_Avatar_7.jpg" class="thumb-64px"> 
		<img src="https://s3.postimg.org/qiyq3wfwf/Mieu_Avatar.png[" class="thumb-64px"> 
		<img src="https://s3.postimg.org/m2ayiyr27/Tear_Avatar_6.jpg" class="thumb-64px"><br>
		<a href=""><b>View more...</b></a>
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
		
		<!-- SUBSTITUIR POSTS POR PHP-->

		<div class= "post">
			<div class="post-body">
                <p>
                <h3 class="poster"><a href="#"><img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-64px">7thfonist</a></h3></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu enim augue. Quisque mollis nisi eget urna rutrum laoreet. Nunc vehicula arcu diam, vel elementum nisi pretium nec. Suspendisse sollicitudin neque sed lacus condimentum maximus. Sed id lacus eget velit luctus consequat. Etiam efficitur dui eget ante ornare, quis dapibus ipsum elementum. Ut sit amet iaculis turpis. Sed convallis mi sed libero vestibulum cursus. Sed ut neque urna. Duis sodales urna pellentesque tellus scelerisque lacinia. Quisque vitae enim condimentum, feugiat lectus id, eleifend sapien.</p>
			</div>
		<p>					
		<p><a href="#" class="btn-group" role="group">
			<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-heart"></span> Like</a> <span class="badge">99+</span></button>
  		</a>
  		<a href="#" class="btn-group" role="group">
    		<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comment</a> <span class="badge">99+</span></button>
  		</a></p>


              <hr>
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




		<div class= "post">
		<p>					
					<h3 class="poster"><a href="#"><img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-64px">7thfonist</a></h3></p>
		<p><center><img src="https://s17.postimg.org/4jxs2uahr/TEAR.jpg" class="ph_display"></center></p>
		<p><a href="./profile.html" class="btn-group" role="group">
			<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-heart"></span> Like</a> <span class="badge">10</span></button>
  		</a>
  		<a href="./about.html" class="btn-group" role="group">
    		<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comment</a> <span class="badge">1</span></button>
  		</a></p>
		<hr>

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
    <p class="text-muted" align="center">Anibook.com is a property of Anibook, LLC. ©2017 All Rights Reserved.</p>
  </footer>

  <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../res/lib/jquery-3.1.1.min.js"></script>
  <script src="../../res/common/js/script.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../res/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	
</body>