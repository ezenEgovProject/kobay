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
/* 회원가입 폼에 있는 인풋 id 또는 name */
var regList = ["memberId","memberPwd","memberName","memberPhone"];
/*  */
/* 로그인 */
function member_Login() {
	var frm = $("#loginForm").serialize();
	
	  $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/login' />",
		dataType:"json",
		success:function(data) {
			if(data.result == "ok") {
				alert("로그인 되었습니다.");
				location.href="<c:url value='/main' />";
			} else{
				alert("다시 확인해주세요.");
			}
		},
		error:function(error) {
			alert("error : " + error);
		}
	}); 
}
/*  */
/* 회원가입 */
function member_Register() {
	var frm = $("#regForm").serialize();
	
	   $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/register' />",
		dataType:"json",
		async: false,
		success:function(data) {
			if(data.result == "ok") { /* 성공 */
				alert("가입되었습니다.");
				location.href="<c:url value='/loginreg' />";
			}
			else if(data.result == "exists") { /* 존재하는 아이디 */
				$("#regForm i[id='icon_memberId']").attr("class","fa fa-ban");
				$("#regForm i[id='icon_memberId']").css({
					 "color":"#FF0000"
					});
				alert("해당 아이디가 이미 존재합니다.");
			}
			else{
				alert("다시 확인해주세요.");
				for(var i=0; i<data.errors.length; i++) { /* 유효성검사에 따른 v 또는 x 체크 */
					$("#regForm i[id='icon_"+data.errors[i].field+"']").attr("class","fa fa-ban");
					$("#regForm i[id='icon_"+data.errors[i].field+"']").css({
						 "color":"#FF0000"
						});
				}  
			}
			return false;
		},
		error:function(error) {
			alert("error : " + error);
			return false;
		}
	});
}
/*  */
/* 유효성 온체인지로 체크 */
function member_CheckForm(va) {
		var frm = $("#regForm").serialize();
		
		  $.ajax({
			type:'POST',
			data:frm,
			url:"<c:url value='/checkform' />",
			dataType:"json",
			success:function(data) {
				if(data.result == "ok") 
				{	/* 전부 사용 가능 아이디는 밑에서 체크 */
					$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-check");
					$("#regForm i[id='icon_"+va+"']").css({"color":"#1DDB16"});
				}
				else
				{
					for(var i=0; i<regList.length; i++)
					{ /* 일단 전부 v체크 후 밑에서 x로 바꿈 */
						$("#regForm i[id='icon_"+regList[i]+"']").attr("class","fa fa-check");
						$("#regForm i[id='icon_"+regList[i]+"']").css({"color":"#1DDB16"});
					}
					for(var i=0; i<data.errors.length; i++) 
					{ /* 유효성검사에 따른 x 체크 */
						$("#regForm i[id='icon_"+data.errors[i].field+"']").attr("class","fa fa-ban");
						$("#regForm i[id='icon_"+data.errors[i].field+"']").css({"color":"#FF0000"});
					}
				} 
				if(data.checkResult == "exists") 
				{
					$("#regForm i[id='icon_memberId']").attr("class","fa fa-ban");
					$("#regForm i[id='icon_memberId']").css({"color":"#FF0000"});
				}
				return false;
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
		<!-- 로그인 부분 -->
		<div class="member-margin-settings">
		<h2>
			<label for="loginTitle" class="title-margin-settings">로그인</label>
		</h2>
		<form:form commandName="loginForm" name="loginForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="memberId" name="memberId" class="form-control" placeholder="ex) example@example.com" />
			</div>				
			<div class="form-group">
				<form:label path="memberPwd" class="col-sm-2 control-label">
					비밀번호
				</form:label>
				<form:password path="memberPwd" name="memberPwd"  class="form-control" placeholder="비밀번호 8자리 이상" />
			</div>
			<div class="form-group">
			    <div class="member-align">
					<form:button class="btn btn-primary btn-lg" onclick="member_Login()">로그인</form:button>
				</div>
			</div>
		</form:form>
		</div>
		<!--  -->
		<!-- 아이디/비밀번호 찾기 -->
		<p class="p-margin-settings"><a href="/lost">아이디/비밀번호 찾기</a></p>
		<!--  -->
		<!-- 회원가입 부분 -->
		<div class="member-margin-settings">
		<h2>
			<label for="regTitle" class="title-margin-settings">회원가입</label>
		</h2>
		<form:form commandName="regForm" name="regForm" class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일<i class="fa fa" id="icon_memberId" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="memberId" class="form-control"  placeholder="ex) example@example.com" onchange="member_CheckForm('memberId')" />
			 </div>	
			<div class="form-group">
				<form:label path="memberPwd" class="col-sm-2 control-label">
					비밀번호<i class="fa fa" id="icon_memberPwd" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:password path="memberPwd" class="form-control" placeholder="비밀번호 8자리 이상" onchange="member_CheckForm('memberPwd')" />
			</div>					
			<div class="form-group">
				<form:label path="memberName" class="col-sm-2 control-label">
					이름<i class="fa fa" id="icon_memberName" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="memberName"  class="form-control" placeholder="ex) 홍길동" onchange="member_CheckForm('memberName')" />
			</div>
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호<i class="fa fa" id="icon_memberPhone" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="memberPhone" class="form-control" placeholder="ex) 010-1234-5678" onchange="member_CheckForm('memberPhone')" />
				<br>
				</div>				
			<div class="form-group">
			    <div class="member-align">
					<form:button class="btn btn-primary btn-lg" onclick="member_Register()">가입</form:button>
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