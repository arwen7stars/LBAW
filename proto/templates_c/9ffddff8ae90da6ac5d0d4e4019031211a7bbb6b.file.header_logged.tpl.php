<?php /* Smarty version Smarty-3.1.15, created on 2017-05-12 09:53:54
         compiled from "C:\xampp\htdocs\myfiles\LBAW\proto\templates\header_logged.tpl" */ ?>
<?php /*%%SmartyHeaderCode:766759121493c49435-33172588%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9ffddff8ae90da6ac5d0d4e4019031211a7bbb6b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\myfiles\\LBAW\\proto\\templates\\header_logged.tpl',
      1 => 1494579192,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '766759121493c49435-33172588',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_59121493c926b9_64023068',
  'variables' => 
  array (
    'username' => 0,
    'id_logged' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_59121493c926b9_64023068')) {function content_59121493c926b9_64023068($_smarty_tpl) {?>
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
          <a class="navbar-brand" href="../../pages/users/feed.php"><img alt="Brand" src="../../images/logo.png"></a>
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">

          <!-- Float right -->
          <ul class="nav navbar-nav navbar-right">
            <!-- Dropdown under profile name -->
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $_smarty_tpl->tpl_vars['username']->value;?>
 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="../../pages/users/profile_feed.php?user-id=<?php echo $_smarty_tpl->tpl_vars['id_logged']->value;?>
">Profile</a></li>
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
