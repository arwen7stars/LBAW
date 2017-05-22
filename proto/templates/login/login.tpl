<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Homepage</title>
  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/default.css" rel="stylesheet">
  <link href="../../css/forms.css" rel="stylesheet">

</head>

<body>

{include file='../header_logged.tpl'}

<div class="container">
	<div class="row">
		<div class="forms col-lg-1 col-centered">
			<h2>Login</h2>
			<form id="login" method="post" action="../../actions/users/login.php">
				<fieldset>
					<p><label for="username">Username</label>
					<input type="username" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Username"></p>
					
					<p><label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Password"></p>							

					<p><button type="submit" class="submit btn btn-primary">Login</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

{include file='../footer.tpl'}

</body>

<!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</html>
