<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../css/font.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
 body {
	font-size: .9rem; 
	font-family:"NanumGothic";
} 
label {
	margin-top: .5rem;
	margin-left: .3rem;
	margin-right: .3rem;
} 
a:link { text-decoration: none;}
a:visited {  text-decoration: none;}
a:hover { text-decoration: none; color:#007bff;}

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

.item-text-grey {
	color: #ddd;
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
.search > li {
	margin: 5px;
}
.strong {
	font-weight: bold;
}
.c-black {
	color: #000;
}
.c-kobay {
	color: #56B6E6;
}
.c-grey {
	color: #999;
}
</style>

<%-- 화면로드시 기본적으로 적용될 script --%>
<script type="text/javascript">
// mCategory toggle 상태 값
var isToggle = false;
// 현재 토글된 mCategory값
var curToggle;		
// lCategory 컬럼 사이즈
var listSize = ${listSize};

// mCategory를 숨기는 함수(toggle여부에 따름)
function mCtgHide() {
	//var listSize = ${listSize};
	for(var i = 1; i <= listSize; i++ ) {
		$("#collapse" + i).hide();
	}
}

// 화면로드 
$(document).ready(function () {
	$("#list").load("/itemList");
	mCtgHide();
	
	var list = ${lCtgCnt};
	for(var i = 0; i < list.length; i++) {
		document.getElementById("lcnt"+(i+1)).innerHTML = list[i];
	}
})

// 대분류 toggle icon 클릭이벤트 
function toggelClick(thisValue) {
	var id = thisValue.getAttribute("id");
	
	if(curToggle != id) {
		isToggle = false;
		for(var i = 1; i <= listSize; i++ ) {
			mCtgHide();
			$("#fa"+i).attr('class', 'fa fa-plus-circle');
		}
	}
	curToggle = id;			// 현재 토글된 카테고리 아이디값 저장
	isToggle = !isToggle;	// 토글 상태 변경
	
	// subCtg(mCtg)div id에 따라에 따라 다른 내용 보여줄것
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
    	for(var i = 1; i <= listSize; i++ ) {
			mCtgHide();
			$("#fa"+i).attr('class', 'fa fa-plus-circle');
		}
    } 
}
</script>

<%-- 정렬기준 script --%>
<script type="text/javascript">
function orderFunction() {
	var selectValue = document.getElementById("orderCondition").value;
	var params = "orderCondition=" + selectValue;
	$.ajax({
		type : 'POST',
		data : params,
		url : "<c:url value='/reOrderingList'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				$("#list").load("/itemList");
				//self.location.reload();
				return false;
			}
			else {
				self.location.reload();
			}
		},
		error : function(error) {
			alert("에러가 발생했습니다.");
		}
	});
}
</script>

<%-- 카테고리선택값 script --%>
<script type="text/javascript">
function fn_checkboxClick(value) {
	// check된  mCategory code값
	var id = value.getAttribute("id");
	// lCategory code값
	var lctg = id.substring(0,3);
	// checkCategory 배열
	var checkCtg = new Array();
	// mCategory 배열
	var mctgList = new Array();
	
	// 현재 체크된 카테고리갑 저장
	$("input:checkbox:checked").each(function() {
		var checkValue = $(this).val();
		if(!checkValue.match("category")) {
		 	mctgList.push(checkValue);
		 }
	})
	// mCategory클릭시 lCategory check상태 변경
	document.getElementById(lctg).checked = true;
	
	var params = "mCtgList="+mctgList;
	$.ajax({
		type : 'POST',
		data : params,
		url : "<c:url value='/reConditionalList'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				<%-- 카테고리 check 확인--%>
					for(var i = 0; i < listSize; i++) {
						var categoryName = "category" + (i+1);
						checkCtg[i] = $("input[name="+ categoryName +"]:checkbox:checked");
						
						if(checkCtg[i].length == 0 && categoryName == document.getElementById(lctg).value) {
							document.getElementById(lctg).checked = false;
						}	
					}
					$("#list").load("/itemList");
					return false;
				}
				else {
					alert("데이터를 로드할 수 없습니다.")
					location.reload();
				}
			},
			error : function(error) {
				console.log(error);
			}
	}); 
}
</script>

<body>
  	<!-- Page Content -->
	<div class="container" align="center">  
	<c:choose>
		<c:when test="${itemList.isEmpty()}">
			<div class="justify-content-center mt-2 mb-4">
				<div><img class="card-img-top" src="../../../images/null.png"  style="width: 30%;" alt=""></div>
				<div class="h6 strong"><span class="c-kobay h2">${searchVO.searchKeyword}</span>에 대한 검색 결과가 존재하지 않습니다.</div>
				<ul class="col-8 mt-3 mb-1 search">
					<li class="c-grey" style="display:inline-block;">
					·  상품명, 상표명 등의 검색어가 올바른지 확인해 보세요.</li>
					<li class="c-grey " style="display:inline-block;">· 검색어의 단어 수를 줄이거나 예술품, 컴퓨터와 같은 일반적인 단어로 검색해 보세요.</li>
				</ul>
			</div> 
			<div>
				<!-- 오눌 오픈한 경매 or 인기 경매 몇개만 보여주기  -->
			</div>
		</c:when>
		<c:otherwise>
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
									 			<input type="checkbox" id="${lList.ctgcd}" value="category${status.count}" />
									 			<label for="${lList.ctgcd}">${lList.ctgnm}<span id="lcnt${status.count}" class="badge"></span>
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
				 			
	   							<c:forEach items="${mList}" var="mList" varStatus="lCtgStatus">
	    							<c:set var="divId" value="collapse${lCtgStatus.count}"/>
	    							<div id="${divId}" role="tabpanel" aria-labelledby="headingOne" >
										<ul class="sub list-inline" style="margin:0px" >
											<c:forEach items='${mList}' var="mList" varStatus="status">
											<li class="text-left">
											<div>
												<input type="checkbox" name="category${lCtgStatus.count}" id="${mList.ctgcd}" value="${mList.ctgcd}" onclick="fn_checkboxClick(this)" />
												<label for="${mList.ctgcd}">${mList.ctgnm}</label><span class="badge">${mList.count}</span>
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
							<option value="best" <c:if test="${searchVO.orderCondition eq 'best'}">selected</c:if>> 인기경매순 </option>
							<option value="close" <c:if test="${searchVO.orderCondition eq 'close'}">selected</c:if>> 마감임박순  </option>
							<option value="recent" <c:if test="${searchVO.orderCondition eq 'recent'}">selected</c:if>> 최근경매순  </option>
							<option value="lowprice" <c:if test="${searchVO.orderCondition eq 'lowprice'}">selected</c:if>> 낮은가격순 </option>
							<option value="highprice" <c:if test="${searchVO.orderCondition eq 'highprice'}">selected</c:if>> 높은가격순 </option>
						</select>
					</div>
				</div>
			</div><!-- /.search -->
		
			<div id="list">
			<%-- list.jsp import --%>
			</div>
			
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
		</c:otherwise>
	</c:choose>
    </div><!-- /.container -->

    <!-- Footer -->
 
	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap3.3.7.min.js"></script>
</body>

