<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
<link rel="stylesheet" href="../../../css/font.css" />
<style>
body {
	font-size: .9rem; 
	font-family:"NanumGothic";
}
label {
	margin-top: .5rem;
	margin-left: .3rem;
	margin-right: .3rem;
	font-size: .9rem; 
	font-family:"NanumGothic";
}
.form-group > label {
    display: inline-block;
    max-width: 100%;
    margin: 5px .25px 5px .25px;
}

.category ul  {
    padding: 0;
    display:table;
    width:100%;
    box-sizing:border-box;
    -moz-box-sizing:border-box;
    -webkit-box-sizing:border-box;
}

.list-inline > li {
    display: table-cell;
    padding-right: 5px;
    padding-left: 5px;
}
.text-left {
	text-align: left important!;
}
.card-body {
	font-size: 0.9rem;
}
.sub li,.main li{
	float:left;
	list-style:none;
	margin:0px;
}
.main li div {
	display:block; 
	width:180px;  
	font-size: .9rem; 
	font-family:"NanumGothic";
	text-decoration:none;
}
.sub li div {
	display:block; 
	width:180px; 
	color: #808080;
	font-size: .8rem; 
	font-family:"NanumGothic"; 
	text-decoration:none;
}

.list-group-item {
	border: 0px;
}

.sub-body {
	border-top: 1px solid rgba(0,0,0,.125);
	display: none; 
	padding-left: 1.25rem;
	padding-right: 1.25rem;
	padding-top: 0.5rem;
	padding-bottom: 0.5rem;
}
.top-line {
	border-top: 1px solid rgba(0,0,0,.125);	
}

