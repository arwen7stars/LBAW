<?php /* Smarty version Smarty-3.1.15, created on 2017-04-28 16:33:30
         compiled from "/home/tirafesi/Downloads/proto/templates/header_logged.tpl" */ ?>
<?php /*%%SmartyHeaderCode:178457215459034ec86a6d46-89032310%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c459fd1e92b1a6c15e55b03a16f81aeb490ab635' => 
    array (
      0 => '/home/tirafesi/Downloads/proto/templates/header_logged.tpl',
      1 => 1493393575,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '178457215459034ec86a6d46-89032310',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_59034ec87571b8_56409947',
  'variables' => 
  array (
    'username' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_59034ec87571b8_56409947')) {function content_59034ec87571b8_56409947($_smarty_tpl) {?>
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
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
 <span class="caret"></span></a>
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
<?php }} ?>
