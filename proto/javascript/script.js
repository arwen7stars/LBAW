$(document).ready(function () {
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = this.href.split('#');
		$('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
	})
	
	$('#btnClick').on('click',function(){
		var clickedID = $(this).attr('class');
		
		$('.' + clickedID).show();
	})
	
	$('.white_content').on('click',function(){		
		$('.white_content').hide();
		$('.black_overlay').hide();
	})
	
	$('.edit a').on('click', function() {
		$(".white_content").css("display", "block");
		$(".black_overlay").css("display", "block");
	})
	
});