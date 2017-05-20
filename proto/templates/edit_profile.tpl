<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Profile</title>
    <!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
    <link href="../../css/default.css" rel="stylesheet">
    <link href="../../css/edit.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
</head>

<body>
	{include file='header_logged.tpl'}
	<div id="edit">
		<form class="form-horizontal" action="../../actions/posts/edit_profile.php" method="post">
			<input type="hidden" name="user-id" value="{$id_logged}">
			<button type="submit" class="submit-btn pull-right">Save</button>
				
			<h2>Edit Profile</h2>
			<hr>
			<div class="info form-group">
				<label for="name" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span> Name</label>
				<div class="col-sm-10">
					<input class="form-control" type="username" id="name" name="name" value="{$user.name}" class="table-form" required>
				</div>
			</div>
			
			<div class="info form-group">
				<label for="dateofbirth" class="col-sm-2 control-label"><span class="glyphicon glyphicon-gift"></span> Birthday</label>
				<div class="col-sm-10">
					<input class="form-control" type="date" id="dateofbirth" name="date" value="{$date}" max="{$now}">
				</div>
			</div>
			
			<div class="separator"><span class="glyphicon glyphicon-home"></span> Location</div>
			
			<div class="info form-group">
				<label for="location" class="col-sm-2 control-label">City, Country</label>
				<div class="col-sm-10">
					<select id="location" name="location" class="selectpicker" data-width="fit">
						{if !empty($location)}
							<option value="-1">Select location</option>
							{foreach $locations as $loc}
								{if $loc.id == $location.id}
								<option value="{$loc.id}" selected="selected">{$loc.city}, {$loc.country}</option>
								{else}
								<option value="{$loc.id}">{$loc.city}, {$loc.country}</option>
								{/if}
							{/foreach}
						{else}
							<option value="-1" selected="selected">Select location</option>
						{/if}
					</select>
				</div>
			</div>
			
			<div class="separator"><span class="glyphicon glyphicon-pencil"></span> Additional infomation</div>
			<div class="info form-group">
				<label for="about" class="col-sm-2 control-label">About</label>
				<div class="col-sm-10">
					{if !(empty($user.about))}
					<textarea id="about" name="about" class="form-control txtarea-comment" rows="3">{$user.about}</textarea>
					{else}
					<textarea id="about" name="about" class="form-control txtarea-comment" rows="3" placeholder="Insert information about you"></textarea>
					{/if}
				</div>
			</div>
		</form>
	</div>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
</body>

</html>