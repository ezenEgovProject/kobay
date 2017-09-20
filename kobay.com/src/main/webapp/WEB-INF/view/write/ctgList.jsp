<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_popup(){
	var f = document.listFrm;
	var url = "/ctgRegPop.do";
	
	window.open(url,"ctgReg","width=500,height=300,resizable=yes,left=500,top=200");

	f.target = "ctgReg";
	f.action = url;    
	f.method = "post";
	f.submit();
}

function fn_list(cd) {
	var f = document.listFrm;
	var url = "/ctgList.do";

	f.srchContn.value = "hctgcd";
	f.srchKeywd.value = cd;

	f.target = "";
	f.action = url;    
	f.method = "post";
	f.submit();
}

function fn_detail(cd) {
	var f = document.listFrm;
	var url = "/ctgModPop.do";

	window.open(url,"ctgReg","width=500,height=300,resizable=yes,left=500,top=200");

	f.ctgcd.value = cd;
	f.action = url; 
	f.target = "ctgReg";
	f.method = "post";
	f.submit();
}

</script>

<body>
<form name="listFrm" id="listFrm">
<input type="hidden" name="ctgcd" id="ctgcd"/>
<table border="0" width="800">
	<tr>
		<td align="left">
검색 : 	<select name="srchContn" style="height:25px;">
			<option value="hctgcd" <c:if test="${srchContn == 'hctgcd'}">selected</c:if>>분류코드</option>
			<option value="ctgnm" <c:if test="${srchContn == 'ctgnm'}">selected</c:if>>분류이름</option>
			<option value="use" <c:if test="${srchContn == 'use'}">selected</c:if>>사용여부</option>
		</select> 
		<input type="text" name="srchKeywd" value="${srchKeywd}"  style="height:20px;"/>
		<input type="submit" value="검색" style="height:26px;"/>
		</td>
	</tr>
	<tr>
		<td align="right">
		<input type="button" value="목록" onclick="location.href='/ctgList.do'"/>
		<input type="button" value="카테고리등록" onclick="fn_popup()">
		</td>
	</tr>
</table>
<table border="1" width="800">
	<caption>카테고리 목록</caption>
	<colgroup>
		<col width="5%"></col>
		<col width="15%"></col>
		<col width="15%"></col>
		<col width="*"></col>
		<col width="10%"></col>
		<col width="10%"></col>
	</colgroup>
	<tr>
		<th>번호</th>
		<th>분류</th>
		<th>코드</th>
		<th>카테고리명</th>
		<th>사용<br>여부</th>
		<th>상세<br>보기</th>
	</tr>
	<c:forEach var="rs" items="${rslist}" varStatus="status">
		<tr align="center">
			<td>${status.count}</td>
			<td>
			<c:if test="${fn:length(rs.ctgcd)==3}">대분류</c:if>
			<c:if test="${fn:length(rs.ctgcd)==5}">중분류</c:if>
			<c:if test="${fn:length(rs.ctgcd)==7}">소분류</c:if>
			</td>
			<td>${rs.ctgcd}</td>
			<td align="left">
		<c:if test="${fn:length(rs.ctgcd) == 7}">
			${rs.path}
		</c:if>
		<c:if test="${fn:length(rs.ctgcd) != 7}">
			<a href="#" onclick="fn_list('${rs.ctgcd}')">${rs.path}</a>
		</c:if>
			</td>
			<td>
		<c:if test="${rs.use == 'Y'}">사용</c:if>
		<c:if test="${rs.use == 'N'}">미사용</c:if>
			</td>
			<td><input type="button" value="수정" onclick="fn_detail('${rs.ctgcd}')"></td>
		</tr>
	</c:forEach>
	
</table>
</form>
</body>
</html>


