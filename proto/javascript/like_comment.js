/*
* Global Variables
*/
var likeButtons;

/**
* Handler for onclick of like button
*/
var onClickHandler = function(event) {

  var likeButton = $(event.target.closest('.like-comment-btn'));
  var commentId = likeButton.closest('.comment').attr('id').substr(8);

  $.ajax({
    type: "POST",
    url: "../../database/like_comment.php",
    dataType: 'json',
    data: {"comment-id": commentId}
  }).done(function(data) {
    likeButton.children(".like-comment-number").text(data.count);
    var likeButtonHtml = likeButton.html();
  }).fail(function() {

  });

};


/**
* Main
*/
$(document).ready(function() {

  // get all like buttons
	likeButtons = $(".like-comment-btn");

  // bind event handler for all of them
  likeButtons.click(onClickHandler);

});