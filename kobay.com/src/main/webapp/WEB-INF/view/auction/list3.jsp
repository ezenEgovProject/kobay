<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../../js/jquery-2.2.2.js"></script>
<script src="../../../js/jquery-ui.js"></script>
<title>Insert title here</title>
<style type="text/css">
.box{height:3000px; width:200px; background:#BBE1DE;}
.topBtn{background:#cccccc;width:150px;height:20px;position:absolute;right:50px;top:410px;
color:#fff;text-align:center;}
.least{background:#BFC409;width:150px;height:300px;position:absolute;right:50px;top:100px;
color:#fff;text-align:center;}
</style>
</head> 
<script>
$(function(){
	$('#ak').mouseenter(function(){
		$('#word').text('상품정보');
	});
	$('#ak').mouseleave(function(){
		$('#word').text('444');
	});	
});
</script> 
<body>
<div class="box"></div>
<div class="topBtn">TOP버튼</div>
<div class="least">최근 본 상품</div>
<div id="ak" style="width:50px;height:50px;background:blue;"></div>
<p id="word">dd</p>
<script>
$(function(){
	$(window).scroll(function(){
		//var top=$(window).scrollTop();
		//$(".topBtn").animate({"top":top+410+"px"},100);
		
		var top=$(window).scrollTop();		
		$(".least").animate({"top":top+100+"px"},100);
	});
	$(".topBtn").click(function(){$("html,body").animate({scrollTop:0},100); });
});
</script>
</body>
</html>