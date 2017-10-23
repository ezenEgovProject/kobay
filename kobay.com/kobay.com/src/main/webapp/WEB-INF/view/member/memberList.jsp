<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="utf-8">
	<head>
	<!-- <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay 회원 관리</title>

    Bootstrap core CSS
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    Custom styles for this template
    <link rel="stylesheet" href="../../../css/kobay.css" >
	</head>
	<script src="../../../../vendor/jquery/jquery.js"></script>
	<script src="../../../../vendor/jquery/jquery.min.js"></script> -->
 	<body>
    <!-- Navigation -->
   
    <!-- Page Content -->
	<div class="container">
		<table>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>가입 날짜</th>
			</tr>
			<c:forEach var="rs" items="${memberList}" varStatus="status">
				<tr>
					<td>${number}</td>
					<td><a href="#">${rs.memberId}</a></td>
					<td>${rs.memberName}</td>
					<td>${rs.memberRdate}</td>
				</tr>
				<c:set var="number" value="${number-1}" />
			</c:forEach>
		</table>
	</div>
    <!-- /.Page Content -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>
