<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	/** QnA Css **/
	.kobayDetail_row{
		margin: 30px auto;
	}
	.kobayDetail_qnabox{
		width:100%;
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
		height:80px;
	}
</style>

<script>
	<%-- 질문 수정 --%>
	function kobayDetail_questionUpdate(unq){

		var params = $("#kobayDetail_qnaUpdate").serialize();
	
		$.ajax({
			type: 'POST',
			data: params,
			url: "<c:url value='/kobayDetail_updateQuestion'/>",
			dataType: "json",
			success: function(data) {
				if(data.vo == "success") {
					alert("수정되었습니다.");
					opener.parent.location.reload();
					self.close();
				} else {
					alert("다시 시도해 주세요.");	
				}
				
			},
			error: function(error) {
				alert("ersssror: "+error);
			}
			
		});
			
	}
</script>

</head>
<body>
	<form name="kobayDetail_qna" id="kobayDetail_qnaUpdate">
    	<!-- 질문 수정 창 -->			        	
		<div class="kobayDetail_qnabox">
			<table class="kobayDetail_answertxt">
				<tr>
					<td>
						<input type="hidden" name="memberUnq" value="1">
						<input type="hidden" name="auctionUnq" value="1">
						<input type="hidden" name="questionerUnq" value="4">
						<input type="hidden" name="qnaUnq" value="${vo.qnaUnq}"/>
						<textarea name="qnaContent" rows='5' class="kobayDetail_answertextarea"><c:choose><c:when test="${vo.delStatus eq 0}"><c:out value="${vo.qnaContent}"/></c:when></c:choose></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<c:choose>
						<c:when test="${vo.qnaSecret eq 0}">
							<input type="checkbox" name="qnaSecret" value="1"> 비밀글 &nbsp
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="qnaSecret" value="0" checked="checked"> 비밀글 &nbsp
						</c:otherwise>
						</c:choose>
						<input type="button" value="수정 하기" onclick="kobayDetail_questionUpdate(${vo.auctionUnq})">
					</td>
				</tr>
			</table>
		</div> <!-- end of kobayDetail_qnabox -->
	</form>
</body>
</html>