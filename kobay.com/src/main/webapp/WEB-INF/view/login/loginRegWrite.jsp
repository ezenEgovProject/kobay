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

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
  </head>
<script type="text/javascript">
var checkId = "";
var checkPwd = "";
var checkName = "";
var checkPhone = "";
/* var checkAll = "";
if(checkId == true &&
		checkPwd == true &&
		checkName == true &&
		checkPhone == true) {
	checkAll = true;
} */
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
			if(data.result == "ok") {
				alert("가입되었습니다.");
				// location.href="<c:url value='/loginreg' />";
			} else{
				alert("다시 한번 확인해주세요.");
				for(var i=0; i<data.errors.length; i++) {
					alert(data.errors[i].field + ": " + data.errors[i].defaultMessage);
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
/* 아이디 체크 */
function member_CheckForm(va) {
		var frm = $("#regForm").serialize();
		
		  $.ajax({
			type:'POST',
			data:frm,
			url:"<c:url value='/checkform' />",
			dataType:"json",
			success:function(data) {
				if(data.result == "ok") {
					$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-check");
					$("#regForm i[id='icon_"+va+"']").css({
						 "color":"#1DDB16"
						});
				//	checkAll = true;
				} else {
					for(var i=0; i<data.errors.length; i++) {
						if(data.errors[i].field == va) {
						$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-ban");
						$("#regForm i[id='icon_"+va+"']").css({
							 "color":"#FF0000"
							});
						return;
						} else {
						$("#regForm i[id='icon_"+va+"']").attr("class","fa fa-check");
						$("#regForm i[id='icon_"+va+"']").css({
							 "color":"#1DDB16"
							});
						} 
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
/* 텍스트박스에서 엔터 누르고 로그인 */
function loginEnter() {
	if(event.keyCode==13) {
		member_Login();	
	}
}
/*  */
/* 텍스트박스에서 엔터 누르고 회원가입*/
function regEnter() {
	if(event.keyCode==13) {
		member_Register();	
	}
}
/*  */
</script>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
		<div class="container" style="width: 100%;">
			<div class="row justify-content-between align-items-center" style="width: 100%;">
				<div class="col-12 col-sm-auto order-sm-1 text-center">
					<a class="navbar-brand" href="index.jsp"><label class="logo">Kobay</label></a>
				</div>
				<div class="col-4 order-sm-2">
				    <div class="input-group">
				      <span class="input-group-btn">
				        <button class="btn search-btn" type="button"><i class="fa fa-search fa-lg" style="color: #0080ff"></i></button>
				      </span>
				      <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요.">
				    </div><!-- /input-group -->
			  	</div>
				<div class="col-6 col-sm-auto order-sm-3" >
					 <span class="top-icon"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
					 <span class="top-icon"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
				</div>
			</div>
			
		</div> 
	<!-- /.navbar-top -->
   
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-light subnav">
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
          	<li class="nav-item px-lg-4 active">
              <a class="nav-link" href="/main">홈</a>
            </li>
          	<li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  회사소개
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/intro">KOBAY 소개</a>
                <a class="dropdown-item" href="#">경매방법</a>
                <a class="dropdown-item" href="#">문의사항</a>
              </div>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">진행경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">예정경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">마감경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">이벤트</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
		<!-- 로그인 부분 -->
		<h2>
			<label for="loginTitle">로그인</label>
		</h2>
		<form:form commandName="loginForm" name="loginForm"  class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="member_id" class="col-sm-2 control-label">
					이메일
				</form:label>
				<form:input path="member_id" name="member_id" class="form-control" placeholder="example@example.com" onkeypress="loginEnter()" />
			</div>				
			<div class="form-group">
				<form:label path="member_pwd" class="col-sm-2 control-label">
					비밀번호
				</form:label>
				<form:password path="member_pwd" name="member_pwd"  class="form-control" placeholder="비밀번호 8자리 이상" onkeypress="loginEnter()" />
			</div>
			<div class="form-group">
				<form:label path="member_id">
					<form:checkbox path="member_id" value="remember_ID" /> 아이디 저장
				</form:label>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-primary btn-lg" onclick="member_Login()">로그인</button>
				</div>
			</div>			
		</form:form>
		<!--  -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<!-- 회원가입 부분 -->	
		<h2>
			<label for="regTitle">회원가입</label>
		</h2>
		<form:form commandName="regForm" name="regForm" class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<form:label path="member_id" class="col-sm-2 control-label">
					이메일<i class="fa fa" id="icon_member_id" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="member_id" class="form-control"  placeholder="example@example.com" onchange="member_CheckForm('member_id')" onkeypress="regEnter()" />
				<!-- <button type="button" class="btn btn-default btn-sm" onclick="member_IdButton()" >아이디 중복 체크</button> -->
			 </div>	
			<div class="form-group">
				<form:label path="member_pwd" class="col-sm-2 control-label">
					비밀번호<i class="fa fa" id="icon_member_pwd" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:password path="member_pwd" class="form-control" placeholder="비밀번호 8자리 이상" onchange="member_CheckForm('member_pwd')" onkeypress="regEnter()" />
			</div>					
			<div class="form-group">
				<form:label path="member_name" class="col-sm-2 control-label">
					이름<i class="fa fa" id="icon_member_name" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="member_name"  class="form-control" placeholder="홍길동" onchange="member_CheckForm('member_name')" onkeypress="regEnter()" />
			</div>
			<div class="form-group">
				<form:label path="member_phone" class="col-sm-2 control-label">
					핸드폰 번호<i class="fa fa" id="icon_member_phone" aria-hidden="true" style="color:#1DDB16;"></i>
				</form:label>
				<form:input path="member_phone" class="form-control" placeholder="숫자만 입력" onchange="member_CheckForm('member_phone')" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;' maxlength="11" onkeypress="regEnter()" />
				<br>
				<form:errors path="member_phone" cssStyle="color:red;" />
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