{block name=head}
<link href="../../css/default.css" rel="stylesheet" type="text/css"/>
{/block}

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- Menu for mobile display -->
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- Website logo -->
			{if isset($username_logged)}
			<a class="navbar-brand" href="../../pages/users/feed.php"><img alt="Brand" src="../../images/logo.png"></a>
			{else}
			<a class="navbar-brand" href="../../pages/users/homepage.php"><img alt="Brand" src="../../images/logo.png"></a>
			{/if}
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">
			{if isset($username_logged)}
			<!-- Float right -->
			<ul class="nav navbar-nav navbar-right">
				<!-- Dropdown under profile name -->
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$character_name} <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../../pages/users/feed.php">Home</a></li>
						<li><a href="../../pages/users/profile_feed.php?user-id={$id_logged}">Profile</a></li>
						<li><a href="../../pages/users/notifications_mobile.php" class="visible-xs">Notifications</a></li>
						<li><a href="../../pages/events/events_mobile.php" class="visible-xs">Events</a></li>
						<li><a href="../../pages/groups/groups_mobile.php" class="visible-xs">Groups</a></li>
						<li><a href="../../pages/users/settings.php">Settings</a></li>
						<li><a href="../../actions/users/logout.php">Logout</a></li>
					</ul>
				</li>
			</ul>

			<!--  Search bar -->
			<div class="search-bar-wrap text-center">
				<form role="search">
					<div class="form-group">
						<div class="input-group navbar-search-bar">
							<input type="search" id="search-bar" class="form-control" placeholder="Search..." autocomplete="off">
							<span class="input-group-btn">
								<button class="search-btn btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
							</span>
						</div>
					</div>
					<div class="search-results-wrap">
						<ul class="list-unstyled">
						</ul>
					</div>
				</form>
			</div>

			{else}
			<!-- Float right -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../../pages/users/signup.php"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="../../pages/users/login.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
			{/if}

        </div>
    </div>
</nav>