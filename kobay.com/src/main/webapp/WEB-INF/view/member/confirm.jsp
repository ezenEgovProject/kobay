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
	<link rel="stylesheet" type="text/css" href="../../../css/member.css">
  </head>
<script type="text/javascript">
var regList = ["memberId","memberPwd","memberName","memberPhone"];
/* 회원정보 수정 전 비밀번호 체크 */
function member_confirm() {
	var frm = $("#confirmForm").serialize();
	
	  $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/confirmid' />",
		dataType:"json",
		success:function(data) {
			if(data.result == "ok") {
				alert("확인되었습니다");
				location.href="<c:url value='/profile' />";
			} else {
				alert("다시 확인해주세요.");
			}
		},
		error:function(error) {
			alert("error : " + error);
		}
	}); 
}
/*  */
</script>

<body>
    
    <!-- Page Content -->
    <div class="container">
		<!-- 비밀번호 확인 부분 -->
		<div class="table-margin-settings">
		<h2>
			<label for="confirmTitle" class="title-margin-settings">비밀번호 확인</label>
		</h2>
		<form:form commandName="confirmForm" name="confirmForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="memberId" name="memberId" class="form-control" value="${sessionScope.id}" readonly="true" />
			</div>				
			<div class="form-group">
				<form:label path="memberPwd" class="col-sm-2 control-label">
					비밀번호
				</form:label>
				<form:password path="memberPwd" name="memberPwd"  class="form-control" placeholder="비밀번호 8자리 이상" />
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_confirm()">확인</form:button>
				</div>
			</div>			
		</form:form>
		</div>
		<!--  -->
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>