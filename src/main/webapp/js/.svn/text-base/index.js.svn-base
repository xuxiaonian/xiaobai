$(function(){
	$('#lanPos').css('top',$('.hover').offset().top);
		$('.j-ul .j-li').hover(function(){
			$('#lanPos').css($(this).offset().top);
			},function(){
				$('#lanPos').css($('.hover').offset().top);
				})
		
		$('.j-ul .j-li').click(function(){
				for(var i=0;i<$('.j-ul .j-li').size();i++){
						if(this==$('.j-ul .j-li').get(i)){
							$('.j-ul .j-li').eq(i).children('a').addClass('hover');
							}else{
								$('.j-ul .j-li').eq(i).children('a').removeClass('hover');
								}
					}
			})
				
	})