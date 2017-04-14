<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Homepage</title>

  <!-- Bootstrap -->
  <link href="../../res/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../res/common/css/default.css" rel="stylesheet">
  <link href="../../res/common/css/forms.css" rel="stylesheet">
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
	<div class="row">
	<div class="forms col-lg-1 col-centered">
		<h2>Login</h2>
		<form id="login" method="post" action="../../actions/users/login.php">
			<fieldset>
				<p><label for="username">Username</label>
				<input type="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Type username"></p>
				
				<p><label for="password">Password</label>
				<input type="password" class="form-control" id="password" placeholder="Type password"></p>							

				<p><button type="submit" class="submit btn btn-primary">Login</button></p>
			</fieldset>
		</form>
	</div></div></div>


  <!-- FOOTER -->
  <footer class="footer">
    <p class="text-muted" align="center">Anibook.com is a property of Anibook, LLC. ©2017 All Rights Reserved.</p>
  </footer>

  <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="res/lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="res/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>
