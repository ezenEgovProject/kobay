<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="utf-8">
<script type="text/javascript">
var isLogin = "<%=(String) session.getAttribute("name")%>";
function fn_logout() {
	var returnValue = confirm("로그아웃 하시겠습니까?");
	if(returnValue) {
		location.href= "<c:url value='/logout' />";
		alert("로그아웃 되었습니다.");
	} else {
		return;
	}
}
</script>
<script type="text/javascript">
function searchFocus() {
	var searchInput = document.getElementById("searchContent");
	var searchButton = document.getElementById("searchBtn");
	
	searchInput.onkeydown = function (e) {
	    if (e.keyCode == 13) {
	    	goSearch();
	    }
	}

}
function goSearch() {
	var searchValue = document.getElementById("searchContent").value;
	var params = encodeURI("search_content=" + searchValue);
	
	if(searchValue == "") {
		alert("검색어를 입력해주세요.")
		return ;
	}
	location.href = "<c:url value='/search?" + params +"'/>";
}
</script>

<%-- 상단 고정메뉴 --%> 
<nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
	<div class="container">
		<div class="row justify-content-between align-items-center" style="width:100%;">
			<div class="col-4 order-sm-1" align="left">
				<a class="navbar-brand" href="/main"><img src="../images/kobay_logo.png" style="height: 35px;"/></a>
			</div>
			<div class="col-4 order-sm-2">
			    <div class="input-group">
			    	<span class="input-group-btn">
				       	<a id="searchBtn" class="btn search-btn" href="javascript:goSearch()"><i class="fa fa-search fa-lg" style="color: #0080ff"></i></a>
			        </span>
			  		<input id="searchContent" onfocus="searchFocus()" type="text" class="form-control search-input" 
			  				placeholder="검색어를 입력하세요." value ="${searchVO.searchKeyword}">
				</div><!-- /.input-group -->
			</div>
			<div class="col-4 order-sm-3 pr-0" align="right">
				<c:choose>
					<c:when test="${sessionScope.id  != null}">
						 <span class="top-icon"><a href="/confirm"><font style="color:white;">${sessionScope.name}님</font></a></span>
						 <span class="top-icon"><a href="javascript:fn_logout()"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></a></span>
						 <span class="top-icon"><a href="/write"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></a></span>
					</c:when>
					<c:otherwise>
						<span class="top-icon"><font style="color:white;">로그인 해주세요</font></span>
						<span class="top-icon"><a href="/loginreg"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></a></span>
					</c:otherwise>
				</c:choose>
			</div>
		</div> <!-- /.row -->
	</div> <!-- /.container -->
</nav>
<!-- /.navbar-top -->

				