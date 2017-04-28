<?php /* Smarty version Smarty-3.1.15, created on 2017-04-27 13:29:08
         compiled from "/usr/users2/mieic2014/up201404587/public_html/proto/templates/header_logged.tpl" */ ?>
<?php /*%%SmartyHeaderCode:6924644445901cc2f404476-46739084%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'acb8429f83b4fe70fd28659831c5c15b1a7b3319' => 
    array (
      0 => '/usr/users2/mieic2014/up201404587/public_html/proto/templates/header_logged.tpl',
      1 => 1493296143,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '6924644445901cc2f404476-46739084',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5901cc2f475902_87143666',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5901cc2f475902_87143666')) {function content_5901cc2f475902_87143666($_smarty_tpl) {?>
    <link href="../../css/index.css" rel="stylesheet" type="text/css"/>
	<link href="../../css/default.css" rel="stylesheet" type="text/css"/>


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
          <a class="navbar-brand" href="#"><img alt="Brand" src="../../images/logo.png"></a>
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">

          <!-- Float right -->
          <ul class="nav navbar-nav navbar-right">
            <!-- Dropdown under profile name -->
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sayonara <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="../../pages/users/profile.php">Profile</a></li>
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
    </nav><?php }} ?>
