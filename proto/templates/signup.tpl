<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Sign Up</title>

  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../css/default.css" rel="stylesheet">
  <link href="../../css/forms.css" rel="stylesheet">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
  
</head>

<body>

{include file='header.tpl'}

<div class="container">
	<div class="row">
	
	<div class="errors">
		{if isset({$password_error}) && !empty({$password_error})}
		<div class="alert alert-danger alert-dismissable">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Error!</strong> {$password_error}
		</div>
		{/if}
		
		{if isset({$username_error}) && !empty({$username_error})}
		<div class="alert alert-danger alert-dismissable">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Error!</strong> {$username_error}
		</div>
		{/if}
		
		{if isset({$email_error}) && !empty({$email_error})}
		<div class="alert alert-danger alert-dismissable">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Error!</strong> {$email_error}
		</div>
		{/if}
	</div>
	
	<div class="forms col-lg-1 col-centered">
		<h2>Register</h2>

		<form action="../../actions/users/register.php" method="post">
			<fieldset>
				<p><label for="username">Username (only letters and numbers)</label>
				<input type="username" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Type username" required></p>


				<p><label for="name">Name (only letters and spaces)</label>
				<input type="username" class="form-control" id="name" name="name" placeholder="Type your name" required></p>

				<p><label for="email">E-mail address</label>
				<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Type your e-mail address" required></p>

				<p><label for="password">Password</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Type password" required></p>							

				<p><label for="repeat_password">Repeat password</label>
				<input type="password" class="form-control" id="repeat_password" name="rep_password" placeholder="Repeat password" required></p>

				<p><label for="character">Choose character</label>
				<select title="Select your character" class="selectpicker form-control" name="character" required>
					{foreach $characters as $character}
					<option value="{$character.id}" data-thumbnail="{$character.image}">{$character.name}</option>
					{/foreach}
					</select>
				</p>
				
				<p><label for="character">Choose location</label>
				<select class="selectpicker form-control" name="location">
					<option value="-1" selected="selected">Select your location</option>
					{foreach $locations as $location}
					<option value="{$location.id}">{$location.city}, {$location.country}</option>
					{/foreach}
					</select>
				</p>

				<p><label for="dateofbirth">Birthday</label>
				<input type="date" class="form-control" id="dateofbirth" name="date" max="{$now}" placeholder="Date of Birth"></p>

				<p><button type="submit" class="submit btn btn-primary">Register</button></p>
			</fieldset>
		</form>
	</div></div></div>
	
{include file='footer.tpl'}

</body>

<!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

</html>