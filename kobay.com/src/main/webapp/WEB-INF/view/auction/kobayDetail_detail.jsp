<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="utf-8">
  <head>

    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <style>
    	.kobayDetail_row{
    		margin: 30px auto;
    	}
    	
    	.kobayDetail_info{
    		width: 100%;
    	}
    	.kobayDetail_info_left {
    		width:30%; 
    		height:300px; 
    		float:left;
    	}

    	.kobayDetail_info_imgtable{
    		width:100%;
    	}
    	.kobayDetail_info_mainimg{
    		height:200px; 
    		border: 1px solid #BDBDBD;
    		border-collapse:collapse;
    		text-align:center;    		
    	}
    	
    	.kobayDetail_info_mainimg img{
    		width:100%;
    		height:100%;
    	}
    	
    	.kobayDetail_info_subimg{
    		width:30%; 
    		height: 100px; 
    		border: 1px solid #BDBDBD;
    		border-collapse:collapse;
    		text-align:center;
    	}
    	
    	.kobayDetail_info_subimg img{
    		width:100%;
    		height:100%;
    	}
    	
    	.kobayDetail_info_rigth{
    		width:70%; 
    		height:300px; 
    		border: 1px solid #BDBDBD; 
    		padding: 1em;
    		float:right;
    		vertical-align:top;
    		text-align:left;
    	}
	
    	.kobayDetail_info_rightinfo{
    		width:100%;
    		min-height: 200px;
    	}
    	
    	.kobayDetail_bidStamp{
			width:200px; 
			height:100px; 
			font:12px; 
			color: blue; 
			font-weight:bold; 
			border:2px solid blue; 
			text-align:center; 
			padding-top:20px; 
			float:right;
		}
		
    	.kobayDetail_info_rightbtn{
    		width:100%;
    		margin-top:20px;
    	}
    	
    	.kobayDetail_bidbtn{
    		padding:0.6em;
    		float:right;
    	}
  		.kobayDetail_bidbtn2{
    		min-height:50px;
    		margin-left:20px;
    		padding:0.6em;
    		float:right;
    		background-color:#56B6E6;
    		color: white;
    		font:bold;
    	}
    	.kobayDetail_infotable{
    		width: 100%;
    	}
  
    	#kobayDetail_tabcontainer {
		    width: 100%;
		    margin-top:30px;
		}
		ul.tabs {
		    margin: 0;
		    padding: 0;
		    float: left;
		    list-style: none;
		    height: 51px;
		    border-bottom: 1px solid #eee;
		    border-left: 1px solid #eee;
		    width: 100%;
		    font-family:"dotum";
		    font-size:12px;
		}
		ul.tabs li {
		    float: left;
		    text-align:center;
		    cursor: pointer;
		    width:250px;
		    height: 50px;
		    line-height: 50px;
		    border: 1px solid #eee;
		    border-left: none;
		    font-weight: bold;
		    background: #fafafa;
		    overflow: hidden;
		    position: relative;
		}
		ul.tabs li.active {
		    background: #FFFFFF;
		    border-bottom: 1px solid #FFFFFF;
		}
		.kobayDetail_tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 100%;
		    background: #FFFFFF;
		}
		.tab_content {
		    padding: 2em;
		    font-size: 12px;
		    display: none;
		}
		.kobayDetail_tab_container .tab_content ul {
		    width:100%;
		    margin:0px;
		    padding:0px;
		}
		.kobayDetail_tab_container .tab_content ul li {
		    padding:5px;
		    list-style:none;
		}
		
		
		
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
		}
		
		.kobayDetail_qnalist{
			width:100%;
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
	
	
	<script>
	
		<%-- 메인/서브이미지 mouseover 이벤트 --%>
		function showSub(val) {
			var sobj = document.getElementById("main_img");
			sobj.src = "../../../images/" + val;
		}
		function showMain(val){
			var mobj = document.getElementById("main_img");
			mobj.src = "../../../images/main_" + val;
		};
			
		<%-- 경매 참여	 --%>		
		function biding(aunq,curprice,sdate,edate,curdate){
			var unq = aunq;
			var curPrice=curprice;
			var startDate=sdate;
			var endDate =edate;
			var curDate = curdate;
			var inputBid =  document.getElementById("bidPrice").value;
			var bidParams = $("#bid").serialize();
			
			
			if(curdate<startDate){
				
				alert('경매진행 대기중 입니다.');
				
			} else if(curdate>endDate){
				
				alert('종료 된 경매입니다.');
				
			} else {
				
				if(inputBid != null){
					if (inputBid > curPrice){
		
						$.ajax({
							type: 'POST',
							data: bidParams,
							url:"<c:url value='/kobayDetail_bidInsert'/>",
							dataType: "json",
							success: function(data) {
								if(data.bidResult == "success") {
									
									alert(inputBid+"원으로 경매에 참여하셨습니다.");
									self.location.reload();
								
								} else {
									alert("다시 시도해 주세요.");
								}
							},
							error: function(error) {
								alert("ersssror: "+error);
							}
						});
						
					} else if(inputBid <= curPrice) {
						alert("가격을 올려서 입력하세요");
					}
				} <%-- if(inputBid != null) --%>
			} <%-- else --%>

		}	
	
		<%-- 상세보기 / QnA Tab 시작 --%>
		$(function () {
			$(".tab_content").hide();
			$(".tab_content:first").show();
			
		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		        $(this).addClass("active").css("color", "#0100FF");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        
		        $("#" + activeTab).fadeIn()
		    });
		});
		
		<%-- tab이름 지정 --%>
		function fn_tab(name){
			var tabid = name;
			
		}
		
		<%-- 질문 입력 시작 --%>
		function kobayDetail_questionInsert(){
			var params = $("#kobayDetail_question").serialize();
		
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
		
		<%-- 수정 /삭제 열기 시작 --%>
		function fn_action(qUnq, actionVal) {
			var questionUnq = qUnq;
			var action = actionVal;
		
			<%-- 질문 수정 팝업 --%>
			if(action=='M') {
				var url = "/kobayDetail_modifyQuestion_popup?qnaUnq="+questionUnq;
				var setting = "width=800,height=200,left=100,top=150";
				
				window.open( url, "post_popup", setting);
				self.location.reload();
			}
				
			<%-- 질문 삭제 --%>	
			if(action=='D'){
				alert('삭제하시겠습니까?');
				var del = "qnaUnq=" + questionUnq
						  + "&delStatus=" + 1;
								
				$.ajax({
					type: 'POST',
					data: del,
					url: "<c:url value='/kobayDetail_deleteQuestion'/>",
					dataType: "json",
					success: function(data) {
						if(data.qnaResult == "success") {
							alert("삭제되었습니다.");
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
		
		}
		
		
		<%-- 답변 달기 --%>
		function qnaAnswer(formID) {
		
			var params = $("form[id=" +formID +"]").serialize();
			
			$.ajax({
				type: 'POST',
				data: params,
				url: "<c:url value='/kobayDetail_insertAnswer'/>",
				dataType: "json",
				success: function(data) {
					if(data.qnaResult == "success") {
						alert("답변이 등록되었습니다.");
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
	
	</script>
  </head>

  <body>
    <!-- Page Content -->
    <div class="container">
		<div class="kobayDetail_row">
		        		
		<%-- 경매등록 회원이 보는 화면 시작  --%>
		
			<div class="kobayDetail_info">
				<div class="kobayDetail_info_left" >
					<table class="kobayDetail_info_imgtable">
						<tr rowspan="4">
							<td colspan="3" class="kobayDetail_info_mainimg">
								
								<img src="../../../images/main_${detailResult.auctionUnq}.jpg" id="main_img" />
							
							</td>
						</tr>
						<tr rowspan="3">
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub1_${detailResult.auctionUnq}.jpg" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
							</td>
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub2_${detailResult.auctionUnq}.jpg" onmouseover="showSub('sub2_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');"/>
							</td>
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub3_${detailResult.auctionUnq}.jpg" onmouseover="showSub('sub3_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');"/>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="kobayDetail_info_rigth">
					<table class="kobayDetail_info_rightinfo">
						<tr>
							<td>[ <c:out value="${detailResult.lCtg}"/> ]</td>
							<td><c:out value="${detailResult.aucTitle}"/></td>
							
							<c:set var="loginUnq" value="88" />
							<c:if test="${loginUnq eq detailResult.memberUnq}">
								<td rowspan="5">
									<div class="kobayDetail_bidStamp">
										입찰참여 중<br>
										<c:out value="${myBid.bidPrice}"/>원
									</div>
								</td>
							</c:if>
						
						
						</tr>
						<tr>
							<td>경매기간</td>
							<td><c:out value="${detailResult.sDate}"/>  ~  <c:out value="${detailResult.eDate}"/></td>
						</tr>
						<tr>
							<td>시작 가격</td>
							<td><c:out value="${detailResult.sPrice}"/>원</td>
						</tr>
						<tr>
							<td>종료 가격</td>
							<td><c:out value="${detailResult.ePrice}"/>원</td>
						</tr>
						<tr>
							<td>배송정보</td>
							<td>
								<c:if test="${detailResult.deliveryWay eq 0}"><c:out value="배송"/> | <c:out value="${detailResult.deliveryFee}"/>원 (도서산간 별도)</c:if>
								<c:if test="${detailResult.deliveryWay eq 1}"><c:out value="직접 수령"/></c:if>
							</td>
						</tr>
					</table>
		
					
					<table class="kobayDetail_info_rightbtn">
						<tr>
							<td>
								<form name="bid" id="bid">
									<div class="row">
										<div class="col-lg-8">
											<div class="input-group">
											
												<input type="hidden" name="memberUnq" value="88">
												<input type="hidden" name="auctionUnq" value="1">
											
												<input type="text" class="form-control" id="bidPrice" name="bidPrice" placeholder="현재입찰가 : ${detailResult.bidPrice}">
												<span class="input-group-btn">
												  <button class="btn btn-primary" type="button" 
												  onclick="biding('${detailResult.auctionUnq}','${detailResult.bidPrice}','${detailResult.sDate}','${detailResult.eDate}','${detailResult.bidRdate}')">경매 참여</button>
												</span>
											</div><!-- /input-group -->
										</div><!-- /.col-lg-6 -->
									</div><!-- /.row -->
								</form>
							</td>
						</tr>
						
						<!--  
						<tr>
							<td>
								<input type="button" class="kobayDetail_bidbtn2" value="팝업" onclick="bid_popup2('${detailResult.auctionUnq}')">		
								<input type="button"  class="kobayDetail_bidbtn btn btn-primary btn-md"  value="경매 참여" onclick="bid('${detailResult.auctionUnq}')">													
							</td>
						</tr>
						-->
					</table>
				</div>
			</div><!-- end of kobayDetail_info -->
	
		
			<table class="kobayDetail_infotable">
				<tr>
				<td colspan="2">
						
					<div id="kobayDetail_tabcontainer">
					    <ul class="tabs">
					        <li class="active" rel="tab1" onclick="fn_tab('#tab1')">상세정보</li>
					        <li rel="tab2" onclick="fn_tab('#tab2')">Q&A</li>
					    </ul>
					    <div class="kobayDetail_tab_container">
					    
					    	<!-- #tab1 상세정보 탭 내용 시작 -->
					        <div id="tab1" class="tab_content">
					           
				          		<c:out value="${detailResult.aucDetail}"/>
					       
					        </div> <!-- end of div#tab1 -->
					        
					  	 	<!-- #tab2 Q&A 탭 내용 시작-->     
					        <div id="tab2" class="tab_content">
					        	<form name="kobayDetail_qna" id="kobayDetail_question">
					        		<!-- 질문 등록 창 -->			        	
									<div class="kobayDetail_qnabox">
										<table class="kobayDetail_answertxt">
											<tr>
												<td>
													<input type="hidden" name="memberUnq" value="1">
													<input type="hidden" name="auctionUnq" value="1">
													<input type="hidden" name="questionerUnq" value="4">
													
													<textarea name="qnaContent" rows='5' class="kobayDetail_answertextarea"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="qnaSecret" value="1"> 비밀글 &nbsp
													<input type="button" value="문의 하기"  class="btn btn-primary btn-sm" onclick="kobayDetail_questionInsert()">
												</td>
											</tr>
										</table>
									</div> <!-- end of kobayDetail_qnabox -->
								</form><!-- end of form#kobayDetail_question -->
								
								
					<c:set var="registerUnq" value="${detailResult.memberUnq }" />
					<c:set var="loginUnq" value="88" />		
					
					
								<!-- 질문목록 -->
								<div class="kobayDetail_qnalist">
									<table class="kobayDetail_question">
										<c:choose>
											<%-- 질문이 없을 때 --%>
											<c:when test="${qnaResult.isEmpty() }">
												<tr>
													<td class="kobayDetail_question_name"></td>
													<td class="kobayDetail_question_date"></td>
												</tr>
												<tr>
													<td colspan="2" class="kobayDetail_question_content">
														등록된 질문이 없습니다.
													</td>
												</tr>
											</c:when>
											
											<%-- 질문이 있을 때 --%>
											<c:otherwise>
												<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">	
													<c:if test="${qnalist.qnastep eq 0 && qnalist.delstatus eq 0}">
														<tr>
															<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<c:out value="${qnalist.qnacontent}"/>
															</td>
														</tr>
													</c:if>
													
													
													<%-- 게시글 작성자의 답변 --%>
													<c:if test="${registerUnq eq loginUnq && qnalist.qnastep eq 0}">
														<form id="kobayDetail_Answer${status.count }">
															<tr>
																<td colspan="2" class="kobayDetail_question_btn">
																	<a href="#answer${status.count}" class="btn btn-info btn-sm" data-toggle="collapse">답변</a>
																	<div id="answer${status.count}" class="collapse">
																		<input type="hidden" name="memberUnq" value="1">
																		<input type="hidden" name="auctionUnq" value="1">
																		<input type="hidden" name="questionerUnq" value="1">
																		<input type="hidden" name="qnaGroup" value="${qnalist.qnaunq}">
																		<textarea rows='5' class="kobayDetail_answertextarea" name="qnaContent"></textarea>																	
																		<input type="button" value="답변 등록" class="btn btn-danger btn-sm" onclick="qnaAnswer('kobayDetail_Answer${status.count }')">
																	</div>
																</td>
															</tr>
														</form>
													</c:if>
													
													
													<%-- 질문 수정/삭제 --%>
													<c:if test="${loginUnq eq questionerunq}">
														<tr>
															<td colspan="2" class="kobayDetail_question_btn">
																<input type="button" class="btn btn-warning btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="수정"/> /  
																<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="삭제"/>
															</td>
														</tr>
													</c:if>
													
													<%-- 질문에 대한 답변 --%>
													<c:if test="${qnalist.qnastep eq 1 && qnalist.delstatus eq 0}">
														<tr>
															<td class="kobayDetail_question_name">└[답변] <c:out value="${qnalist.memberunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnacontent}"/>
																</blockquote>
															</td>
														</tr>
														
														<%-- 답변 수정/삭제 --%>
														<c:if test="${registerUnq eq loginUnq }">
															<tr>
																<td colspan="2" class="kobayDetail_question_btn">
																	<input type="button" class="btn btn-default btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="답변 수정"/>  
																	<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="답변 삭제"/>
																</td>
															</tr>
														</c:if>
													</c:if>
													
													
													
												</c:forEach>
											</c:otherwise>
										
										</c:choose>
							
									
									<%-- 
									
										<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">
											<tr>
												<td class="kobayDetail_question_name">[질문]dd <c:out value="${qnalist.questionerunq}"/></td>
												<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
											</tr>
											<tr>
												<td colspan="2" class="kobayDetail_question_content">
													<c:out value="${qnalist.qnacontent}"/>
												</td>
											</tr>
											
									
										<c:choose>
										<%-- 삭제되지 않은 글만 보이기 (delStatus = 0) --%							        		
							        	<c:when test="${qnalist.delstatus eq 0}">
										
										
								        	<c:choose>				        		
												<%-- 경매등록 회원이 보는 화면 시작  --%
								        		<c:when test="${qnalist.questionerunq eq 4}">
								        		<form id="kobayDetail_Answer">
								        			<tr>
														<td class="kobayDetail_question_name">[질문]dd <c:out value="${qnalist.questionerunq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnacontent}"/>
														</td>
													</tr>
													
													<tr>
														<td colspan="2" class="kobayDetail_question_btn">
															<a href="#answer${status.count}" class="btn btn-info btn-sm" data-toggle="collapse">답변</a>
															<div id="answer${status.count}" class="collapse">
																<input type="hidden" name="memberUnq" value="1">
																<input type="hidden" name="auctionUnq" value="1">
																<input type="hidden" name="questionerUnq" value="1">
																<input type="hidden" name="qnaGroup" value="${qnalist.qnagroup}">
																<textarea rows='5' class="kobayDetail_answertextarea" name="qnaContent"></textarea>																	
																<input type="button" value="답변 등록" class="btn btn-danger btn-sm" onclick="qnaAnswer('${qnalist.qnaunq}')">
															</div>
														</td>
													</tr>
												</form>
								        		</c:when>
								        		<%-- 질문등록 회원이 보는 화면 시작  --%
								        		<c:when test="${qnalist.questionerunq eq 2}">	
								        			<tr>
														<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerunq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnacontent}"/>
														</td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_btn">
															<input type="button" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="수정"/> /  
															<input type="button" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="삭제"/>
														</td>
													</tr>
													<c:choose>
														<c:when test="${qnalist.qnastep eq 1}">
														<tr>
															<td class="kobayDetail_question_name">└[답변] <c:out value="${qnalist.memberunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnacontent}"/>
																</blockquote>
															</td>
														</tr>
														</c:when>
													</c:choose>
													
													<%-- 비밀 질문등록 회원이 보는 화면 시작  --%
													<c:choose>
														<c:when test="${qnalist.qnasecret eq 1}">
														<tr>
															<td class="kobayDetail_question_name">[비밀 질문] <c:out value="${qnalist.questionerunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<c:out value="${qnalist.qnacontent}"/>
															</td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_btn">
																<input type="button" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="수정"/> /  
																<input type="button" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="삭제"/>
															</td>
														</tr>
														<c:choose>
															<c:when test="${qnalist.qnastep eq 1}">
															<tr>
																<td class="kobayDetail_question_name">└[비밀 답변] <c:out value="${qnalist.memberunq}"/></td>
																<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
															</tr>
															<tr>
																<td colspan="2" class="kobayDetail_question_content">
																	<blockquote>
																	<c:out value="${qnalist.qnacontent}"/>
																	</blockquote>
																</td>
															</tr>
															</c:when>
														</c:choose>
														</c:when>
													</c:choose>
													
								        		</c:when>
								        		
								        		<%-- 일반 회원이 보는 화면 시작  --%
								        		<c:when test="${qnalist.questionerunq ne 4}">	
								        			<tr>
														<td class="kobayDetail_question_name">[질문] ss<c:out value="${qnalist.questionerunq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnacontent}"/>
														</td>
													</tr>
													
								        			<c:choose>
														<c:when test="${qnalist.qnastep eq 1}">
														<tr>
															<td class="kobayDetail_question_name">└[답변] <c:out value="${qnalist.memberunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnacontent}"/>
																</blockquote>
															</td>
														</tr>
														</c:when>
													</c:choose>
								        		</c:when>
								        		
								        		<%-- 질문이 없을 때  --%
								        		<c:otherwise>
								        			<tr>
														<td class="kobayDetail_question_name"></td>
														<td class="kobayDetail_question_date"></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															등록된 질문이 없습니다.
														</td>
													</tr>
								        		</c:otherwise>
								        	</c:choose>	
							        	
							        	
							        	</c:when>
										</c:choose>
										
									
										</c:forEach>	
									--%>		
										
									</table><!-- end of table.kobayDetail_question -->
								</div><!-- end of div.kobayDetail_qnalist -->
								
							</div> <!-- end of div#tab2 -->
					    </div><!-- end of div.kobayDetail_tab_container -->
					   
					</div><!-- end of div#kobayDetail_tabcontainer -->
					<!-- #container -->
				</td>
				</tr>
			</table> <!-- end of kobayDetail_infotable -->
    
		</div>
		<!-- kobayDetail_row -->
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
