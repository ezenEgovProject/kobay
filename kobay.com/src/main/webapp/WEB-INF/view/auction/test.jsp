<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay 모두가 판매자이자 구매자이다.</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >
    
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<style>
		.kobayDetail_row{
			margin: 30px auto;
		}
		.kobayDetail_qnabox{
			width:80%;
			float:center;
			margin:auto;
		}
		.kobayDetail_answertxt{
			width:100%; 
			margin-bottom:1em;
		}
		.kobayDetail_answertxt td{
			text-align:right; 
			padding-bottom: 20px;
		}
		.kobayDetail_answertextarea{
			width:100%;
		}
		
		.kobayDetail_qnalist{
			width:80%;
			float:center;
			margin:auto;
		}
		.kobayDetail_question{
			width:100%;
			min-height:50px;	
		}
		.kobayDetail_question_name{
			padding-top:1em;
			text-align:left;
			border-top:1px solid #BDBDBD;	
		}
		.kobayDetail_question_date{
			padding-top:1em;
			text-align:right;
			border-top:1px solid #BDBDBD;	
		}
		.kobayDetail_question_content{
			padding-top:1em;
			text-align:left;
			padding-bottom:1em;
		}
		.kobayDetail_question_btn{
			padding-top:1em;
			padding-bottom:1em;
			text-align:right;
		}
		.kobayDetail_answertextarea{
			margin-top:1em;
			margin-bottom:0.3em;
		}
		blockquote{
			border-left: 5px solid #BDBDBD;
			padding-left:1em;
		}
	</style>
  </head>

  <body>
	<script>

		<%-- 답변 창 열기 시작 --%>
		
		$(document).ready(function(){
			$("div#kobayDetail_answer_textarea").hide();
		});
		$(document).ready(function(){
			$("input#answer_btn").click(function(){
				if($("input#answer_btn").val()=="답변"){
					$("input#answer_btn").val("취소");
				} else {
					$("input#answer_btn").val("답변");
				}
				$("div#kobayDetail_answer_textarea").toggle();
			});
		});
		
		<%-- 답변 창 열기 끝 --%>
		
		<%-- 질문 입력 시작 --%>
		function kobayDetail_questionInsert(){
			var params =  $("#kobayDetail_qna").serialize();
			
			alert(params);
			
			$.ajax({
				type: 'POST',
				data: params,
				url: "<c:url value='/kobayDetail_insertQuestion'/>",
				dataType: "json",
				success: function(data) {
					if(data.qnaResult == "success") {
						alert("질문이 등록되었습니다.");
						self.location.reload();
					} else {
						alert("다시 시도해 주세요.");	
					}
					
				},
				error: function(error) {
					alert("ersssror: "+error);
				}
				
			});
				
		}
		
		<%-- 질문 입력 끝--%>
	</script>
    
	<div class="kobayDetail_row">
	
	
	<h1> 경매 참여 완료 </h1>
	
	<form name="kobayDetail_qna" id="kobayDetail_qna">
		<div class="kobayDetail_qnabox">
			<table class="kobayDetail_answertxt">
				<tr>
					<td>
						<input type="hidden" name="member_unq" value="1">
						<input type="hidden" name="auction_unq" value="1">
						<input type="hidden" name="questioner_unq" value="4">
						
						<textarea name="question_content" rows='5' class="kobayDetail_answertextarea">
						</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="question_secret" value="1"> 비밀글 &nbsp
						<input type="button" value="문의 하기" onclick="kobayDetail_questionInsert()">
					</td>
				</tr>
			</table>
		</div>
		
		<div class="kobayDetail_qnalist">
		
		<!-- 일반 회원이 보는 화면 시작 -->
			<table class="kobayDetail_question">
				<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">
					<tr>
						<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerUnq}"/></td>
						<td class="kobayDetail_question_date"><c:out value="${qnalist.questionDate}"/></td>
					</tr>
					<tr>
						<td colspan="2" class="kobayDetail_question_content">
							<c:out value="${qnalist.questionContent}"/>
						</td>
					</tr>

				</c:forEach>
					<tr>
						<td class="kobayDetail_question_name">└[답변] 답변자 이름</td>
						<td class="kobayDetail_question_date">2017.09.30</td>
					</tr>
					<tr>
						<td colspan="2" class="kobayDetail_question_content">
							<blockquote>
							답변내용 
							</blockquote>
						</td>
					</tr>
			</table>
		<!-- 일반 회원이 보는 화면 끝 -->
		
		<!-- 경매등록 회원이 보는 화면 시작  -->
			<table class="kobayDetail_question">
				<tr>
					<td class="kobayDetail_question_name">[질문] 질문자 이름</td>
					<td class="kobayDetail_question_date">2017.09.30</td>
				</tr>
				<tr>
					<td colspan="2" class="kobayDetail_question_content">
						경매 등록 회원이 보는 답변 목록
					</td>
				</tr>
				<tr>
					<td colspan="2" class="kobayDetail_question_btn">
						<input type="button" value="답변" id="answer_btn">
						<div id="kobayDetail_answer_textarea">
							<textarea rows='5' class="kobayDetail_answertextarea">
							</textarea>
							<input type="button" value="답변 하기">
						</div>
							
					</td>
				</tr>
			</table>
		
		<!-- 경매등록 회원이 보는 화면 끝  -->	
		
		
		</div>
	</form>	

	</div><!-- end of kobayDetail_row -->

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
