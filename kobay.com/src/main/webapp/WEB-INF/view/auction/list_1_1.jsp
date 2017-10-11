<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
<script>
function fn_go(a){
	var f=document.hiddenFrm;
	f.member_unq.value=a;
	f.submit();	
}
</script>
<body>
<table border="1"  style="width:600;">
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