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
var editList = ["memberId","memberPwd","memberName","memberPhone"];
/* 회원정보 수정 */
function member_Update() {
	var frm = $("#editForm").serialize();
	
	   $.ajax({
		type:'POST',
		data:frm,
		url:"<c:url value='/edit' />",
		dataType:"json",
		async: false,
		success:function(data) {
			if(data.result == "ok") {
				alert("수정되었습니다.\n다시 로그인해주세요.");
				location.href="<c:url value='/logout' />";
			}
			else{
				alert("다시 확인해주세요.");
				for(var i=0; i<data.errors.length; i++) {
					$("#editForm i[id='icon_"+data.errors[i].field+"']").attr("class","fa fa-ban");
					$("#editForm i[id='icon_"+data.errors[i].field+"']").css({
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
		var frm = $("#editForm").serialize();
		
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
								$("#editForm i[id='icon_"+va+"']").attr("class","fa fa-ban");
								$("#editForm i[id='icon_"+va+"']").css({"color":"#FF0000"});
								return;
							}							
							else 
							{
								$("#editForm i[id='icon_"+va+"']").attr("class","fa fa-check");
								$("#editForm i[id='icon_"+va+"']").css({"color":"#1DDB16"});
							}
						}
					}
				}
				else 
				{
					for(var i=0; i<editList.length; i++)
					{
						$("#editForm i[id='icon_"+editList[i]+"']").attr("class","fa fa-check");
						$("#editForm i[id='icon_"+editList[i]+"']").css({"color":"#1DDB16"});
					}
				} 
				return false;
			},
			error:function(error) {
				alert("error : " + error);
			}
		}); 
}
</script>

<body>
    
    <!-- Page Content -->
    <div class="container">
		<!-- 수정 부분 -->
		<h2>
			<label for="editTitle">회원 수정</label>
		</h2>
		<form:form commandName="editForm" name="editForm" class="form-horizontal" onsubmit="return false;">					
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일<i class="fa fa-check" id="icon_memberId" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="memberId" class="form-control" value="${vo.memberId}" onchange="member_CheckForm('memberId')" readonly="true" />
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
				<form:input path="memberName"  class="form-control" value="${vo.memberName}" placeholder="ex) 홍길동" onchange="member_CheckForm('memberName')" />
			</div>
			<div class="form-group">
				<form:label path="memberPhone" class="col-sm-2 control-label">
					핸드폰 번호<i class="fa fa" id="icon_memberPhone" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="memberPhone" class="form-control" value="${vo.memberPhone}" placeholder="ex) 010-1234-5678" onchange="member_CheckForm('memberPhone')" />
				<br>
				</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<form:button class="btn btn-primary btn-lg" onclick="member_Update()">수정</form:button>
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