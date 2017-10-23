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
  	<style type="text/css">
  	.breadcrumb {
  		background-color: #eee;
  	}
  	a:link { text-decoration: none;}
a:visited {  text-decoration: none;}
a:hover { text-decoration: none; color:#007bff;}
  	
  	</style>
  	
    <style>  
	.banner{
			border:2px solid #56b6e6;
			background:#fff;
			width:150px;
			height:500px;
			position:absolute;
			right:30px;
			top:600px;
			color:#56b6e6;
			text-align:center;
		  }
			
	.item-body {
    	-ms-flex: 1 1 auto;
    	flex: 1 1 auto;
    	padding: .5rem;
		}
		
	.item > span {
		display: block;
		}
		
	.item-footer {
   	 	padding: .25rem .25rem;
   		background-color: rgba(0,0,0,.03);
    	border-top: 1px solid rgba(0,0,0,.125);
 		}
 		
	.item-title {
		margin-top: .25rem;
    	margin-bottom: .5rem;
    	height: 56px;
		}
		
	.item-text {
		text-align: left;
		color: #6e6e6e;
		margin-left: .25rem; 
		margin-right: .25rem; 
		overflow: hidden;
    	text-overflow: ellipsis; 
		}
		
	.item-right {
		float: right;
    	width: 49.9%;
		}
		
	.item-left {
		float: left;
    	width: 49.9%;
		}
		
	.list_select {
    	height: 46px;
    	text-align: left;
    	font-size: 14px;
		}
		
	.card-body {
		font-size: 0.9rem;
		position: relative;
		}
	
	.card-text {
		font-weight: bold; 
		text-align: left;
		margin-left: 1rem;
		}
		
	.card-text-normal {
		text-align: left;
		color: #6e6e6e;
		margin-left: .25rem; 
		margin-right: .25rem; 
		}
		
	.card{
 		position:relative;
 		display:-ms-flexbox;
 		display:flex;
 		-ms-flex-direction:column;
 		flex-direction:column;
 		min-width:0;
 		word-wrap:break-word;
 		background-color:#fff;
 		background-clip:border-box;
 		border:1px solid rgba(0,0,0,.125);
 		border-radius:.25rem;
 		}
 		
 	.array{
 		border:0px;
 		width:1600px;
 		text-align:right;
 		}

</style>
</head>
<script>
  	
	/* 상세보기 페이지 */
	function fn_detail(a) {
		var f = document.hiddenFrm;
		f.auctionunq.value = a;
		f.submit();
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
					$('#itemList').load("/list3");
					return false;
				 }
				 else {
					$('#itemList').load("/list3");
				 }
			 },
			 error:function(error){
				 alert(response.message);
			 }
		 });
	 }
	 
	window.onscroll = function() {
       if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
           alert("마지막 상품입니다.");
       }
   };
   
   /* 최근 본 상품 따라오는 배너 */
   $(function(){
   	$(window).scroll(function(){ // window창이 스크롤 될때 실행되는 함수
   		
   		var top=$(window).scrollTop(); // 현재 window창의 스크롤의 위치값	
   		$(".banner").animate({"top":top+280+"px"},10); //현재 위치에서 280px의 여백을 두고 10의 속도로 움직임
   	});
   	
   /* TOP 버튼 */
   	$(".topBtn").click(function(){$("html,body").animate({scrollTop:0},500); }); //500의 속도로 맨위로 이동
   });
   
</script>

<body>

<form name="hiddenFrm" method="post" action="/kobayDetail_detail">
	<input type="hidden" name="auctionunq" id="auctionunq"/>
</form>
    
 <!-- Marketing Icons Section -->
<div class="container">
	<h3 class="mt-4 mb-3 pr-3" align="right">Best Auction List</h3>
	<hr/>
	<ol class="breadcrumb bg-white">
       <li class="breadcrumb-item">
       		마감된 <span class="strong text-warning">인기상품</span>을 확인해보세요!
       </li>
	</ol>
     <div class="row">
	     <c:forEach begin="1" end="4" step="1" varStatus="status">
		     <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
		          <div class="card">
		          <%-- varStatus는 현재 forEach문의 반복값입니다. varStatus에 변수로 status라고 지정한 후에
		          	status.count 를 사용하면 1, 2, 3, 4, 5.. 순차적으로 값을 출력할 수 있습니다.
		          	추가로 status.index 를 사용하면 0, 1, 2, 3, 4, 5... 로 count와 달리 0부터 시작합니다. --%>
					<div class="card-body" style="padding: 0px">
		              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
		              		<img class="card-img-top" src="http://placehold.it/700x400" alt="">
	              			<span class="pt-2 pb-2 text-center" style="display: block; border-bottom: 1px solid #ddd">
		              		 Close Auction Best ${status.count}
		              		</span>
			              	<span class="pl-2 pr-2 pt-2 pb-2 item"  style="display: block;">
			              		<span class="item item-title item-text" style="font-size: 1.2rem;">경매title</span>
							  	<span class="item-text item-text">낙찰가격:</span>	
		              		</span>
						</a>
	              		<div class="item-footer pl-2 pr-2 pb-1 pt-1">
					   		경매 참여인원 :
					  	</div>
		              </div>		      
		          </div> 
		      </div>
	     </c:forEach>
     </div>
     <!-- /.row -->
      	<h3 class="mt-4 mb-3 pr-3" align="right">Closing Auction List</h3>
      	<hr/>
		<ol class="breadcrumb bg-white">
	       <li class="breadcrumb-item"  style="vertical-align: middle;">
	       		<span style="vertical-align: middle">
	       			낙찰된 경매 상품 수: <span class="strong text-success">${totcnt3}개</span>
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
		
		
		
      
     
      <!-- 낙찰된 경매 리스트 -->    
        
      <%--   <p class="count">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;낙찰된 경매 상품 수:&nbsp;${totcnt3}개</p>  --%>
        
      <!-- Marketing Icons Section -->
       <div id="itemList" class="row">
   		 <c:forEach var="list" items="${resultList}" varStatus="status"> 
              <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">마감${totcnt3}</span>
              	<a href="#" onclick="fn_detail('${list.auctionUnq}')">
              		<img class="card-img-top" src="http://placehold.it/700x400" alt="">
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">${list.auctitle}</span>
					  		<span class="item-text item-text">
					  			<span class="item-left">경매가격: ${list.sprice}</span>
				   				<span class="item-right">마감시간: ${list.edate}</span>
					  		</span>	
              		</span>
              	</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
          	 <c:set var="totcnt3" value="${(totcnt3)-1}"/>
          	 </div>
          </c:forEach> <!-- /list-forEach -->
	   </div> <!-- /.row -->
	   
</div>


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