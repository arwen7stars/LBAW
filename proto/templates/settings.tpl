<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Profile Settings</title>

	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<!-- Default stylesheet -->
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/settings.css" rel="stylesheet">
</head>

<body>

{include file='header_logged.tpl'}

<div class="outter-box">
	<div class="middle-box">
		<div class="inner-box">
			<form>
				<fieldset>
					<div class="form-group">
						<label for="newUsername">Change username</label>
						<input type="text" class="form-control" id="newUsername" placeholder="New username">
					</div>
					<div class="form-group">
						<label for="oldPassword">Password</label>
						<input type="password" class="form-control" id="oldPassword" placeholder="Old Password">
						<br>
						<label for="newPassword" class="sr-only">New Password</label>
						<input type="password" class="form-control" id="newPassword" placeholder="New Password">
					</div>
					<div class="form-group">
						<label for="oldemail">Change e-mail address</label>
						<input type="email" class="form-control" id="oldemail" placeholder="Old e-mail address">
						<br>
						<label for="newemail" class="sr-only">New e-mail address</label>
						<input type="email" class="form-control" id="newemail" placeholder="New e-mail address">
					</div>
						<label for="exampleSelect1">Notifications</label>
						<div class="form-group">
							<select class="form-control" id="exampleSelect1">
								<option>I want to receive notifications</option>
								<option>I don't want to receive notifications</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<br>
						<br>
						<button type="submit" class="btn btn-danger">Delete account</button>
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
</body>
</html>
