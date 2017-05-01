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
          <a class="navbar-brand" href="../../pages/users/feed.php"><img alt="Brand" src="../../images/logo.png"></a>
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">

          <!-- Float right -->
          <ul class="nav navbar-nav navbar-right">
            <!-- Dropdown under profile name -->
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$username} <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="../../pages/users/profile_feed.php">Profile</a></li>
                <li class="visible-xs"><a href="../../pages/users/groups.php">Groups</a></li>
                <li class="visible-xs"><a href="../../pages/users/events.php">Events</a></li>
                <li><a href="../../pages/users/settings.php">Settings</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="../../actions/users/logout.php">Logout</a></li>
              </ul>
            </li>
          </ul>

          <!--  Search bar -->
          <form role="search">
            <div class="form-group">
              <label for="search-bar" class="sr-only">Search bar</label>
              <div class="input-group navbar-search-bar">
                <input type="search" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button class="search-btn btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </form>

        </div>
      </div>
</nav>
