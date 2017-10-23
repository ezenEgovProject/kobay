<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="post">
	<div>
		<h3> ${bid.auction_unq }입찰 금액 입력 </h3>
		<input type="text" name="bid_price" />
		<input type="button" onclick="bid('')">
	</div>
</form>

</body>
</html>


