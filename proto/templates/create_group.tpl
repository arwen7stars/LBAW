<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Create New Group</title>
	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/forms.css" rel="stylesheet">

</head>

<body>

<div class="body-flex">

	{include file='header.tpl'}

	<div class="container">
		<div class="row">
			<div class="forms col-lg-1 col-centered">
				<h2>Create New Group</h2>
				<form id="create_group" method="post" action="../../actions/groups/create_group.php">
					<fieldset>
						<p><label for="name">Group Name</label>
						<input type="text" class="form-control" id="name" name="group_name" placeholder="Group Name" required></p>
						
						<p><label for="group_description">Group Description</label>
						<input type="text" class="form-control" id="group_description" name="group_description" placeholder="Small description of the group"></p>
						
						<p><label for="group_privacy">Group Privacy</label>
						<select name="group_privacy" class="form-control" id="event_privacy">
								<option value="t">Public</option>
								<option value="f">Private</option>
						</select></p>
						
						<p><button type="submit" class="submit btn btn-primary">Create Group</button></p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	{include file='footer.tpl'}

	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
</body>
</html>
