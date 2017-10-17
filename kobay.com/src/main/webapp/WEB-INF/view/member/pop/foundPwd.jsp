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
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay 로그인 및 회원가입</title>

    <link rel="stylesheet" type="text/css" href="../../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="../../../css/kobay.css" >
  </head>
<body onload="bankey()">
<%-- 상단 고정메뉴 --%> 
<nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
	<div class="container" style="width: 100%;">
		<div class="row justify-content-between align-items-center" style="width: 100%;">
			<div class="col-12 col-sm-auto order-sm-1 text-center">
				<a class="navbar-brand" href="/main"><label class="logo">Kobay</label></a>
			</div>
		</div> <!-- /.row -->
	</div> <!-- /.container -->
</nav>
<!-- /.navbar-top -->
    <!-- Page Content -->
<head>
    <style>    
    .found {
    	text-align : center;
    	margin-top:70px;
    }
    </style>
<body>
    <!-- Page Content -->
   	<div class="container">
		<div class="found">
			<div class="table-responsive">
				<table class="table">
		    		<tr>
						<td>회원님의 임시 비밀 번호는 <strong>${foundpwd}</strong>입니다.</td>
		    		</tr>
					<tr>
						<td><input type="button" value="닫기" onclick="self.close();"></td>
					</tr>
					<tr>
						<td><a href="" onclick="page()">로그인 및 회원가입 페이지로</a></td>
					</tr>
	    		</table>
	    	</div>
	    </div>
	</div>
	<script>
	function page() {self.close(); opener.location.href="/loginreg"}
	
	function bankey() {
	$(document).keydown(function(e) {
	    key = (e) ? e.keyCode : event.keyCode;
	     
	    var t = document.activeElement;
	     
	    if (key == 116 || key == 17 || key == 82) {
	            if (e) {
	                e.preventDefault();
	            } else {
	                event.keyCode = 0;
	                event.returnValue = false;
	            }
	    }
	});
	
	document.oncontextmenu = function(e){
		if(e){
			e.preventDefault();
		}
		else{
			event.keyCode = 0;
			event.returnValue = false;
		}
	}
	
}
	</script>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>