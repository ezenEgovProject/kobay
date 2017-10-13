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
var regList = ["memberId","memberPwd","memberName","memberPhone"];

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
			if(data.result == "ok") {
				alert("가입되었습니다.");
				location.href="<c:url value='/loginreg' />";
			}
			else if(data.result == "exists") {
				$("#regForm i[id='icon_memberId']").attr("class","fa fa-ban");
				$("#regForm i[id='icon_memberId']").css({
					 "color":"#FF0000"
					});
				alert("해당 아이디가 이미 존재합니다.");
			}
			else{
				alert("다시 확인해주세요.");
				for(var i=0; i<data.errors.length; i++) {
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
				{
					if(data.errors.length > 0) 
					{
						for(var i=0; i<data.errors.length; i++) 
						{
							if(data.errors[i].field == va)
							{
								$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-ban");
								$("#regForm i[id='icon_"+va+"']").css({"color":"#FF0000"});
								return;
							}							
							else 
							{
								$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-check");
								$("#regForm i[id='icon_"+va+"']").css({"color":"#1DDB16"});
							}
						}
					}
				}
				else 
				{
					for(var i=0; i<regList.length; i++)
					{
						$("#regForm i[id='icon_"+regList[i]+"']").attr("class","fa fa-check");
						$("#regForm i[id='icon_"+regList[i]+"']").css({"color":"#1DDB16"});
					}
				} 
				if(data.checkResult == "exists" && data.checkResult != "ok") 
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
		<h2>
			<label for="loginTitle">로그인</label>
		</h2>
		<form:form commandName="loginForm" name="loginForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="memberId" name="memberId" class="form-control" placeholder="example@example.com" />
			</div>				
			<div class="form-group">
				<form:label path="memberPwd" class="col-sm-2 control-label">
					비밀번호
				</form:label>
				<form:password path="memberPwd" name="memberPwd"  class="form-control" placeholder="비밀번호 8자리 이상" />
			</div>
			<div class="form-group">
				<form:label path="memberId">
					<form:checkbox path="memberId" value="rememberId" /> 아이디 저장
				</form:label>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Login()">로그인</form:button>
				</div>
			</div>			
		</form:form>
		<!--  -->
		<!-- 아이디/비밀번호 찾기 -->
		<a href="/lost">아이디/비밀번호 찾기</a>
		<!--  -->
		<!-- 회원가입 부분 -->	
		<h2>
			<label for="regTitle">회원가입</label>
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
			    <div class="col-sm-offset-2 col-sm-10">
					<!-- <button type="button" class="btn btn-primary btn-lg" onclick="member_Register()">가입</button> -->
					<form:button class="btn btn-primary btn-lg" onclick="member_Register()">가입</form:button>
				</div>
			</div>
		</form:form>
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