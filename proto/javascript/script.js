$(document).ready(function () {
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = this.href.split('#');
		$('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
	})
	
	$('#btnClick').on('click',function(){
		var clickedID = $(this).attr('class');
		
		$('.' + clickedID).show();
	})
});