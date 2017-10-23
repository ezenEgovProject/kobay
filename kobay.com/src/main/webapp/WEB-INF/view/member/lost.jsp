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
	<link rel="stylesheet" type="text/css" href="../../../css/member.css">
  </head>
<script type="text/javascript">
/* 아이디 찾기 */
function member_Find(va) {
	var frm = $("#"+va).serialize(); //폼 내용
	var popTitle = "popUp"; //팝업창 이름
	var link = ""; //팝업창 주소
	if(va == "findIdForm")
	{	//아이디 찾기일 경우
		var link = "/foundid";
		var formData = document.findIdForm;
	}
	else
	{	//비밀번호 찾기일 경우
		var link = "/foundpwd";
		var formData = document.findPwdForm;
	}					
	
	  $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/find' />",
		dataType:"json",
		success:function(data) {
			if(data.result == "ok") {
					formData.target = popTitle;
					formData.action = link;
					window.open(link,popTitle,"width=600, height=275"); //팝업창 실행
					formData.submit(); //팝업창으로 값 전송
					
					/* 부모창 값 초기화 */
					formData.memberId.value = "";
					formData.memberName.value = "";
					formData.memberPhone.value = "";
					/*  */
			}
			else {
				alert("일치하는 정보가 없습니다.");
				
				/* 부모창 값 초기화 */
				formData.memberId.value = "";
				formData.memberName.value = "";
				formData.memberPhone.value = "";
				/*  */
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
		<!-- 아이디 찾기 -->
		<div class="table-margin-settings">
		<h2>
			<label for="findIdTitle" class="title-margin-settings">아이디 찾기</label>
		</h2>
		<form:form commandName="findIdForm" name="findIdForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberName" class="col-sm-2 control-label">
					이름
				</form:label>
				<form:input path="memberName" name="memberName" class="form-control" placeholder="ex) 홍길동" />
			</div>				
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호
				</form:label>
				<form:input path="memberPhone" name="memberPhone" placeholder="ex) 010-1234-5678" class="form-control" />
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Find('findIdForm')">아이디 찾기</form:button>
				</div>
			</div>			
		</form:form>
		</div>
		<!--  -->
		<!-- 아이디 찾기 -->
		<div class="table-margin-settings">
		<h2>
			<label for="findPwdTitle" class="title-margin-settings">비밀번호 찾기</label>
		</h2>
		<form:form commandName="findPwdForm" name="findPwdForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="memberId" name="memberId" class="form-control" placeholder="ex) example@example.com"  />
			</div>
			<div class="form-group">
				<form:label path="memberName" class="col-sm-2 control-label">
					이름
				</form:label>
				<form:input path="memberName" name="memberName" class="form-control" placeholder="ex) 홍길동" />
			</div>
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호
				</form:label>
				<form:input path="memberPhone" name="memberPhone" placeholder="ex) 010-1234-5678" class="form-control" />
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Find('findPwdForm')">비밀번호 찾기</form:button>
				</div>
			</div>			
		</form:form>
		</div>
		<!--  -->
	</div>
	<div>
		<a href="/loginreg">로그인 및 회원가입 페이지로</a>
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