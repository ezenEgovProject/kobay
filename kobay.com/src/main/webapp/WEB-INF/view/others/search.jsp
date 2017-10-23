<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../css/search.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	$.ajaxSetup({ cache: false });
	
	$("#itemList").load("/itemList");
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
	// 페이지 로딩시 추가된 리스트는 reset
	$('div').remove('#additemList');
	
	var selectValue = document.getElementById("orderCondition").value;
	var params = "orderCondition=" + selectValue;
	
	$.ajax({
		type : 'POST',
		data : params,
		url : "<c:url value='/reOrderingList'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				$("#itemList").load("<c:url value='/itemList'/>");
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
	// 페이지 로딩시 추가된 리스트는 reset
	$('div').remove('#additemList');
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
					$("#itemList").load("/itemList");
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

<%-- 추가검색조건 --%>
<script>
function searchPrice() {
	var minprice = document.getElementById("minPrice").value;
	var maxprice = document.getElementById("maxPrice").value;
	if(minprice == "") {
		minprice = 0;
	}
	if(maxprice == "") {
		maxprice = 0;
	}
	var params = "minPrice=" + minprice 
				+ "&maxPrice=" + maxprice;
	$.ajax({
		type : "POST",
		data : params,
		url : "<c:url value='/priceRange'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				$("#itemList").load("/itemList");
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

function searchInnerKeyword() {
	var innerKeyword = document.getElementById("innerKeyword").value;
	var params = "innerKeyword=" + innerKeyword;
	$.ajax({
		type : "POST",
		data : params,
		url : "<c:url value='/innerKeywordSearch'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				$("#itemList").load("/itemList");
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


function otherCondition(v) {
	var id = v.getAttribute("id");
	var params ="";
	var isChecked = $('input:checkbox[id="'+id+'"]').is(":checked");
	if(isChecked){
		if(id == "contact" || id == "free") {
			if(id == "contact") { document.getElementById('free').checked = false; }	
			else{ document.getElementById('contact').checked = false; }
			params = "deliveryWay=" + id;
		}	
		else{
			if(id == "progress") { document.getElementById('expect').checked = false; } 
			else { document.getElementById('progress').checked = false; }
			params = "aucStatus=" + id;
		}	
	} else {
		if(id == "contact" || id == "free") { params = "deliveryWay="; } 
		else { params = "aucStatus="; }
	}
	 $.ajax({
		type : "POST",
		data : params,
		url : "<c:url value='/otherConditionSearch'/>",
		dataType : "json",
		success : function(data) {
			if(data.result == "success") {
				$("#itemList").load("/itemList");
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

<%-- 페이지 스크롤 시 리스트 추가 --%>
<script>
$(window).scroll(function(event) { 
	
	var scrollTop = Math.max($(window).scrollTop());
	var windowHeight = Math.max($(window).height());
	var documentHeight = Math.max($(document).height());
	
	console.log(scrollTop +windowHeight);
	console.log(documentHeight);
	
	if (Math.ceil(scrollTop + windowHeight) == documentHeight) { // 스크롤 바가 맨 밑에 위치한다면
		//alert ("끝까지 확인함!!");
		// 리스트 갯수 넘겨주기
		
		var params = "pageIndex=" + (listCount+1);
		$.ajax({
			type : 'POST',
			data : params,
			url : "<c:url value='/addItemList'/>",
			dataType : "json",
			success : function(data) {
				if(data.result == "success") {	
					var div = document.createElement('div');
					$(div).load("/itemList");
					div.id = "additemList";
					div.className="row";
					div.innerHTML = document.getElementById('item').innerHTML;
			        document.getElementById('listContainer').appendChild(div);  
					return false;
				}
				else if(data.result == "noMoreList") {
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
});

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
									<span><input type="text" size="7" class="form-control input-style" id="minPrice"> </span>
									<span id="dash" class="px-1"> ~ </span>
									<span><input type="text" size="7" class="form-control input-style" id="maxPrice"></span>
									<span style="margin: 5px"><input type="button" class="form-control input-style" value="가격검색" onClick="searchPrice()"></span>
								</div>
					 		</form>
					 		<span id="space" class="px-2"></span>
			 				<form class="form-inline" role="form">
					 			<div class="form-group row card-text-normal" style="font-weight: normal;">
					 				<!-- <label for="sprice">가격</label> -->
									<span><input type="text" size="16" class="form-control input-style" id="innerKeyword"> </span>
									<span class="px-1"><input type="button" class="form-control input-style" value="결과내 재검색" onclick="searchInnerKeyword()"></span>
								</div>
					 		</form>
					 		<span id="space" class="px-2"></span>
					 		<form class="form-inline " role="form">
					 			<div class="form-group row card-text-normal">
									<input type="checkbox" id="contact" onclick="otherCondition(this)"/>
									<label for="contact" class="label-small">직접수령</label>
								</div>
								<div class="form-group row card-text-normal">
									<input type="checkbox" id="free" onclick="otherCondition(this)"/>
									<label for="free" class="label-small">무료배송</label>
								</div>
								<span id="dash" class="px-3"> / </span>
								<div class="form-group row card-text-normal">
									<input type="checkbox" id="progress" onclick="otherCondition(this)"/>
									<label for="progress" class="label-small">진행경매</label>
								</div>
								<div class="form-group row card-text-normal">
									<input type="checkbox" id="expect" onclick="otherCondition(this)"/>
									<label for="expect" class="label-small">예정경매</label>
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
		
			<div id="itemList" class="row">
			<%-- list.jsp import --%>
			</div>
      	</div> <!-- /.listContainer -->
    </div><!-- /.container -->

    <!-- Footer -->
 
	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap3.3.7.min.js"></script>
</body>

