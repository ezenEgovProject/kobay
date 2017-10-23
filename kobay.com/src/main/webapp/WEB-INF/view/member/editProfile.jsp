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
/* edit 폼에 있는 인풋 id 또는 name */
var editList = ["memberId","memberPwd","memberName","memberPhone"];
/*  */
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
			if(data.result == "ok") { /* 변경 성공 */
				alert("수정되었습니다.\n다시 로그인해주세요.");
				location.href="<c:url value='/logout' />";
			}
			else{
				alert("다시 확인해주세요.");
				for(var i=0; i<data.errors.length; i++) { /* 라벨 옆에 v 또는 x 표시 */
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
				{	/* 전부 사용 가능 */
					$("#editForm i[id='icon_"+va+"']").attr("class","fa fa-check");
					$("#editForm i[id='icon_"+va+"']").css({"color":"#1DDB16"});
				}
				else
				{
					for(var i=0; i<editList.length; i++)
					{ /* 일단 전부 v체크 후 밑에서 x로 바꿈 */
						$("#editForm i[id='icon_"+editList[i]+"']").attr("class","fa fa-check");
						$("#editForm i[id='icon_"+editList[i]+"']").css({"color":"#1DDB16"});
					}
					for(var i=0; i<data.errors.length; i++) 
					{ /* 유효성검사에 따른 x 체크 */
						$("#editForm i[id='icon_"+data.errors[i].field+"']").attr("class","fa fa-ban");
						$("#editForm i[id='icon_"+data.errors[i].field+"']").css({"color":"#FF0000"});
					}
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
		<!-- 수정 부분 -->
		<div class="table-margin-settings">
		<h2>
			<label for="editTitle" class="title-margin-settings">회원 수정</label>
		</h2>
		<form:form commandName="editForm" name="editForm" class="form-horizontal" onsubmit="return false;">					
			<div class="form-group">
				<form:label path="memberId" class="col-sm-2 control-label">
					이메일
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