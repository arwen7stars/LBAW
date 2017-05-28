<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Anibook - Sign Up</title>

  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../css/default.css" rel="stylesheet">
  <link href="../../css/forms.css" rel="stylesheet">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="../../lib/bootstrap-3.3.7/css/bootstrap-select.min.css">
  <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>

{include file='header.tpl'}
<div class="container">
	<div class="row">
	
	
	<div class="forms col-lg-1 col-centered">
		<h2>Register</h2>
		<hr>
		<form action="../../actions/users/register.php" method="post">
			<fieldset>
				<h4><span class="number">1</span>User credentials</h4>
			
				<div class="form-group">
					<label for="username" class="required">Username</label>
					
					{if isset({$username_error}) && !empty({$username_error})}
					<input type="text" class="form-control error-input" id="username" name="username" maxlength="20" placeholder="Type username" required>
					<div class="error-in">Sorry, that username's taken. Try another?</div>
					{else}
					<input type="text" class="form-control" id="username" name="username" maxlength="20" placeholder="Type username" required>
					{/if}
					
					
				</div>
				
				<div class="form-group">
					<label for="email" class="required">E-mail address</label>
					{if isset({$email_error}) && !empty({$email_error})}
					<input type="email" class="form-control error-input" id="email" name="email" placeholder="Type your e-mail address" required>
					<div class="error-in">Sorry, that e-mail's taken. Try another?</div>
					{else}
					<input type="email" class="form-control" id="email" name="email" placeholder="Type your e-mail address" required>
					{/if}
				</div>				
				
				<div class="form-group">
					<label for="password" class="required">Password</label>
					{if isset({$password_error}) && !empty({$password_error})}
					<input type="password" class="form-control error-input" id="password" name="password" placeholder="Type password" required>
					<div class="error-in">{$password_error}</div>
					{else}
					<input type="password" class="form-control" id="password" name="password" placeholder="Type password" required>
					{/if}
				</div>

				<div class="form-group">
					<label for="repeat_password" class="required">Repeat password</label>
					{if isset({$password_error}) && !empty({$password_error})}
					<input type="password" class="form-control error-input" id="repeat_password" name="rep_password" placeholder="Repeat password" required>
					<div class="error-in">{$password_error}</div>
					{else}
					<input type="password" class="form-control" id="repeat_password" name="rep_password" placeholder="Repeat password" required>
					{/if}
				</div>
				<hr>
				<h4><span class="number">2</span>User information</h4>
				
				<div class="form-group">
					<label for="name" class="required">Name (only letters and spaces)</label>
					<input type="text" class="form-control" id="name" name="name" placeholder="Type your name" required>
				</div>
				
				<div class="form-group">
					<label for="location">Choose location</label>
					<select class="selectpicker form-control" id="location" name="location">
						<option value="-1" selected="selected">Select your location</option>
						{foreach $locations as $location}
						<option value="{$location.id}">{$location.city}, {$location.country}</option>
						{/foreach}
					</select>
				</div>

				<div class="form-group">
					<label for="dateofbirth">Birthday</label>
					<input type="date" class="form-control" id="dateofbirth" name="date" max="{$now}">
				</div>
				
				<hr>
				<h4><span class="number">3</span>Selecting character</h4>

				<div class="form-group">
					<label for="character" class="required">Choose character</label>
					<select title="Select your character" class="selectpicker form-control" id="character" name="character" required>
						<option value="">Choose character</option>
						{foreach $characters as $character}
						<option value="{$character.id}" data-thumbnail="{$character.image}">{$character.name} - {$character.charname}</option>
						{/foreach}
					</select>
					
				</div>

				<p><button type="submit" class="submit btn btn-primary">Register</button></p>
			</fieldset>
		</form>
	</div></div></div>
	
{include file='footer.tpl'}

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="../../javascript/script.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>

</body>

</html>