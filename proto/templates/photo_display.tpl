<html>

<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  	<title>LBAW</title>

  	<!-- Bootstrap -->
  	<link href="res/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  	<!-- Default stylesheet -->
  	<link href="res/common/css/profile.css" rel="stylesheet">
  	<link href="res/common/css/default.css" rel="stylesheet">
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
				{if !($username == $username_logged)}
					<b><a href="../../actions/users/friendship.php" class="btn btn-default">Add friend <span class="glyphicon glyphicon-plus"></span></a></b>
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

<div class="photo-display">
		<p><center><img src="https://s17.postimg.org/4jxs2uahr/TEAR.jpg" class="ph_display"></center></p>
		<a href="#" class="btn-group" role="group">
    		<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comment <span class="badge">1</span></a></button>
  		</a>
		<a href="#" class="btn-group" role="group">
			<button type="button" class="btn btn-default"><a href="#"><span class="glyphicon glyphicon-heart"></span> Like <span class="badge">10</span></a></button>
  		</a>

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
                <a href="#"><img src="https://s3.postimg.org/nde4doxa7/Tear_Avatar_1.jpg" class="thumb-32px"><b>7thfonist</b></a>
				</p>
				
                <p>H-Hello...</p>
                <a href="#"><span class="glyphicon glyphicon-heart"></span> Like</a> | 2 <span class="glyphicon glyphicon-heart"></span>
			</div>
</div>

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
  <script src="res/lib/jquery-3.1.1.min.js"></script>
  <script src="res/common/js/script.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="res/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	
</body>
</html>