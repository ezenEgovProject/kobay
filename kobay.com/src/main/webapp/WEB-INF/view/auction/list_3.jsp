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
    <script src="../../../js/jquery-2.2.2.js"></script>
	<script src="../../../js/jquery-ui.js"></script>

    <title>Kobay_LIST3</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
    
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
		  
	.banner{border:2px solid #56b6e6;background:#fff;width:150px;height:500px;position:absolute;right:30px;top:600px;
			color:#56b6e6;text-align:center;}
			
</style>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
  </head>
  
  <script>
  
  function fn_detail(a) {
		var f = document.hiddenFrm;
		f.memberUnq.value = a;
		f.submit();
		}
	  
	  function fn_CardClick(b){
		  location.href = "auction/auctionDetail";
	  }
	  
	  function fn_array(c){
		
	 	var c = $("#orderCondition").val();
	 	
		$.ajax({
			type: 'POST',
			url:"<c:url value='/list_1'/>",
			data: c,
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
    <form name="frm" method="post" action="#">
  	<input type="hidden" name="memberUnq" id="memberUnq"/>
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
    <nav class="navbar navbar-expand-lg navbar-light bg-light subnav">
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
    </nav>
    
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
            <p class="card-text"></p>
             		<div class="dropdown">
             		<span>
             		<% String realPath = getServletContext().getRealPath("img") + "\\google.png"; %>
             		<img src="../../../images/test/google.png" width="348px" height="190px">
             		</span>
             		  <div class="dropdown-content">
  						  <p>경매 이름: 시계<br>
      						 경매 가격: 10000원<br>
      						 남은 시간: 2일 5시간 45분
   						 </p>
  					  </div>
             	    </div>	
             </div>
            <div class="card-footer">상세보기</div>
          </div>
        </div>
       
      
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">best2</h4>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="dropdown">
              <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</span>
            	<div class="dropdown-content">
  						  <p>경매 이름: 가방<br>
      						 경매 가격: 20000원<br>
      						 남은 시간: 3일 9시간 12분
   						  </p>
  				</div>
              </div>	
             </div>            
            <div class="card-footer">상세보기</div>
          </div>
          </a>
        </div>
      
        
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">best3</h4>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="dropdown"><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</span>
            	<div class="dropdown-content">
  						  <p>경매 이름: 신발<br>
      						 경매 가격: 30000원<br>
      						 남은 시간: 8일 2시간 01분
   						  </p>
  				</div>
              </div>	
            </div>
            <div class="card-footer">상세보기</div>
          </div><!-- end of div.card h-100 -->
           </a>
          </div>
        </div><!-- end of div.col-lg-4 mb-4 -->
        
         </div>
      
      <!-- /.row -->
      
      <h1 class="my-4" align="center">LIST</h1>
      
      <table border="0" width="600" text-align="right">
		<tr align="right">
			<td><select name="orderCondition" onchange="fn_array(this.value);">
					<option value="newest">최신 순</option>
					<option value="lowprice">낮은 가격 순</option>
					<option value="highprice">높은 가격 순</option>
				</select>
			</td>
		</tr>	
	   </table> 
     
      
      <!-- 낙찰 tab -->      
        <p class="count">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;낙찰된 경매 상품 수:&nbsp;${totcnt}개</p> 
        
      <!-- Marketing Icons Section -->
       <div class="row">
       <c:forEach var="i"  begin="1" end="${totcnt}" varStatus="status">    
                	
        <div class="col-lg-4 mb-4">
        <a href="www.naver.com">
          <div class="card h-100">
            <h4 class="card-header">낙찰${i}</h4>
            <div class="card-body">
              <p class="card-text"></p>
              	<div class="dropdown">
              	<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</span>
            	<c:forEach var="list" items="${resultList}" varStatus="status"> 
             		  <div class="dropdown-content">
             		  	 <p> 경매 이름: ${list.title}<br>
      						 경매 가격: ${list.auctionPrice}원<br>
      						 남은 시간: ${list.sdate}
   						 </p>
  					  </div>
  				</c:forEach>
             </div> 
            </div>
            <div class="card-footer">상세보기</div>
          </div>
          </a>
         </div>
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
    
   </form>
  </body>
</html>