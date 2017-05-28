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
	<link rel="stylesheet" href="../../lib/bootstrap-3.3.7/css/bootstrap-select.min.css">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>

{include file='header.tpl'}

	<div class="success">
		{if isset({$password_success}) && !empty({$password_success})}
		<div class="alert alert-success alert-dismissable">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
			<strong>Success!</strong> {$password_success}
		</div>
		{/if}
	
	</div>
	
	<div class="settings">
		<form class="form-horizontal" action="../../actions/users/settings.php" method="post">
			<input type="hidden" name="user-id" value="{$id_logged}">
			<button type="submit" class="submit-btn pull-right">Save</button>
			<h2>Settings</h2>
			<hr>
			<div class="form-group info">
				<label class="col-sm-3" for="newUsername">Change username</label>
				<div class="col-sm-9">
					{if isset({$username_error}) && !empty({$username_error})}
					<input type="text" class="form-control error-input" id="newUsername" maxlength="20" name="username" value="{$user.username}">
					<div class="error-in">Sorry, that username's taken. Try another?</div>
					{else}
					<input type="text" class="form-control" id="newUsername" maxlength="20" name="username" value="{$user.username}">
					{/if}
				</div>
			</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="newemail">Change e-mail address</label>
				<div class="col-sm-9">
					{if isset({$email_error}) && !empty({$email_error})}
					<input type="email" class="form-control error-input" id="newemail" name="email" value="{$user.email}">
					<div class="error-in">Sorry, that e-mail's taken. Try another?</div>
					{else}
					<input type="email" class="form-control" id="newemail" name="email" value="{$user.email}">
					{/if}
				</div>
			</div>
			
			<div class="separator"><span class="glyphicon glyphicon-lock"></span> Change password</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="oldPassword">Old password</label>
				<div class="col-sm-9">
					{if isset({$old_password}) && !empty({$old_password})}
					<input type="password" class="form-control error-input" id="oldPassword" name="old-password" placeholder="Old password">
					<div class="error-in">Wrong password! Try again.</div>
					{else}
					<input type="password" class="form-control" id="oldPassword" name="old-password" placeholder="Old password">
					{/if}
				</div>
			</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="newPassword">New password</label>
				<div class="col-sm-9">
					{if isset({$password_error}) && !empty({$password_error})}
					<input type="password" class="form-control error-input" id="newPassword" name="new-password" placeholder="New password">
					<div class="error-in">Passwords do not match!</div>
					{else}
					<input type="password" class="form-control" id="newPassword" name="new-password" placeholder="New password">
					{/if}
				</div>
			</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="repNewPassword">Repeat new password</label>
				<div class="col-sm-9">
					{if isset({$password_error}) && !empty({$password_error})}
					<input type="password" class="form-control error-input" id="repNewPassword" name="rep-password" placeholder="Repeat new password">
					<div class="error-in">Passwords do not match!</div>
					{else}
					<input type="password" class="form-control" id="repNewPassword" name="rep-password" placeholder="Repeat new password">
					{/if}
				</div>
			</div>
			
			<div class="separator"><span class="glyphicon glyphicon glyphicon-user"></span> Profile settings</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="exampleSelect1">Notifications</label>
				<div class="col-sm-9">
					<select class="form-control" id="exampleSelect1" name="notifications">
						{if isset($notifications) && !empty($notifications)}
						<option value="0" selected="selected">I want to receive notifications</option>
						<option value="1">I don't want to receive notifications</option>
						{else}
						<option value="0">I want to receive notifications</option>
						<option value="1" selected="selected">I don't want to receive notifications</option>
						{/if}
					</select>
				</div>
			</div>
			
			<div class="form-group info">
				<label class="col-sm-3" for="privacy">Profile privacy</label>
				<div class="col-sm-9">
					<select id="privacy" name="privacy" class="selectpicker" data-width="fit">
						{if ($user.public)}
						<option data-icon="glyphicon-globe" value="t" selected="selected">Public</option>
						<option data-icon="glyphicon-lock" value="f">Private</option>
						{else}
						<option data-icon="glyphicon-globe" value="t">Public</option>
						<option data-icon="glyphicon-lock" value="f" selected="selected">Private</option>						
						{/if}
					</select>
				</div>
			</div>
		</form>
	</div>
	<div id="black" class="black_overlay"></div>
	
	<div id="popup" class="edit_box">
		<div class="modal-body">Are you sure you want to delete your profile? This action cannot be undone.</div>
			<div class="modal-footer button-container">
				<form class="form" action="../../actions/users/delete_profile.php" method="post">
					<input type="hidden" name="user-id" value="{$id_logged}">
					<button type="button" id="close" class="close-popup btn">Cancel</button>
					<input type="submit" class="btn btn-primary" value="Delete">
				</form>
			</div>
	</div>
	
	
	<div class="settings">
		<h2>Deactivate account</h2>
		<hr>		
		<div class="delete-wrap">
			<button id="delete-profile" class="popup-trigger btn btn-danger">Delete account</button>
		</div>
	</div>


	{include file='footer.tpl'}
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="../../javascript/settings.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>
</body>
</html>