.badge {
    display: inline-block;
    min-width: 10px;
    padding-right: 0.3rem;
    font-size: 10px;
    font-weight: 700;
    line-height: 1;
    color: #999999;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    background-color: transparent;
    border-radius: 10px;
}
.input-style {
	font-size: 0.7rem;
	padding: 0.5rem 0.5rem;
	border-radius : 0;
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
.label-small {
  vertical-align: super;
  font-size: 14px;
}

 a:link { text-decoration: none;}
 a:visited {  text-decoration: none;}
 a:hover { text-decoration: none; color:#007bff;}

.c-black {
	color: #000;
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

.item-text {
	text-align: left;
	color: #6e6e6e;
	margin-left: .25rem; 
	margin-right: .25rem; 
	
}

.item-title {
	margin-top: .25rem;
    margin-bottom: .5rem;
    height: 56px;
    font-size: 14pt;
    color: #000 important!;
    overflow: hidden;
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




</style>
<script type="text/javascript">
var isToggle = false;
var curToggle;
$(document).ready(function () {
		subHide();
})
function toggelClick(thisValue) {
	var id = thisValue.getAttribute("id");
	
	if(curToggle != id) {
		isToggle = false;
		var listSize = "${listSize}";
		for(var i = 1; i <= listSize; i++ ) {
			subHide();
			$("#fa"+i).attr('class', 'fa fa-plus-circle');
		}
	
	}
	//alert("thisVale" + id + ", curToggle: " + curToggle);
	curToggle = id;
	
	isToggle = !isToggle;
	
	// id에 따라에 따라 다른 내용 보여줄것
    if(isToggle) {
    	document.getElementById("subCtg").style.display = "block";
    	
    	switch (id) {
    	case "test1":
    		$('#fa1').attr('class', 'fa fa-minus-circle');
    		$("#collapse1").show();
    		break;
    	case "test2":
    		$('#fa2').attr('class', 'fa fa-minus-circle');
    		$("#collapse2").show();
    		break;	
    	case "test3":
    		$('#fa3').attr('class', 'fa fa-minus-circle');
    		$("#collapse3").show();
    		break;	
    	case "test4":
    		$('#fa4').attr('class', 'fa fa-minus-circle');
    		$("#collapse4").show();
    		break;
    	case "test5":
    		$('#fa5').attr('class', 'fa fa-minus-circle');
    		$("#collapse5").show();
    		break;
    	case "test6":
    		$('#fa6').attr('class', 'fa fa-minus-circle');
    		$("#collapse6").show();
    		break;
    	case "test7":
    		$('#fa7').attr('class', 'fa fa-minus-circle');
    		$("#collapse7").show();
    		break;
    	}	
    	
  
    } else {
    	document.getElementById("subCtg").style.display = "none";
    	var listSize = "${listSize}";
    	for(var i = 1; i <= listSize; i++ ) {
			subHide();
			$("#fa"+i).attr('class', 'fa fa-plus-circle');
		}
    	
    } 
	
}
function subHide() {
	
	var listSize = "${listSize}";
	for(var i = 1; i <= listSize; i++ ) {
		$("#collapse" + i).hide();
	}
}
</script>
<script type="text/javascript">
function orderFunction() {
	var selectValue = document.getElementById("orderCondition").value;
	var params = "orderCondition=" + selectValue;
	$.ajax({
		type : 'POST',
		data : params,
		url : "<c:url value='/listReOrder'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
			//$('#itemList').load('refresh.html');
				self.location.reload();
				return false;
			}
			else {
				// 성공
				//alert("삭제되었습니다.");
				self.location.reload();
			}
		},
		error : function(error) {
			alert("에러가 발생했습니다.");
		}
	});
}
</script>
  <body>
  	<!-- Page Content -->
	<div class="container" align="center">  
		<div class="mb-4 mt-4" style="width: 90%" id="accordion" role="tablist" aria-multiselectable="true">
			 <div class="card">
				<div id="mainCtg" class="card-body h-75">
					<div class="row align-items-center">
					 	<div class="col-2">
					 		<p class="card-text" >카테고리</p>
					 	</div>
					 	<div id="category" class="col-10 category">
					 		<div id="mainCtg" role="tab" id="headingOne">
          						<ul class="list-inline main" style="margin-bottom: 0px; padding: 0;">
							 		<c:forEach items="${lCtgList}" var ="lList" varStatus="status">
							 			<li class="text-left">
								 			<div>
								 			<input type="checkbox" id="${lList.ctgcd}" />
								 			<label for="${lList.ctgcd}">${lList.ctgnm}<span class="badge">5</span>
									 			<a onclick="toggelClick(this)" id="test${status.count }" data-toggle="collapse"  data-parent="#accordion" aria-expanded="false" aria-controls="collapse1">
		          									<i id="fa${status.count }" class="fa fa-plus-circle" aria-hidden="true" style="color: #FF6666"></i>
		          								</a>
	          								</label>  
	          								</div>   	
				 						</li>
							 		</c:forEach>
			 					</ul>
        					</div>	<!-- /.mainCtg --> 		
			 			</div> <!-- /.category -->
					</div> <!-- /.row -->
				</div> <!-- /.mainCtg -->
				
				<div id="subCtg" class="card-body sub-body h-75 bg-light top-line">
					<div class="row align-items-center">
			 			<div class="col-2">
			 				<p class="card-text" style="font-weight: bold;">상세검색</p>
			 			</div>
			 			<div class="col-10">
   							<c:forEach items="${mList}" var="mCtgList" varStatus="lCtgStatus">
    							<c:set var="divId" value="collapse${lCtgStatus.count}"/>
    							<div id="${divId}" role="tabpanel" aria-labelledby="headingOne" >
									<ul class="sub list-inline" style="margin:0px" >
										<c:forEach items='${mCtgList}' var="mCtg" varStatus="status">
										<li class="text-left">
										<div>
											<input type="checkbox" id="${mCtg.ctgcd}"/>
											<label for="${mCtg.ctgcd}">${mCtg.ctgnm}</label><span class="badge">5</span>
										</div>
										</li>
										</c:forEach>
									</ul>
				        		</div>
			        		</c:forEach>
					 	</div>  <!-- /.col-10 -->
					</div><!-- /.row -->
		 		</div><!-- /.subCtg -->
		 		
		 		<div class="card-body h-75 top-line align-items-center">
		 			<div id="sCondition" class="row align-items-center" style="margin: 0px" >
		 				<form class="form-inline" role="form">
				 			<div class="form-group row card-text-normal">
				 				<!-- <label for="sprice">가격</label> -->
								<span><input type="text" size="7" class="form-control input-style" id="sprice"> </span>
								<span id="dash" class="px-1"> ~ </span>
								<span ><input type="text" size="7" class="form-control input-style" id="eprice"></span>
								<span style="margin: 5px"><input type="button" class="form-control input-style" value="가격검색"></span>
							</div>
				 		</form>
				 		<span id="space" class="px-2"></span>
		 				<form class="form-inline" role="form">
				 			<div class="form-group row card-text-normal" style="font-weight: normal;">
				 				<!-- <label for="sprice">가격</label> -->
								<span><input type="text" size="16" class="form-control input-style" id="innerCondition"> </span>
								<span class="px-1"><input type="button" class="form-control input-style" value="결과내 재검색"></span>
							</div>
				 		</form>
				 		<span id="space" class="px-2"></span>
				 		<form class="form-inline " role="form">
				 			<div class="form-group row card-text-normal">
								<input type="checkbox" id="deliveryWay1"/>
								<label for="deliveryWay1" class="label-small">직접수령</label>
							</div>
							<div class="form-group row card-text-normal">
								<input type="checkbox" id="deliveryWay2"/>
								<label for="deliveryWay2" class="label-small">무료배송</label>
							</div>
							<span id="dash" class="px-3"> / </span>
							<div class="form-group row card-text-normal">
								<input type="checkbox" id="aucStatus1"/>
								<label for="aucStatus1" class="label-small">진행경매</label>
							</div>
							<div class="form-group row card-text-normal">
								<input type="checkbox" id="aucStatus2"/>
								<label for="aucStatus2" class="label-small">예정경매</label>
							</div>
						</form>
			 		</div>
		 		</div>
			</div><!-- /.card -->
		</div><!-- /.Category -->
	
		<div id="listContainer" style="width:90%">
			<div id="search" class="row mb-3">
				<div class="col-12" align="right">
					<div class="col-3">
						<select name="orderCondition" id="orderCondition" class="form-control list_select" onchange="orderFunction()">
							<option value=""> - 정렬기준 - </option>
							<option value="best" <c:if test="${pageVO.orderCondition eq 'best'}">selected</c:if>> 인기경매순 </option>
							<option value="close" <c:if test="${pageVO.orderCondition eq 'close'}">selected</c:if>> 마감임박순  </option>
							<option value="recent" <c:if test="${pageVO.orderCondition eq 'recent'}">selected</c:if>> 최신등록순  </option>
							<option value="lowprice" <c:if test="${pageVO.orderCondition eq 'lowprice'}">selected</c:if>> 낮은가격순 </option>
							<option value="highprice" <c:if test="${pageVO.orderCondition eq 'highprice'}">selected</c:if>> 높은가격순 </option>
						</select>
					</div>
				</div>
			</div><!-- /.search -->
			<%-- <!-- 검색 -->
			<div  style="float: right"> 
					<label for="searchCondition" style="visibility:hidden;">choose</label>
					<select name="searchCondition" id="selectBox" class="form-group">
						<option value="title" label="title" <c:if test="${pageVO.searchCondition eq 'title'}">selected</c:if>/>
						<option value="name" label="name"  <c:if test="${pageVO.searchCondition eq 'name'}">selected</c:if>/>
					</select>
					<label for="searchKeyword" style="visibility:hidden;display:none;">keyword</label>
					<input name="searchKeyword" type="text" value="${pageVO.searchKeyword}"/>
					<a href="javascript:link_search()" class="btn btn-secondary" style="font-weight:bold;">search</a>   
			</div> --%>
			
			<div id="itemList" class="row">
			<c:forEach items="${itemList}" var="list">
				 <div class="col-lg-4 col-sm-6 portfolio-item" onclick=""> 
					<div class="card">
						<a href="#" class="item">
						 	<img class="card-img-top" src="http://placehold.it/700x400" alt="">
						  	<span class="item item-body">
						    	<span class="item-text item-title ">${list.auctitle}</span>
						  		<span class="item-text">
						  			<span class="item-left h6 c-black"><strong>₩ ${list.price }</strong></span>
					   				<span class="item-right">${list.sellername}</span>
						  		</span>		
							</span>   
						</a>
					   	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-4">입찰 : ${list.bids }</div>
					   		<div class="col-8">${list.sdate}~${list.edate }</div>
					  	</div>
					</div>
		      	</div>	<!-- /.list -->
			</c:forEach><!-- /list-foreach -->
	      	</div> <!-- /.row -->
	      	
	      	<!-- Pagination -->
	      	<div>
		      <ul class="pagination justify-content-center">
		        <li class="page-item">
		          <a class="page-link" href="#" aria-label="Previous">
		            <span aria-hidden="true">&laquo;</span>
		            <span class="sr-only">Previous</span>
		          </a>
		        </li>
		        <li class="page-item">
		          <a class="page-link" href="#">1</a>
		        </li>
		        <li class="page-item">
		          <a class="page-link" href="#">2</a>
		        </li>
		        <li class="page-item">
		          <a class="page-link" href="#">3</a>
		        </li>
		        <li class="page-item">
		          <a class="page-link" href="#" aria-label="Next">
		            <span aria-hidden="true">&raquo;</span>
		            <span class="sr-only">Next</span>
		          </a>
		        </li>
		      </ul>
	      	</div>
      	</div> <!-- /.listContainer -->

     

    </div><!-- /.container -->

    <!-- Footer -->
 
	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap3.3.7.min.js"></script>
</body>
</html>
