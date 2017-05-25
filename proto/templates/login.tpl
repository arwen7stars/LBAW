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

{include file='header.tpl'}

<div class="container">
	<div class="row">
		<div class="forms col-lg-1 col-centered">
			<h2>Login</h2>
			<form id="login" method="post" action="../../actions/users/login.php">
				<fieldset>
					<div class="form-group">
						<label for="username">Username</label>
						
						{if isset({$username_error}) && !empty({$username_error})}
							<input type="text" class="form-control error-input" id="username" name="username" placeholder="Username" required>
							<div class="error-in">Username doesn't not exist! Try again...</div>
						{else}
							<input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
						{/if}
					</div>

					<div class="form-group">
						<label for="password">Password</label>
						
					{if isset({$wrong_password}) && !empty({$wrong_password})}
						<input type="password" class="form-control error-input" id="password" name="password" placeholder="Password" required>
						<div class="error-in">Wrong password! Try again...</div>
					{else}
						<input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
					{/if}
					</div>

					<div class="form-group">
						<button type="submit" class="submit btn btn-primary">Login</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}

  <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <script src="../../javascript/script.js"></script>

</body>

</html>
