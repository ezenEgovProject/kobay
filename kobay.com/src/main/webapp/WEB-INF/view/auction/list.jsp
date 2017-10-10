<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../../js/jquery-2.2.2.js"></script>
<script src="../../../js/jquery-ui.js"></script>
<title>LIST</title>
</head>

<script>

    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 600) {
                $('#topBtn').fadeIn();
            } else {
                $('#topBtn').fadeOut();
            }
        });
        
        $("#topBtn").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
    
/*     $(window).scroll(function(){
        var scrollTop = jQuery(document).scrollTop();
        //console.log("scrollTop : " + scrollTop);
        if (scrollTop < 168) {
            scrollTop = 168;
        }
        jQuery("#quickMenu").stop();
        jQuery("#quickMenu").animate( { "top" : scrollTop });
    });  */
    
    $(document).ready(function(){
        $("#testbanner").scrollFollow({
            speed : 800,    // 꿈지럭 거리는 속도
            offset : 200     // 웹페이지 상단에서 부터의 거리(바꿔보면 뭔지 안다)
        });
    });
</script>
<body>
 <div id="testbanner">
 <table border="1" align="right" width="100"> 
<tr>
	<td>최근 본 상품</td>
</tr>
</table>        
    </div>

<table border="1" width="600">
<tr>
	<td align="center"><a href="">진행 중</a></td>
	<td align="center"><a href="">진행 예정</a></td>
	<td align="center"><a href="">낙찰</a></td>
</tr>	
</table>
<table border="0" width="600">
<tr>
	<td align="center">best</td>
</tr>
</table>
<br>
<table border="1" width="600" height="300">
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
</table>
<br>
<table border="0" width="600">
<tr>
	<td align="center">list</td>
</tr>
</table>
<table border="0" width="600">
	<tr align="right">
		<td><select name="array">
				<option value="낮은 가격 순">낮은 가격 순</option>
				<option value="높은 가격 순">높은 가격 순</option>
			</select>
		</td>
	</tr>	
</table>
<br>
<table border="1" width="600" height="300">
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
</table>
<table border="0" width="600">
	<tr>
		<td><a href="#" class="topBtn">top</a></td>
	</tr>
</table>
</body>
</html>