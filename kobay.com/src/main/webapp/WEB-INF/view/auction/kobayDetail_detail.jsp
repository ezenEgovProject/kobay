<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>


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
    	
    	.kobayDetail_info_rightbtn{
    		width:100%;
    		margin-top:20px;
    	}
    	
    	.kobayDetail_bidbtn{
    		min-height:50px;
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
		<!-- 상세보기 / QnA Tab 시작-->
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
		
		
		<%-- 수정 /삭제 열기 시작 --%>
		function fn_action(qUnq, actionVal) {
			var questionUnq = qUnq;
			var action = actionVal;
		
			if(action=='M') {
				var url = "/kobayDetail_modifyQuestion_popup";
				var setting = "width=500,height=200,left=0,top=0";
				alert(questionUnq);
				window.open( url, "questionModify_popup", setting);
				actionType = actionValue;
				
			} else if(action=='D'){
				alert('삭제하게?');
				alert(questionUnq);
			}		   
		
		}
		
		
		<%-- 질문 입력 시작 --%>
		function kobayDetail_questionInsert(){
			var params =  $("#kobayDetail_qna").serialize();
		
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
		
		<%-- 입찰페이지 연결 시작 --%>
		function bid(aunq){
			var unq = aunq;
			var url = "kobayDetail_pay?Auction_unq="+unq;
			
			location.href="<c:url value='"+url+"'/>";
		}

		
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
		
		
		<%-- 메인/서브이미지 mouseover 이벤트 --%>
		function showSub(val) {
			var sobj = document.getElementById("main_img");
			sobj.src = "../../../images/" + val;
		}
		function showMain(val){
			var mobj = document.getElementById("main_img");
			mobj.src = "../../../images/main_" + val;
		};
	</script>
  </head>

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
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">Contact</a>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Portfolio
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="#">1 Column Portfolio</a>
                <a class="dropdown-item" href="#">2 Column Portfolio</a>
                <a class="dropdown-item" href="#">3 Column Portfolio</a>
                <a class="dropdown-item" href="#">4 Column Portfolio</a>
                <a class="dropdown-item" href="#">Single Portfolio Item</a>
              </div>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Blog
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="#">Blog Home 1</a>
                <a class="dropdown-item" href="#">Blog Home 2</a>
                <a class="dropdown-item" href="#">Blog Post</a>
              </div>
            </li>
            <li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Other Pages
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="#">Full Width Page</a>
                <a class="dropdown-item" href="#">Sidebar Page</a>
                <a class="dropdown-item" href="#">FAQ</a>
                <a class="dropdown-item" href="#">404</a>
                <a class="dropdown-item" href="#">Pricing Table</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	

    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
		<div class="kobayDetail_row">
		        		
		<%-- 경매등록 회원이 보는 화면 시작  --%>
		<c:forEach var="list" items="${qnaResult}" varStatus="status">
      	<c:choose>				
      		<c:when test="${list.auctionUnq eq 1}">
			<div class="kobayDetail_info">
				<div class="kobayDetail_info_left" >
					<table class="kobayDetail_info_imgtable">
						<tr rowspan="4">
							<td colspan="3" class="kobayDetail_info_mainimg">
								
								<img src="../../../images/main_${list.auctionUnq}.jpg" id="main_img" />
							
							</td>
						</tr>
						<tr rowspan="3">
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub1_${list.auctionUnq}.jpg" onmouseover="showSub('sub1_'+${list.auctionUnq}+'.jpg');" onmouseout="showMain(${list.auctionUnq}+'.jpg');" />
							</td>
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub2_${list.auctionUnq}.jpg" onmouseover="showSub('sub2_'+${list.auctionUnq}+'.jpg');" onmouseout="showMain(${list.auctionUnq}+'.jpg');"/>
							</td>
							<td class="kobayDetail_info_subimg">
								<img src="../../../images/sub3_${list.auctionUnq}.jpg" onmouseover="showSub('sub3_'+${list.auctionUnq}+'.jpg');" onmouseout="showMain(${list.auctionUnq}+'.jpg');"/>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="kobayDetail_info_rigth">
					<table class="kobayDetail_info_rightinfo">
						<tr>
							<td>[카테고리명]</td>
							<td>상품명</td>
						</tr>
						<tr>
							<td>경매기간</td>
							<td>2017.09.01 13:00 ~ 2017.09.30 12:00</td>
						</tr>
						<tr>
							<td>시작가격</td>
							<td>86,300원</td>
						</tr>
						<tr>
							<td>즉시구매 가격</td>
							<td>200,000원</td>
						</tr>
						<tr>
							<td>배송정보</td>
							<td>2,500원 (도서산간 별도)</td>
						</tr>
					</table>
					<table class="kobayDetail_info_rightbtn">
						<tr>
							<td>
								<input type="button" class="kobayDetail_bidbtn"" value="경매 참여" onclick="bid('${list.auctionUnq}')">													
							</td>
						</tr>
					</table>
				</div>
			</div><!-- end of kobayDetail_info -->
		</c:when>
		</c:choose>
		</c:forEach>
		
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
					                        상세정보
					        </div> <!-- end of div#tab1 -->
					        
					  	 	<!-- #tab2 Q&A 탭 내용 시작-->     
					        <div id="tab2" class="tab_content">
					        	<form name="kobayDetail_qna" id="kobayDetail_qna">
					        		<!-- 질문 등록 창 -->			        	
									<div class="kobayDetail_qnabox">
										<table class="kobayDetail_answertxt">
											<tr>
												<td>
													<input type="hidden" name="member_unq" value="1">
													<input type="hidden" name="auction_unq" value="1">
													<input type="hidden" name="questioner_unq" value="4">
													
													<textarea name="qna_content" rows='5' class="kobayDetail_answertextarea"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="qna_secret" value="1"> 비밀글 &nbsp
													<input type="button" value="문의 하기" onclick="kobayDetail_questionInsert()">
												</td>
											</tr>
										</table>
									</div> <!-- end of kobayDetail_qnabox -->
									
									<!-- 질문목록 -->
									<div class="kobayDetail_qnalist">
										<table class="kobayDetail_question">
											<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">
								        	<c:choose>								        		
												<%-- 경매등록 회원이 보는 화면 시작  --%>
								        		<c:when test="${qnalist.questionerUnq eq 1}">
								        			<tr>
														<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerUnq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnaContent}"/>
														</td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_btn">
															<input type="button" value="답변" id="answer_btn">
															<div id="kobayDetail_answer_textarea">
																<textarea rows='5' class="kobayDetail_answertextarea"></textarea>
																<input type="button" value="답변 하기">
															</div>
																
														</td>
													</tr>
								        		</c:when>
								        		
								        		<%-- 질문등록 회원이 보는 화면 시작  --%>
								        		<c:when test="${qnalist.questionerUnq eq 4}">	
								        			<tr>
														<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerUnq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnaContent}"/>
														</td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_btn">
															<input type="button" onclick="fn_action('${qnalist.qnaUnq}', 'M')" value="수정"/> /  
															<input type="button" onclick="fn_action('${qnalist.qnaUnq}', 'D')" value="삭제"/>
														</td>
													</tr>
													<c:choose>
														<c:when test="${qnalist.qnaStep eq 1}">
														<tr>
															<td class="kobayDetail_question_name">└[답변] <c:out value="${qnalist.memberUnq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnaContent}"/>
																</blockquote>
															</td>
														</tr>
														</c:when>
													</c:choose>
													
													<%-- 비밀 질문등록 회원이 보는 화면 시작  --%>
													<c:choose>
														<c:when test="${qnalist.qnaSecret eq 1}">
														<tr>
															<td class="kobayDetail_question_name">[비밀 질문] <c:out value="${qnalist.questionerUnq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<c:out value="${qnalist.qnaContent}"/>
															</td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_btn">
																<input type="button" onclick="fn_action('${qnalist.qnaUnq}', 'M')" value="수정"/> /  
																<input type="button" onclick="fn_action('${qnalist.qnaUnq}', 'D')" value="삭제"/>
															</td>
														</tr>
														<c:choose>
															<c:when test="${qnalist.qnaStep eq 1}">
															<tr>
																<td class="kobayDetail_question_name">└[비밀 답변] <c:out value="${qnalist.memberUnq}"/></td>
																<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
															</tr>
															<tr>
																<td colspan="2" class="kobayDetail_question_content">
																	<blockquote>
																	<c:out value="${qnalist.qnaContent}"/>
																	</blockquote>
																</td>
															</tr>
															</c:when>
														</c:choose>
														</c:when>
													</c:choose>
													
								        		</c:when>
								        		
								        		<%-- 일반 회원이 보는 화면 시작  --%>
								        		<c:when test="${qnalist.questionerUnq ne 4}">	
								        			<tr>
														<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerUnq}"/></td>
														<td class="kobayDetail_question_date"><c:out value="${qnalist.qnaRdate}"/></td>
													</tr>
													<tr>
														<td colspan="2" class="kobayDetail_question_content">
															<c:out value="${qnalist.qnaContent}"/>
														</td>
													</tr>
													<tr>
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
								        		</c:when>
								        		
								        		<%-- 질문이 없을 때  --%>
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
											</c:forEach>		
										</table><!-- end of table.kobayDetail_question -->
									</div><!-- end of div.kobayDetail_qnalist -->
								</form><!-- end of form#kobayDetail_qna -->
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
