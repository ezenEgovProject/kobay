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
		<%-- 상세보기 / QnA Tab 끝--%>
		
		<%-- 답변 창 열기 시작 --%>
	
		$(document).ready(function(){
			$("table#answer_textarea").hide();
		});
		$(document).ready(function(){
			$("input#answer_btn").click(function(){
				$("input#answer_btn").hide();
				$("table#answer_textarea").toggle();
			});
		});
		
		
		$(document).ready(function(){
			$("table#modify_textarea").hide();
		});
		$(document).ready(function(){
			$("input#modify_answer").click(function(){
				$("input#modify_answer").hide();
				$("input#delete_answer").hide();
				$("table#modify_textarea").toggle();
			});
		});
		
		<%-- 답변 창 열기 끝 --%>
		
		<%-- 입찰페이지 연결 시작 --%>
		function bid(){
			location.href="/kobayDetail_pay";
		}
		<%-- 입찰페이지 연결  끝 --%>
	</script>
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
    	.kobayDetail_info_subimg{
    		width:30%; 
    		height: 100px; 
    		border: 1px solid #BDBDBD;
    		border-collapse:collapse;
    		text-align:center;
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
		
		
		.kobayDetail_answertxt{
			width:100%; 
			margin-bottom:1em;
		}
		
		.kobayDetail_answertxt td{
			text-align:right; 
			padding-bottom: 20px;
		}
		
		.kobayDetail_answerlist{
			width:100%;
		}
		.kobayDetail_answerlist_name{
			text-align:left;
			padding-top:1em;
			border-top:1px solid gray;
		}
		.kobayDetail_answerlist_date{
			text-align:right;
			padding-top:1em;
			border-top:1px solid gray;
		}
		.kobayDetail_answerlist_content{
			text-align:left; 
			padding-bottom:2em; 
		}
		.kobayDetail_answertxt_td{
			text-align:right; 
			padding-bottom:10px; 
		}
		.kobayDetail_answerbtn{
			text-align:right; 
			padding-bottom: 20px;
		}
		
	</style>
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
		
			<div class="kobayDetail_info">
				<div class="kobayDetail_info_left" >
					<table class="kobayDetail_info_imgtable">
						<tr rowspan="4">
							<td colspan="3" class="kobayDetail_info_mainimg">
							메인 이미지
							</td>
						</tr>
						<tr rowspan="3">
							<td class="kobayDetail_info_subimg">
								1
							</td>
							<td class="kobayDetail_info_subimg">
								2
							</td>
							<td class="kobayDetail_info_subimg">
								3
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
								<input type="button" class="kobayDetail_bidbtn"" value="경매 참여" onclick="bid()">													
							</td>
						</tr>
					</table>
				</div>
			</div>
		
		
			<table class="kobayDetail_infotable">
				<tr>
					<td colspan="2">
						
						<div id="kobayDetail_tabcontainer">
						    <ul class="tabs">
						        <li class="active" rel="tab1">상세정보</li>
						        <li rel="tab2">Q&A</li>
						    </ul>
						    <div class="kobayDetail_tab_container">
						    
						    <!-- #tab1 상세정보 탭 내용 시작 -->
						        <div id="tab1" class="tab_content">
						                        상세정보
						        </div>
						        
						    <!-- #tab2 Q&A 탭 내용 시작-->     
						        <div id="tab2" class="tab_content">
						        	<table class="kobayDetail_answertxt">
						        		<tr>
						        			<td>
						        				<textarea rows="5"  style="width:100%;">
						        				</textarea>												        	
						        			</td>
						        		</tr>
						        		<tr>
						        			<td>
						        				<input type="checkbox"> 비밀글 &nbsp
						        				<input type="button" value="문의 하기">
						        			</td>
						        		</tr>
						        	</table>
						        	
						        	<!-- 질문자가 보는 화면 -->
						        	<table class="kobayDetail_answerlist">
						        	<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">
						        		<tr>
						        			<td>
						        				<table class="kobayDetail_answerlist">
									        		<tr>
									        			<td class="kobayDetail_answerlist_name">
									        				[질문] <c:out value="${qnalist.questionerUnq}"/>
									        			</td>
									        			<td class="kobayDetail_answerlist_date">
									        				<c:out value="${qnalist.questionDate}"/>
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answerlist_content">
									        				<c:out value="${qnalist.questionContent}"/>
									        			</td>
									        		</tr>
									        	</table>
						        			</td>
						        		</tr>
						        		<tr>
						        			<td>
						        				<table class="kobayDetail_answerlist">
									        		<tr>
									        			<td class="kobayDetail_answerlist_name">
									        				┗[답변] <c:out value="${qnalist.memberUnq}"/>
									        			</td>
									        			<td class="kobayDetail_answerlist_date">
									        				<c:out value="${qnalist.questionDate}"/>
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answerlist_content">
									        				<blockquote>
									        					<c:out value="${qnalist.questionContent}"/>
									        				</blockquote>
									        			</td>
									        		</tr>
									        	</table>
						        			</td>
						        		</tr>
						        
						        	</c:forEach>
						        	
						        		</table>
						        	<!-- 답변자가 보는 화면 -->
						        	<table class="kobayDetail_answerlist">
						        		<tr>
						        			<td>
						        				<table class="kobayDetail_answerlist">
									        		<tr>
									        			<td class="kobayDetail_answerlist_name">
									        				[질문] 질문자 이름
									        			</td>
									        			<td class="kobayDetail_answerlist_date">
									        				2017.09.02
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answerlist_content">
									        				물건은 확실한가요?
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answertxt_td">
		
									        				<input type="button" value="답변" id="answer_btn">
									        				<table id="answer_textarea" class="kobayDetail_answertxt">
												        		<tr>
												        			<td colspan="2">
												        				<textarea rows="5" class="kobayDetail_answerlist">
												        				</textarea>												        	
												        			</td>
												        		</tr>
												        		<tr>
												        			<td>
												        			</td>
												        			<td class="kobayDetail_answerbtn">
												        				<input type="button" value="답변 하기">
												        			</td>
												        		</tr>
												        	</table>
									        				
									        			</td>
									        		</tr>
									        	</table>
						        			</td>
						        		</tr>
						        		
						        		<tr>
						        			<td>
						        				<table class="kobayDetail_answerlist">
									        		<tr>
									        			<td class="kobayDetail_answerlist_name">
									        				┗[답변] 경매 게시자 이름
									        			</td>
									        			<td class="kobayDetail_answerlist_date">
									        				2017.09.01
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answerlist_content">
									        				<blockquote>
									        					확실합니다.
									        				</blockquote>
									        			</td>
									        		</tr>
									        		<tr>
									        			<td colspan="2" class="kobayDetail_answertxt_td">
									        				<input type="button" value="수정" id="modify_answer">
									        				<input type="button" value="삭제" id="delete_answer">
									        				<table id="modify_textarea" class="kobayDetail_answerlist">
												        		<tr>
												        			<td colspan="2">
												        				<textarea rows="5"  class="kobayDetail_answerlist">
												        				</textarea>												        	
												        			</td>
												        		</tr>
												        		<tr>
												        			<td>
												        			</td>
												        			<td class="kobayDetail_answerbtn">
												        				<input type="button" value="답변 수정">
												        			</td>
												        		</tr>
												        	</table>
									        			</td>
									        		</tr>
									        	</table>
						        			</td>
						        		</tr>
						        	</table>
								</div>
						       
						        
						    </div>
						    <!-- .kobayDetail_tab_container -->
						</div>
						<!-- #container -->
					</td>
				</tr>
			</table>
    
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
