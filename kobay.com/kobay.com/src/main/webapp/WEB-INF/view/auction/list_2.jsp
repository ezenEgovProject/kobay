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
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay_LIST2(진행예정)</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
    
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
<head>
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
					$('#itemList').load("/list2");
					return false;
				 }
				 else {
					$('#itemList').load("/list2");
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
	<input type="hidden" name="auctionUnq" id="auctionunq"/>
</form>
    <!-- Navigation -->
    <nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
		<div class="container" style="width: 100%;">
			<div class="row justify-content-between align-items-center" style="width: 100%;">
				<div class="col-12 col-sm-auto order-sm-1 text-center">
					<a class="navbar-brand" href="index.jsp"><label class="logo">Kobay</label></a>
				</div>
				<div class="col-4 order-sm-2">
				    <div class="input-group">
				      <span class="input-group-btn">
				        <button class="btn search-btn" type="button"><i class="fa fa-search fa-lg" style="color: #0080ff"></i></button>
				      </span>
				      <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요.">
				    </div><!-- /input-group -->
			  	</div>
				<div class="col-6 col-sm-auto order-sm-3" >
					 <span class="top-icon"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
					 <span class="top-icon"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
				</div>
			</div>
		</div> 
	<!-- /.navbar-top -->
   </nav>
   
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
          	<li class="nav-item px-lg-4 active">
              <a class="nav-link" href="/main">홈</a>
            </li>
          	<li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  회사소개
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/intro">KOBAY 소개</a>
                <a class="dropdown-item" href="#">경매방법</a>
                <a class="dropdown-item" href="#">문의사항</a>
              </div>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="/list_1" >진행경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="/list_2">예정경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="/list_3">마감경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">이벤트</a>
            </li>
          </ul>
        </div>
      </div>
    
   <h1 class="my-4" align="center">best 상품</h1>
 <!-- Marketing Icons Section -->

     <div id="row" class="row">
     
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행예정best1</span>
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
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행예정best2</span>
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
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행예정best3</span>
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
	   
      <!-- 진행예정 중인 경매 리스트 -->          
      
        <p class="count">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진행 예정 중인 경매 상품 수:&nbsp;${totcnt2}개</p> 
        
      <!-- Marketing Icons Section -->
       <div id="itemList" class="row">
   		 <c:forEach var="list" items="${resultList}" varStatus="status"> 
              <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행예정${totcnt2}</span>
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
              		<img src="../../../upload/${list.aucimagemain}" style="height:374px; width:374px;"/> 
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">${list.auctitle}</span>
						  		<span class="item-text item-text">
						  			<span class="item-left">경매가격: ${list.sprice}</span>
						  			<span class="item-right">시작시간: ${list.sdate}</span><br>
					   				<span class="item-right">마감시간: ${list.edate}</span>
						  		</span>	
              		</span>
              	</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
          	 <c:set var="totcnt2" value="${(totcnt2)-1}"/>
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
	<a href="#" onclick="fn_detail('${list.auctionunq}')">
	<table border="1" align="center" style="width:100px; height:100px;">
		<tr>
			<td>c</td>
		</tr>
	</table>
	</a>
<br><br>
	<a href="#" id="topBtn">TOP</a><!-- topBtn: 페이지 상단으로 가는 버튼 -->
</div> 

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