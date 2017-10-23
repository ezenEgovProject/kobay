<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "kobay.com.cmmn.Cookies" %>
<!DOCTYPE html>
<html lang="utf-8">

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
<!-- 최근 본 상품 쿠키 -->
<%-- <%
Cookie[] cook = request.getCookies();
if(cook != null){
	for(int i=0; i<cook.length; i++){
		String name = cook[i].getName();
		if(name.indexOf("item") != -1){
			String value = cook[i].getValue();
		}
	}
}
%> --%>
<script>

  /* 상세보기 페이지 */
  function fn_detail(a) {
	var f = document.hiddenFrm;
	f.auctionUnq.value = a;
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

   <h1 class="my-4" align="center">best 상품</h1>
 <!-- Marketing Icons Section -->

     <div id="row" class="row">
     
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행중best1</span>
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
              		<img src="../../../upload/${list.aucimagemain}" style="height:374px; width:374px;"/> 
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">경매번호</span>
						  		<span class="item-text item-text">
						  			<span class="item-left">경매가격: </span>
						  			<span class="item-right">시작시간: </span><br>
					   				<span class="item-right">마감시간: </span>
						  		</span>	  
              			</span>
              		</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
      </div>
      
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행중best2</span>
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
              		<img src="../../../upload/${list.aucimagemain}" style="height:374px; width:374px;"/> 
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">경매번호</span>
						  		<span class="item-text item-text">
						  			<span class="item-left">경매가격: </span>
						  			<span class="item-right">시작시간: </span><br>
					   				<span class="item-right">마감시간: </span>
						  		</span>	
              			</span>
              		</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
        </div>
      
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행중best3</span>
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
              		<img src="../../../upload/${list.aucimagemain}" style="height:374px; width:374px;"/> 
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">경매번호</span>
						  		<span class="item-text item-text">
						  			<span class="item-left">경매가격: </span>
						  			<span class="item-right">시작시간: </span><br>
					   				<span class="item-right">마감시간: </span>
						  		</span>	
              			</span>
              		</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
         </div>
         </div>
      <!-- /.row -->
      
      <h1 class="my-4" align="center">LIST</h1>
      
       <table class="array"><!-- array: 정렬select박스 테이블명 -->
		<tr align="right">
			<td>
				<select name="orderCondition" id="orderCondition" onchange="fn_array()">
					<option value=" " <c:if test="${listVO.orderCondition eq ' '}">selected</c:if>> - 정렬기준 - </option>
					<option value="best" <c:if test="${listVO.orderCondition eq 'best'}">selected</c:if>> 인기경매 순 </option>
					<option value="newest" <c:if test="${listVO.orderCondition eq 'newest'}">selected</c:if>> 최신경매 순 </option>
					<option value="lowprice" <c:if test="${listVO.orderCondition eq 'lowprice'}">selected</c:if>>낮은가격 순</option>
					<option value="highprice" <c:if test="${listVO.orderCondition eq 'highprice'}">selected</c:if>>높은가격 순</option>
				</select>
			</td>
		</tr>	
	   </table> 
	   
	   	<!-- 진행 중인 경매 리스트  -->    
     		
     <p class="count">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진행 중인 경매 상품 수: ${totcnt1}개</p> 
        	
    <!-- Marketing Icons Section -->
       <div id="itemList" class="row">
       
   		 <c:forEach var="list" items="${resultList}" varStatus="status"> 
              <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행중${totcnt1}</span>
              	<a href="#" onclick="fn_detail('${list.auctionUnq}')">
              		<img src="../../../upload/${list.aucimagemain}" style="height:374px; width:374px;"/>
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
          	 <c:set var="totcnt1" value="${(totcnt1)-1}"/>
          	 </div>
          </c:forEach> <!-- /list-forEach -->
	   </div> <!-- /.row -->

</head>
  
<div class="banner">최근 본 상품<br><br>
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
	<a href="#" onclick="fn_detail('${list.auctionusnq}')">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>c</td>
		</tr>
	</table>
	</a>
<br><br>
	<a href="#" id="topBtn">TOP</a><!-- topBtn: 페이지 상단으로 가는 버튼 -->
</div> 
<br>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container --> 
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>