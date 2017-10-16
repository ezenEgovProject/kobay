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

    <title>Kobay 로그인 및 회원가입</title>

    Bootstrap core CSS
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    Custom styles for this template
    <link rel="stylesheet" href="../../../css/kobay.css" > -->
  </head>
<script type="text/javascript">
/* 아이디 찾기 */
function member_Find(va) {
	var frm = $("#"+va).serialize();
	var popTitle = "popUp";

	  $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/find' />",
		dataType:"json",
		success:function(data) {
			if(data.result == "ok") {
				alert("found " + va);
					
				if(va == "findIdForm")
				{	
					var formData = document.findIdForm;
					formData.action = "/foundid";
				}
				else
				{
					var formData = document.findPwdForm;
					formData.action = "/foundpwd";
				}

					formData.target = popTitle;
					window.open("/foundid",popTitle,"width=500, height=500");
					alert("idForm");

					/* window.open("/foundpwd",popTitle,"width=300, height=200, left=0, top=0, toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no");
					alert("pwdForm"); */

				formData.submit();
				alert("submit");
			}
			else {
				alert("일치하는 정보가 없습니다.");
			}
		},
		error:function(error) {
			alert("일치하는 정보가 없습니다.");
		}
	}); 
}
/*  */
</script>
<body>
    <!-- Page Content -->
    <div class="container">
		<!-- 아이디 찾기 -->
		<h2>
			<label for="findIdTitle">아이디 찾기</label>
		</h2>
		<form:form commandName="findIdForm" name="findIdForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberName" class="col-sm-2 control-label">
					이름
				</form:label>
				<form:input path="memberName" name="memberName" class="form-control" />
			</div>				
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호
				</form:label>
				<form:input path="memberPhone" name="memberPhone"  class="form-control" />
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Find('findIdForm')">아이디 찾기</form:button>
				</div>
			</div>			
		</form:form>
		<!--  -->
		<!-- 아이디 찾기 -->
		<h2>
			<label for="findPwdTitle">비밀번호 찾기</label>
		</h2>
		<form:form commandName="findPwdForm" name="findPwdForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="memberId" name="memberId" class="form-control" />
			</div>				
			<div class="form-group">
				<form:label path="memberName" class="col-sm-2 control-label">
					이름
				</form:label>
				<form:input path="memberName" name="memberName" class="form-control" />
			</div>				
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호
				</form:label>
				<form:input path="memberPhone" name="memberPhone"  class="form-control" />
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Find('findPwdForm')">비밀번호 찾기</form:button>
				</div>
			</div>			
		</form:form>
		<!--  -->
	</div>
	<a href="/loginreg">로그인 및 회원가입 페이지로</a>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>