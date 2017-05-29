/*
* Global Variables
*/
var likeButtons;

/**
* Handler for onclick of like button
*/
var onClickHandler = function(event) {

  var likeButton = $(event.target.closest('.like-btn'));
  var postId = likeButton.closest('.post').attr('id').substr(5);

  $.ajax({
    type: "POST",
    url: "../../database/like.php",
    dataType: 'json',
    data: {"post-id": postId}
  }).done(function(data) {
    likeButton.children(".like-number").text(data.count);
    var likeButtonHtml = likeButton.html();
    if (likeButtonHtml.match("Like")) {
      likeButton.html(likeButtonHtml.replace("Like", "Dislike"));
    } else {
      likeButton.html(likeButtonHtml.replace("Dislike", "Like"));
    }

  }).fail(function() {

  });

};


/**
* Main
*/
$(document).ready(function() {

  // get all like buttons
	likeButtons = $(".like-btn");

  // bind event handler for all of them
  likeButtons.click(onClickHandler);

});
