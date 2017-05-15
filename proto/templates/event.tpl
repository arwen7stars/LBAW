<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Event</title>

  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../css/feed.css" rel="stylesheet">
  <link href="../../css/event.css" rel="stylesheet">
</head>

<body>
	  <div class="body-flex">
	  
	  {include file='header_logged.tpl'}

  
  <!--Event Stuff-->  	
	<div class="container text-center event">
	<img src="../../images/group.png" class="img-responsive" alt="Group Image">
	<div class="btn-group-lg info" role="group" aria-label="...">
	  <div class="btn-group" role="group">
  <button type="button" class="btn btn-lg">Interested</button>
  </div>
  <div class="btn-group" role="group">
  <button type="button" class="btn btn-lg">Going</button>
  </div>
  <div class="btn-group" role="group">
  <button type="button" class="btn btn-lg">Ignore</button>
  </div>
	</div>
	<div class="container details">
	<h2 align="left">About</h2>
	<p>05/03/2017</p>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
	</div>
</div>

 <!-- Main Content -->
    <div class="content">

      <!--  Left -->
      <div class="content-left hidden-xs">

        <div class="events">
          <h2><a href="event.html">Events</a></h2>
          <ul class="event-list list-unstyled">
            <!-- Max 3 list-items at once -->
            <li><a href="#">Etiam vel</a></li>
            <li><a href="#">Phasellus aliquet sapien</a></li>
            <li><a href="#">Donec laoreet dui</a></li>
          </ul>
        </div>

        <div class="groups">
          <h2><a href="group.html">Groups</a></h2>
          <ul class="group-list list-unstyled">
            <!-- Max 3 list-items at once -->
            <li><a href="#">Duis in vehicula</a></li>
            <li><a href="#">Fermentum eget</a></li>
            <li><a href="#">Maecenas sit</a></li>
          </ul>
        </div>

        <div class="chat">
          <h2><a href="#">Online Friends</a></h2>
          <ul class="contact-list list-unstyled">
            <li><a href="#" align=""><span class="glyphicon glyphicon-user"></span> Hikari</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Himari</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Masamune</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Naruto</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Son Goku</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Vegeta</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Kasuma</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Aqua</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Eris</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Megumin</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Mauve</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Ecchan</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bulma</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sakura</a></li>
          </ul>
          <!-- Search bar -->
          <form role="search">
            <div class="form-group chat-search-bar">
              <label for="search-bar" class="sr-only">Search bar</label>
              <div class="input-group">
                <input type="search" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </form>
        </div>

      </div>

      <!--  Middle -->
      <div class="content-middle">

        <!-- MAKE-POST -->
        <div class="make-post">
          <form class="make-post-form">
            <div class="form-group">
              <label for="make-post" class="sr-only">Write a post</label>
              <textarea id="make-post" class="form-control txtarea-post" rows="2" placeholder="Write something to post..."></textarea>
            </div>
            <button type="submit" class="btn btn-default btn-post">Post</button>
          </form>
        </div>

        <div class="post">
          <div class="post-body">
            <h2 class="poster"><a href="#"><span class="glyphicon glyphicon-user"></span> Hikari</a></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu enim augue. Quisque mollis nisi eget urna rutrum laoreet. Nunc vehicula arcu diam, vel elementum nisi pretium nec. Suspendisse sollicitudin neque sed lacus condimentum maximus. Sed id lacus eget velit luctus consequat. Etiam efficitur dui eget ante ornare, quis dapibus ipsum elementum. Ut sit amet iaculis turpis. Sed convallis mi sed libero vestibulum cursus. Sed ut neque urna. Duis sodales urna pellentesque tellus scelerisque lacinia. Quisque vitae enim condimentum, feugiat lectus id, eleifend sapien.</p>
          </div>
          <div class="like-share-wrap">
            <ul class="like-share">
              <li><a href="#">Like</a></li>
              <li><a href="#">Share</a></li>
            </ul>
          </div>
          <div class="make-comment-wrap">
            <form class="form">
              <div class="form-group">
                <textarea class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
              </div>
            </form>
            <button type="submit" class="btn btn-default btn-comment">Comment</button>
          </div>
        </div>

        <div class="post">
          <div class="post-body">
            <h2 class="poster"><a href="#"><span class="glyphicon glyphicon-user"></span> Himari</a></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec erat non augue pellentesque congue id in neque. Maecenas interdum arcu justo, at convallis turpis interdum et. Donec fermentum, turpis et iaculis aliquam, dolor justo sagittis tortor, in porttitor ipsum mauris non tortor. Aliquam convallis risus a mauris sagittis rhoncus. Vivamus vel fermentum nisi. Integer massa neque, tempor sit amet blandit vitae, tristique nec enim.</p>
          </div>
          <div class="like-share-wrap">
            <ul class="like-share">
              <li><a href="#">Like</a></li>
              <li><a href="#">Share</a></li>
            </ul>
          </div>
          <div class="make-comment-wrap">
            <form class="form">
              <div class="form-group">
                <textarea class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
              </div>
            </form>
            <button type="submit" class="btn btn-default btn-comment">Comment</button>
          </div>
        </div>

        <div class="post">
          <div class="post-body">
            <h2 class="poster"><a href="#"><span class="glyphicon glyphicon-user"></span> Aqua</a></h2>
            <p>Nunc sit amet mi non orci consectetur convallis. Sed fermentum nisl at nisl volutpat, luctus consectetur magna scelerisque. Vivamus suscipit placerat luctus. Vestibulum dapibus non eros et tristique. Vivamus sit amet neque ut nisl ornare commodo vel sed dolor. Donec at viverra arcu. Suspendisse potenti. Curabitur libero ipsum, scelerisque vitae nunc at, laoreet condimentum risus. Sed auctor turpis sollicitudin lorem rhoncus suscipit. Etiam libero nisi, porttitor sit amet accumsan ut, egestas nec ipsum. Phasellus vel libero congue, dictum lectus commodo, blandit tellus. Mauris sit amet pulvinar justo. Nullam lacus sapien, elementum id quam sed, ultricies malesuada felis. Aenean mattis turpis sed consequat convallis. Vivamus in mattis velit, vel dapibus lorem. Praesent luctus, felis nec pellentesque scelerisque, ipsum magna euismod mauris, nec eleifend ipsum mi nec augue.</p>
          </div>
          <div class="like-share-wrap">
            <ul class="like-share">
              <li><a href="#">Like</a></li>
              <li><a href="#">Share</a></li>
            </ul>
          </div>
          <div class="make-comment-wrap">
            <form class="form">
              <div class="form-group">
                <textarea class="form-control txtarea-comment" rows="1" placeholder="Write something to comment..."></textarea>
              </div>
            </form>
            <button type="submit" class="btn btn-default btn-comment">Comment</button>
          </div>
        </div>

      </div>

      <!--  Right -->
      <div class="content-right hidden-xs">

        <div class="notifications">
          <h2><a href="#">Notifications</a></h2>
          <ul class="notification-list list-unstyled">
            <li><a href="#">Maecenas aliquet eleifend nisl nec tincidunt.</a></li>
            <li><a href="#">Praesent tempor ac eros id iaculis. Suspendisse potenti.</a></li>
            <li><a href="#">Donec laoreet dui nec massa mollis, vel posuere metus sodales. Suspendisse dictum, ligula id scelerisque laoreet.</a></li>
            <li><a href="#">Sed non commodo urna. Ut vehicula ornare ipsum a malesuada.</a></li>
          </ul>
        </div>

        <div class="recent-news">
          <h2><a href="#">Recent News </a></h2>
          <p>Urabitur et tincidunt dolor. Mauris in vulputate ante. Praesent vel arcu ac felis iaculis efficitur a ornare sapien. Nam tellus massa.</p>
          <div class="read-more"><a href="#">Read more...</a></div>
        </div>

      </div>

    </div>

   {include file='footer.tpl'}

  </div>

</body>

 <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</html>