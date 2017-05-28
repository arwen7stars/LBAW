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
  <link href="../../css/forms.css" rel="stylesheet">
  <link href="../../css/default.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>

{include file='header.tpl'}

<div class="container">
	<div class="row">
		<div class="forms col-lg-1 col-centered">
			<h2>Recover Password</h2>
			<form id="login" method="post" action="../../actions/users/recover_password.php">
				<fieldset>
					<div class="form-group">
						<label for="email">E-mail</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="E-mail" required>
					</div>
					
					<div class="form-group">
						<button type="submit" class="submit btn btn-primary">Recover</button>
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