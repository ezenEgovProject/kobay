<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<title>ReList1(진행중)</title>
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

</style>
</head>
<script>

	/* 상세보기 페이지 */
	function fn_detail(a) {
		var f = document.hiddenFrm;
		f.auctionUnq.value = a;
		f.submit();
	}
  
</script>
<body>
<form name="hiddenFrm" method="post" action="/kobayDetail_detail">
	<input type="hidden" name="auctionunq" id="auctionunq"/>
  </form>
<!-- 진행 중인 경매 리스트  -->    
     		
    <!-- Marketing Icons Section -->
       <div id="itemList" class="row">
   		 <c:forEach var="list" items="${resultList}" varStatus="status"> 
              <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card">
              <span class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px; font-size:16pt; font-weight: bold;">진행중${totcnt1}</span>
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
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
</body>
</html>