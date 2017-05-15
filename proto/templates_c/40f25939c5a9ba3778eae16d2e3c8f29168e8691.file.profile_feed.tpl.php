<?php /* Smarty version Smarty-3.1.15, created on 2017-05-15 08:55:24
         compiled from "C:\xampp\htdocs\myfiles\LBAW\proto\templates\profile_feed.tpl" */ ?>
<?php /*%%SmartyHeaderCode:214659121493b80ef7-28594135%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40f25939c5a9ba3778eae16d2e3c8f29168e8691' => 
    array (
      0 => 'C:\\xampp\\htdocs\\myfiles\\LBAW\\proto\\templates\\profile_feed.tpl',
      1 => 1494834919,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '214659121493b80ef7-28594135',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_59121493c322f1_08652939',
  'variables' => 
  array (
    'image' => 0,
    'character' => 0,
    'series' => 0,
    'username' => 0,
    'username_logged' => 0,
    'images' => 0,
    'img' => 0,
    'id' => 0,
    'posts' => 0,
    'post' => 0,
    'comments' => 0,
    'k' => 0,
    'v' => 0,
    'comment' => 0,
    'name' => 0,
    'age' => 0,
    'location' => 0,
    'about' => 0,
    'all_images' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_59121493c322f1_08652939')) {function content_59121493c322f1_08652939($_smarty_tpl) {?><!DOCTYPE html>
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
    <link href="../../css/profile.css" rel="stylesheet">
    <link href="../../css/default.css" rel="stylesheet">
</head>

<body>



  <?php echo $_smarty_tpl->getSubTemplate ('header_logged.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


        <div class="container">
            <div class="row justify-content-start">
                <div class="user_bar col-md-3 hidden-xs hidden-sm">
                    <div class="user_info">
                        <img class="centered-and-cropped" src="<?php echo $_smarty_tpl->tpl_vars['image']->value['url'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['image']->value['description'];?>
">
                        <center><h2><?php echo $_smarty_tpl->tpl_vars['character']->value['name'];?>
</h2></center>
                        <ul class="list-unstyled">
                            <li>
                                <span class="glyphicon glyphicon-user"></span>
								<b>Character is</b> <a href="<?php echo $_smarty_tpl->tpl_vars['character']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['character']->value['name'];?>
</a>
                            </li>
                            <li>
                                <span class="glyphicon glyphicon-book"></span>
                                <b> Series is</b> <a href="<?php echo $_smarty_tpl->tpl_vars['series']->value['url'];?>
"><?php echo $_smarty_tpl->tpl_vars['series']->value['name'];?>
</a>
                            </li>
                        </ul>
						<?php if (!($_smarty_tpl->tpl_vars['username']->value==$_smarty_tpl->tpl_vars['username_logged']->value)) {?>
                        <div class="user_opt">
                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <a href="./profile.html" class="btn-group" role="group">
                                    <button type="button" class="btn btn-default">
                                        <b>Add friend <span class="glyphicon glyphicon-plus"></span></b>
                                    </button>
                                </a>
                            </div>
                        </div>
						<?php }?>
                    </div>
					<?php if (!empty($_smarty_tpl->tpl_vars['images']->value)) {?>
                    <div class="user_photos">
                        <h3><b>Photos</b></h3><?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?><img class="centered-and-cropped thumb-64px" src="<?php echo $_smarty_tpl->tpl_vars['img']->value['url'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['img']->value['description'];?>
"> <?php } ?>
                        <br>
                        <a href="#photos" data-toggle="tab">
                            View more...
                        </a>
                    </div>
					<?php }?>
                </div>

                <div class="timeline col-md-7">
				
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a data-toggle="tab" href="#home">Profile</a></li>
						<li><a data-toggle="tab" href="#about">About</a></li>
						<li><a data-toggle="tab" href="#friends">Friends</a></li>
						<li><a data-toggle="tab" href="#photos">Photos</a></li>
					</ul>
				
					  <div class="tab-content">
						<div id="home" class="tab-pane fade in active">
						  <?php if ($_smarty_tpl->tpl_vars['username']->value==$_smarty_tpl->tpl_vars['username_logged']->value) {?>
							<!-- MAKE-POST -->
							<div class="make-post">
								<form class="form" action="../../actions/posts/post.php" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<br>
										<div class="btn-wrap">
											<input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
">
											<textarea id="make-post" name="body" class="form-control txtarea-post" rows="3" placeholder="Write something to post..."></textarea>
											<span class="button-container">
												<label class="btn btn-primary" for="my-file-selector">
													<input id="my-file-selector" type="file" name="image" style="display:none;" onchange="$('#upload-file-info').html($(this).val());">
													Upload photo
												</label>
												
												<span class='label label-info' id="upload-file-info"></span>
												<input type="submit" value="Post"/>
											</span>
										</div>
									</div>
								</form>
							</div>
							<?php }?>

							<?php  $_smarty_tpl->tpl_vars['post'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['post']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['posts']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['post']->key => $_smarty_tpl->tpl_vars['post']->value) {
$_smarty_tpl->tpl_vars['post']->_loop = true;
?>
							<p><div class="post">
								<div class="post-body">
									<p>
										<div class="dropdown pull-right">
											<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
											<ul class="dropdown-menu">
												<li><a href="#">Edit</a></li>
												<li><a href="#">Delete</a></li>
											</ul>
										</div>

										<p class="poster">
											<a href="#">
												<img src="<?php echo $_smarty_tpl->tpl_vars['post']->value['charurl'];?>
" class="centered-and-cropped thumb-32px">
												<?php echo $_smarty_tpl->tpl_vars['post']->value['charname'];?>

											</a>
										</p>
									</p>
									<div class="post-content">
										<?php echo $_smarty_tpl->tpl_vars['post']->value['body'];?>

										<img src="<?php echo $_smarty_tpl->tpl_vars['post']->value['url'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['post']->value['description'];?>
" class="ph_display">
									</div>

								</div>
								
								<p><span class="opt-group">
									<a href="#" class="opt btn-group" role="group">
									<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-heart"></span> Likes <?php echo $_smarty_tpl->tpl_vars['post']->value['likes'];?>
</a></button>
									</a>
									<a href="#" class="opt btn-group" role="group">
										<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-comment"></span> Comments <?php echo $_smarty_tpl->tpl_vars['post']->value['comments'];?>
</a></button>
									</a>
									<a href="#" class="opt btn-group" role="group">
										<button type="button" class="btn btn-default post-opt"><a href="#"><span class="glyphicon glyphicon-share"></span> Shares 99</a></button>
									</a>
								</span></p>

								<div class="make-comment-wrap">
									<form class="form">
										<div class="form-group">
											<label for="make-comment" class="sr-only">Write a comment</label>
											<textarea id="make-comment" class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
										</div>
									</form>
									<button type="submit" class="btn btn-default btn-comment">Comment</button>
								</div>
							</div>
							<div class="post_space">
								<div class="comments <?php echo $_smarty_tpl->tpl_vars['post']->value['postid'];?>
">
								<?php  $_smarty_tpl->tpl_vars['v'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['v']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['comments']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['v']->key => $_smarty_tpl->tpl_vars['v']->value) {
$_smarty_tpl->tpl_vars['v']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['v']->key;
?><?php if ($_smarty_tpl->tpl_vars['k']->value==$_smarty_tpl->tpl_vars['post']->value['postid']) {?><?php  $_smarty_tpl->tpl_vars['comment'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['comment']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['v']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['comment']->key => $_smarty_tpl->tpl_vars['comment']->value) {
$_smarty_tpl->tpl_vars['comment']->_loop = true;
?>
									<div class="comment">
										<p>
											<div class="dropdown pull-right">
												<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
												<span class="glyphicon glyphicon-chevron-down"></span></button>
												<ul class="dropdown-menu">
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>
												</ul>
											</div>
										<a href="profile_feed.php?user-id=<?php echo $_smarty_tpl->tpl_vars['comment']->value['userid'];?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['comment']->value['url'];?>
" class="centered-and-cropped thumb-32px"><b><?php echo $_smarty_tpl->tpl_vars['comment']->value['name'];?>
</b></a>
										</p>
										<p><?php echo $_smarty_tpl->tpl_vars['comment']->value['body'];?>
</p>
												
										
										<a href="#"><span class="glyphicon glyphicon-heart"></span> <?php echo $_smarty_tpl->tpl_vars['comment']->value['likes'];?>
</a>
									</div>
								<?php } ?><?php }?><?php } ?>
								</div>
								
							</div></p>
								
							<?php } ?>
						</div>
						<div id="about" class="tab-pane fade">
							<div class="about">
								<div class="about-header">
									<a href="#" class="btn-group pull-right" role="group">
										<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
									</a>
									<h2>Information about user</h2>
								</div>
								<hr>
								<div class="about-body">
								<p><b>Name:</b> <?php echo $_smarty_tpl->tpl_vars['name']->value;?>
</p>
								<p><b>Nickname:</b> <?php echo $_smarty_tpl->tpl_vars['username']->value;?>
</p>
								<?php if (!empty($_smarty_tpl->tpl_vars['age']->value)) {?>
								<p><b>Age:</b> <?php echo $_smarty_tpl->tpl_vars['age']->value;?>
</p>
								<?php }?>
								<?php if (!empty($_smarty_tpl->tpl_vars['location']->value)) {?>
								<p><b>Location:</b> <?php echo $_smarty_tpl->tpl_vars['location']->value['city'];?>
, <?php echo $_smarty_tpl->tpl_vars['location']->value['country'];?>
</p>
								<?php }?>
								<?php if (!empty($_smarty_tpl->tpl_vars['about']->value)) {?>
								<p><b>Additional information:</b> <?php echo $_smarty_tpl->tpl_vars['about']->value;?>
</p>
								<?php }?>
								</div>
							</div>
						</div>
						<div id="friends" class="tab-pane fade">
							<div class="friends">
								<h2>Friends</h2>
								<hr>
								<div class="friends-body">
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/6s38iwe0l/Luke_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Luke Fon Fabre</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/qdrpf3gfp/Van.jpg" class="thumb-150px">
										<figcaption>Van Grants</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/j99w6296d/Natalia_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Natalia Luzu</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s11.postimg.org/chyn6djj7/Anise_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Anise Tatlin</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/z2a98s6ph/Ion_Avatar.jpg" class="thumb-150px">
										<figcaption>Ion</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/mmdjf1ddh/Guy_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Guy Cecil</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/vk2uq4v79/Jade_Avatar_1.jpg" class="thumb-150px">
										<figcaption>Jade Curtiss</figcaption></a>
									</div>
									<div class="imgContainer">
										<a href="#"><img src="https://s8.postimg.org/dq2rb3mr9/Asch_Avatar_1.png" class="thumb-150px">
										<figcaption>Asch the Bloody</figcaption></a>
									</div>
								</div>
							</div>
						</div>
						<div id="photos" class="tab-pane fade">
							<div class="photos">
								<h2>Photos</h2>
								<hr>
								<div class="photos-body">
								<?php  $_smarty_tpl->tpl_vars['img'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['img']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['all_images']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['img']->key => $_smarty_tpl->tpl_vars['img']->value) {
$_smarty_tpl->tpl_vars['img']->_loop = true;
?><img class="centered-and-cropped thumb-150px" src="<?php echo $_smarty_tpl->tpl_vars['img']->value['url'];?>
" alt="<?php echo $_smarty_tpl->tpl_vars['img']->value['description'];?>
"> <?php } ?>
								</div>
							</div>
						</div>
					  </div>

                </div>
            </div>
        </div>
        <!-- FOOTER -->
        <footer class="footer">
            <p class="text-muted" align="center">Anibook.com is a property of Anibook, LLC. ©2017 All Rights Reserved.
            </p>
        </footer>
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="../../lib/jquery-3.1.1.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script src="../../javascript/script.js"></script>
        
</body>

</html>
<?php }} ?>
