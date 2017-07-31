$(document).ready(function() {  
  			//Default Action  
		    $(".tab_content").hide(); //Hide all content  
		    $("ul.tabs li:first").addClass("active").show(); //Activate first tab  
		    $(".tab_content:first").show(); //Show first tab content  
		      
		    //On Click Event  
		    $("ul.tabs li").click(function() {  
		        $("ul.tabs li").removeClass("active"); //Remove any "active" class  
		        $(this).addClass("active"); //Add "active" class to selected tab  
		        $(".tab_content").hide(); //Hide all tab content  
		        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content  
		        $(activeTab).fadeIn(); //Fade in the active content  
		        return false;  
		    });  
		  
		});  
		/*tab切换*/
		$(function(){
			$('.beginTime').date();
			$('#endTime').date({theme:"datetime"});
		});
		/*日历代码*/
		/*下拉（下单时间、订单编号）*/
		$(function(){
				$(".select p").click(function(e){
					$(".select").toggleClass('open');
					e.stopPropagation();
				});
				
				$(".content .select ul li").click(function(e){
					var _this=$(this);
					$(".select > p").text(_this.attr('data-value'));
					_this.addClass("Selected").siblings().removeClass("Selected");
					$(".select").removeClass("open");
					e.stopPropagation();
				});
				
				$(document).on('click',function(){
					$(".select").removeClass("open");
				})
				
			});