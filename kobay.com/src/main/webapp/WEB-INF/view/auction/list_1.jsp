<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="utf-8">
<link rel="stylesheet" href="../../../css/search.css" />
<script>
	$(document).ready(function() {
		$('#itemList').load("/list1");
	}) ;
	
  /* 상세보기 페이지 */
  function fn_detail(value) {
	  if(isLogin == "null") {
		  alert("로그인이 필요한 서비스입니다.\n로그인 해주세요.");
		  location.href = "/loginreg";
	  } else {
		 document.hiddenFrm.auctionUnq.value = value;
		 document.hiddenFrm.submit();
	  }
	}
  
  /* 리스트 정렬을 위한 함수 */
  function fn_array(){
 		 
 		 var selectValue = document.getElementById("orderCondition").value;
 		 var data = "orderCondition=" + selectValue;
 		 
 		 $.ajax({
 			 dataType: 'json',
 			 data: data,
 			 url: "<c:url value='/order'/>",
 			 type: 'POST',
 			 
 			 success:function(response){
 				 if(response.result == "ok"){
 					$('#itemList').load("/list1");
 					return false;
 				 }
 				 else {
 					$('#itemList').load("/list1");
 				 }
 			 },
 			 error:function(error){
 				 alert(response.message);
 			 }
 		 });
 	 }
 	 
  	/* 스크롤이 하단에 위치했을 때 마지막상품임을 알림 */
	window.onscroll = function() {
       if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
           alert("마지막 상품입니다.");
       }
   };
    
    /* 최근 본 상품 따라오는 배너 */
    $(function(){
    	$(window).scroll(function(){ // window창이 스크롤 될때 실행되는 함수
    		
    		var top=$(window).scrollTop(); // 현재 window창의 스크롤의 위치값	
    		$(".banner").animate({"top":top+500+"px"},10); //현재 위치에서 500px의 여백을 두고 10의 속도로 움직임
    		
    	});
    	
    /* TOP 버튼 */
    $(".topBtn").click(function(){$("html,body").animate({scrollTop:0},500); }); //500의 속도로 맨위로 이동
    });
  
</script>
<body>
  
<form name="hiddenFrm" method="post" action="/kobayDetail_detail">
	<input type="hidden" name="auctionUnq" id="auctionUnq"/>
</form>

   <!-- Marketing Icons Section -->
<div class="container">
	<h3 class="mt-4 mb-3 pr-3" align="right">Best Auction List</h3>
	<hr/>
	<ol class="breadcrumb bg-white">
       <li class="breadcrumb-item">
       		진행중인 <span class="strong text-warning">인기상품</span>을 확인해보세요!
       </li>
	</ol>
     <div class="row">
	     <c:forEach items="${bestList}" end="${count-1}" var="best" varStatus="status">
		     <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
		          <div class="card">
		          <%-- varStatus는 현재 forEach문의 반복값입니다. varStatus에 변수로 status라고 지정한 후에
		          	status.count 를 사용하면 1, 2, 3, 4, 5.. 순차적으로 값을 출력할 수 있습니다.
		          	추가로 status.index 를 사용하면 0, 1, 2, 3, 4, 5... 로 count와 달리 0부터 시작합니다. --%>
					<div class="card-body" style="padding: 0px">
		              	<a href="javascript:fn_detail('${best.auctionunq}')">
		              		<img class="card-img-top" style="height: 154px;" src="/upload/${best.aucimagemain}" alt="">
	              			<span class="pt-2 pb-2 text-center" style="display: block; border-bottom: 1px solid #ddd">
		              		 진행 경매 ${status.count}
		              		</span>
			              	<span class="pl-2 pr-2 pt-2 pb-2 item"  style="display: block;">
			              		<span class="item item-text" style="font-size: 1.2rem;">${best.auctitle }</span>
							  	<span class="item-text item-text">현재 가격 : ${best.price }</span>	
		              		</span>
						</a>
	              		<div class="item-footer pl-2 pr-2 pb-1 pt-1">
					   		경매 참여인원 :${best.bids}
					  	</div>
		              </div>		      
		          </div> 
		      </div>
	     </c:forEach>
     </div>
     <!-- /.row -->
      	<h3 class="mt-4 mb-3 pr-3" align="right">Progressing Auction List</h3>
      	<hr/>
		<ol class="breadcrumb bg-white">
	       <li class="breadcrumb-item"  style="vertical-align: middle;">
	       		<span style="vertical-align: middle">
	       			진행중인 경매 상품 수: <span class="strong text-success">${totcnt1}개</span>
	       		</span>
	       </li>
	       <li>
	       	<div class="col-12" align="right" style="padding: 0px">
				<div class="col-2" style="padding: 0px"> 
			     	<select name="orderCondition" class="form-control list_select" id="orderCondition" onchange="fn_array()">
						<option value=" " <c:if test="${listVO.orderCondition eq ' '}">selected</c:if>> - 정렬기준 - </option>
						<option value="best" <c:if test="${listVO.orderCondition eq 'best'}">selected</c:if>> 인기경매 순 </option>
						<option value="newest" <c:if test="${listVO.orderCondition eq 'newest'}">selected</c:if>> 최신경매 순 </option>
						<option value="lowprice" <c:if test="${listVO.orderCondition eq 'lowprice'}">selected</c:if>>낮은가격 순</option>
						<option value="highprice" <c:if test="${listVO.orderCondition eq 'highprice'}">selected</c:if>>높은가격 순</option>
					</select>  
	      		</div>
			</div>
	       </li>
		</ol>
	   
	   	<!-- 진행 중인 경매 리스트  -->    
     		
	    <!-- Marketing Icons Section -->
	    <div id="itemList" class="row"> 
	    	
	    </div>
	 </div>
	 
	 <div class="banner" style="width:80px;height:30px;"><a href="#" id="topBtn">TOP</a></div>

<%-- <div class="banner">최근 본 상품<br><br>
	<a href="#" onclick="fn_detail('${list.auctionunq}')">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>a</td>
		</tr>
	</table>
	</a>
<br>
	<a href="#" onclick="fn_detail('${list.auctionunq}')">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>b</td>
		</tr>
	</table>
	</a>
<br>
	<a href="#" onclick="fn_detail('${list.auctionunq}')">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>c</td>
		</tr>
	</table>
	</a>
<br><br>
	<a href="#" id="topBtn">TOP</a><!-- topBtn: 페이지 상단으로 가는 버튼 -->
</div>  --%>

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>