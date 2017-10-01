<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="utf-8">
  <head>
	
    <script src="../../../js/jquery-2.2.2.js"></script>
	<script src="../../../js/jquery-ui.js"></script>
	
    <style>
	.dropdown {
   		 position: relative;
   		 display: inline-block;
		 }

	.dropdown-content {
  		  display: none;
   		 position: absolute;
   		 background-color: #f9f9f9;
   		 min-width: 160px;
   		 box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
   		 padding: 12px 16px;
   		 z-index: 1;
		 }

	.dropdown:hover .dropdown-content {
  		  display: block;
		  }	
</style>

  </head>
  
  <script>
  
  function fn_detail(a) {
		var f = document.hiddenFrm;
		f.member_unq.value = a;
		f.submit();
		}
	  
	  function fn_CardClick(b){
		  location.href = "auction/auctionDetail";
	  }
	  
	  function fn_array(a){
			
		 	var a = $("#arrayType").val();
		 	
			$.ajax({
				type: 'POST',
				url:"<c:url value='/list_1'/>",
				data: a,
				dataType: 'json',
				
				success: function(data){
					if(data.result == "ok"){
						//location.href = "<c:url value='/list_1'/>";
					}else{
						alert("=====no====="+data);
					}
				},
				error: function(error){
					alert("error: "+error);
				},
			});
		}
  
  /* 이미지위에 마우스 올리면 경매정보 뜨게 하기 (원하던건데 실패) */
  /*  $(function(){
	 $('.best1').mouseover(function(){
		$('.best1').text('상품정보');
	});
	$('.best1').mouseout(function(){
		//$('.best1').text('nn');
		$('.best1').img('../../../images/test/google.png');
		/* <img src="../../../images/test/google.png" width="348px" height="190px"> */
//	});	
//});  
  
  </script>

  <body>
    
    <h1 class="my-4" align="center">best 상품</h1>
 <!-- Marketing Icons Section -->
 <script type="text/javascript">
 function fnCardClick() {
	 location.href="http://www.naver.com";
 }
 </script>
      <div class="row">
      
        <div class="col-lg-4 mb-4">
          <div class="card h-100" onclick="fn_CardClick('${member_unq}')">
            <h4 class="card-header">best1</h4>
            <div class="card-body">
            <!-- <div class="best1"> -->
             <!-- <p class="card-text"> -->
             		<div class="dropdown">
             		<span>
             		<% String realPath = getServletContext().getRealPath("img") + "\\google.png"; %>
             		<img src="../../../images/test/google.png" width="348px" height="190px">
             		</span><!-- </p> -->
             		  <div class="dropdown-content">
  						  <p>경매 이름: 시계<br>
      						 경매 가격: 10000원<br>
      						 남은 시간: 2일 5시간 45분
   						 </p>
  					  </div>
             	    </div>	
             </div>
            <div class="card-footer">
             <!--  <a href="#" class="btn btn-primary"> -->상세보기<!-- </a> -->
            </div>
          </div>
        </div>
       
      
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">best2</h4>
            <div class="card-body">
              <p class="card-text">
              <div class="dropdown"><span>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p></span>
            	<div class="dropdown-content">
  						  <p>경매 이름: 가방<br>
      						 경매 가격: 20000원<br>
      						 남은 시간: 3일 9시간 12분
   						 </p>
  				</div>
              </div>	
             </div>            
            <div class="card-footer">
              <!-- <a href="#" class="btn btn-primary"> -->상세보기<!-- </a> -->
            </div>
          </div>
          </a>
        </div>
      
        
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">best3</h4>
            <div class="card-body">
              <p class="card-text">
              <div class="dropdown"><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></span>
            	<div class="dropdown-content">
  						  <p>경매 이름: 신발<br>
      						 경매 가격: 30000원<br>
      						 남은 시간: 8일 2시간 01분
   						 </p>
  				</div>
              </div>	
            </div>
            <div class="card-footer">
              <!-- <a href="#" class="btn btn-primary"> -->상세보기<!-- </a> -->
            </div>
          </div><!-- end of div.card h-100 -->
           </a>
          </div>
        
        </div><!-- end of div.col-lg-4 mb-4 -->
        
         </div>
      
      <!-- /.row -->
      
      <h1 class="my-4" align="center">LIST</h1>
      
      <table border="0" width="600" text-align="right">
		<tr align="right">
			<td><select name="arrayType" onchange="fn_array(this.value);">
					<option value="newest">최신 순</option>
					<option value="lowprice">낮은 가격 순</option>
					<option value="highprice">높은 가격 순</option>
				</select>
			</td>
		</tr>	
	   </table> 
     
      
      <!-- 낙찰 tab -->      
        <p class="count">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;낙찰된 경매 상품 수:</p> 
        
      <!-- Marketing Icons Section -->
       <div class="row">
       <c:forEach var="i"  begin="1" end="${totcnt}" varStatus="status">    
        <c:forEach var="list" items="${resultList}" varStatus="status">         	
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">낙찰${i}</h4>
            <div class="card-body">
              <p class="card-text">
              	<div class="dropdown">
              	<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</span></p>
            	
             		  <div class="dropdown-content">
             		  	 <p> 경매 이름: ${result.title}시계<br>
      						 경매 가격: ${result.Auction_price}10000원<br>
      						 남은 시간: ${fn:substring(result.utime,0,10)}2일 5시간 45분
   						 </p>
  					  </div>
             </div> 
            </div>
            <div class="card-footer">
              <!-- <a href="#" class="btn btn-primary"> -->상세보기<!-- </a> -->
            </div>
          </div>
          </a>
         </div>
        </c:forEach>
        </c:forEach>
        </div>
        
      <!-- /.row -->
	
	</head>

	<script>

    window.onscroll = function() {
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
            //alert("마지막 상품입니다.");
        }
/*         if ($("body").height() < $(window).height()) {
            alert("There isn't a vertical scroll bar");
        } */
    };
    
/* 최근 본 상품 따라오는 배너 */
    
    $(function(){
    	$(window).scroll(function(){ // window창이 스크롤 될때 실행되는 함수
    		
    		var top=$(window).scrollTop(); // 현재 window창의 스크롤의 위치값	
    		$(".banner").animate({"top":top+280+"px"},10); //현재 위치에서 280px의 여백을 두고 10의 속도로 움직임
    		
    		
    		
    		//$(".list_prev").click(function(){$("html,body").animate({scrollTop:'-50'},100); });
    		//$(".list_prev").animate({scrollTop:'top-50px'});
    		
    	});
    	
    /* TOP 버튼 */
    
    	$(".topBtn").click(function(){$("html,body").animate({scrollTop:0},500); }); //500의 속도로 맨위로 이동
    });
    
</script>
<style type="text/css">
.banner{border:2px solid #56b6e6;background:#fff;width:150px;height:500px;position:absolute;right:30px;top:600px;
color:#56b6e6;text-align:center;}
</style>
<body>

<div class="banner">최근 본 상품<br><br>
	<a href="www.naver.com">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>a</td>
		</tr>
	</table>
	</a>
<br>
	<a href="www.naver.com">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>b</td>
		</tr>
	</table>
	</a>
<br>
	<a href="www.naver.com">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>c</td>
		</tr>
	</table>
	</a>
<br><br>
	<a href="#" id="topBtn">TOP</a>
</div> 

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>