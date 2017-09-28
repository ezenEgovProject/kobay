<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
function fn_go(a){
	var f=document.hiddenFrm;
	f.member_unq.value=a;
	f.submit();	
}
</script>
<body>
<table border="1"  width="600">
<tr>
	<th width="20%" align="center">경매 이름</th>
	<th width="20%" align="center">현재 가격</th> 
	<th width="30%" align="center">남은 시간</th>
</tr>
<c:forEach var="result" items="${resultList}" varStatus="status">
	<tr>
		<td align="center">${result.title}</td>
		<td align="center">
		<a href="#" onclick="fn_go('${result.unq}')">
		${result.sprice}</a></td>	
		<td align="center">${result.sdate}</td>	
	</tr>			
</c:forEach>
</table>
<form name="hiddenFrm" method="post" action="<c:url value='/list_1_1'/>">
<input type="hidden" name="member_unq" id="member_unq"/>
</form>
</body>
</html>