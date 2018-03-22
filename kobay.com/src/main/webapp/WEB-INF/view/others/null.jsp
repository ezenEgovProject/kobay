<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../css/font.css" />
<link rel="stylesheet" href="../../../css/search.css" />
<style>
.c-red {
	color: #ff0000;
}
</style>
<script>
function fn_detail(value) {
  	if(isLogin == "null") {
		alert("로그인이 필요한 서비스입니다.\n로그인 해주세요.");
	  	location.href = "/loginreg";
  	} else {
	 	location.href = "/kobayDetail_detail?auctionUnq=" + value ;
  	}
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
  	<!-- Page Content -->
	<div class="container" align="center">  
		<div class="justify-content-center mt-2 mb-4">
			<div>
				<img class="card-img-top" src="../../../images/null.png"  style="width: 30%;" alt="">
			</div>
			<div class="h6 strong">
				<span class="text-primary h2">${searchVO.searchKeyword}</span>에 대한 검색 결과가 존재하지 않습니다.
			</div>
			<ul class="col-8 mt-3 mb-1 search">
				<li class="c-grey" style="display:inline-block;">
				·  상품명, 상표명 등의 검색어가 올바른지 확인해 보세요.</li>
				<li class="c-grey " style="display:inline-block;">· 검색어의 단어 수를 줄이거나 <span class="text-warning">예술품, 컴퓨터</span>와 같은 일반적인 단어로 검색해 보세요.</li>
			</ul>
		</div> 
		<ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          	<i class="fa fa-exclamation-circle text-danger fa-lg"></i> 지금  <span style="font-weight: bold">실시간 인기상품</span>을 확인해보세요!
	        </li>
      	</ol>
		<%-- 검색 값이 없을 때 오눌 오픈한 경매 or 인기 경매 몇개만 보여주기  --%>
		<div id="nullList" class="row">
			<c:forEach items="${nullList}" var="nullList">
				<div id="item" class="col-lg-4 col-sm-6 portfolio-item">
					<div id="itemCard" class="card">
						<div class="item-body">
							<a href="javascript:fn_detail('${nullList.auctionunq}')" class="item">
							 	<img class="card-img-top" src="/upload/${nullList.aucimagemain}" alt="">
							  	<span class="item item-content">
							  		<span class="item-text c-grey" style="font-size: 10pt;">[${nullList.mctg}]</span>
							    	<span class="item-text item-title ">${nullList.auctitle}</span>
							  		<span class="item-text">
							  			<span class="item-left h6 c-black"><strong>₩ ${nullList.price }</strong></span>
						   				<span class="item-right" style="text-align: right; margin-bottom: .5rem"><span style="color:red;">${nullList.bids }</span>명 입찰참여</span>
							  		</span>		
								</span>   
							</a>
						</div>
					   	<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-4">${nullList.sellername}</div>
					   		<div class="col-8">${nullList.sdate}~${nullList.edate }</div>
					  	</div>
					</div>
	    				</div>	<!-- /.list -->
			</c:forEach><!-- /list-foreach -->
		</div>
    </div><!-- /.container -->

    <!-- Footer -->
 
	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap3.3.7.min.js"></script>
</body>

