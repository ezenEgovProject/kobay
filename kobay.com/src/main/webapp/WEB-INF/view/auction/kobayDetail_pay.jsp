<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	   	.kobayDetail_paytable{
	   		width:100%;
	   		margin: 2em 0;
	   	}
	   	.kobayDetail_paytable_title{
	   		font-weight:bold; 
	   		font-size:20px;
	   		color: #56B6E6;
	   		border-top: 2px solid black; 
	   		margin-top:30px; 
	   		padding:10px 0 10px 0; 
	   		text-align:left;
	   	}
	   	.kobayDetail_paytable_th{
	   		padding:10px; 
	   		border:1px solid gray;
	   		text-align: center;
	   	}
	   	.kobayDetail_paytable_td{
	   		padding:10px; 
	   		border:1px solid gray;
	   	}
		.kobayDetail_paytable_addr{
			valign:middle;
		}
		.kobayDetail_paytable_input{
			width:70%;
		}
		.kobayDetail_paytable_input_post{
			width:50%;
		}
		.kobayDetail_paybtn{
    		min-height:50px;
    		padding:0.6em;
    		float:right;
    		background-color:#56B6E6;
    		color: white;
    		font:bold;
    	}
		.kobayDetail_total_td{
			width:20%;
		}
		.kobayDetail_final_price{
			font-size:20px;
			font-weight: bold;
		}
	</style>
	
	<script>
		function final(value) {
			
			var f = document.kobayDetail_bidinfo;
			
			if(value == 's'){
				if(f.member_name.value=="") {
					alert("이름을 입력해주세요.");
					f.member_name.focus();
					return;
				}
				if(f.member_phone.value=="") {
					alert("전화번호를 입력해주세요.");
					f.member_phone.focus();
					return;
				}
				if(f.member_post.value=="") {
					alert("우편번호를 입력해주세요.");
					f.member_post.focus();
					return;
				}
				if(f.member_addr1.value=="") {
					alert("주소를 입력해주세요.");
					f.member_addr1.focus();
					return;
				}
				
			}
			f.action = "/kobayDetail_BidInsert";
			f.submit();
		}
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
		<form name="kobayDetail_bidinfo" method="post">

		<input type="hidden" name="auction_unq" value="1">
		<input type="hidden" name="member_unq" value="2">
		<input type="hidden" name="bid_price" value="50000">
		
		
			<table class="kobayDetail_paytable">
				<tr>
					<td colspan="4" class="kobayDetail_paytable_title">
						코베이 주문 정보
					</td>
				</tr>
				<tr>
					<th colspan="2" class="kobayDetail_paytable_th">
						상품정보
					</th>
					
					<th class="kobayDetail_paytable_th">
						배송비
					</th>
					
					<th class="kobayDetail_paytable_th">
						낙찰 금액
					</th>
				</tr>
				<tr>
					<td class="kobayDetail_paytable_td">
						대표이미지1
					</td>
					<td class="kobayDetail_paytable_td">
						[카테고리명] 상품이름
					</td>
					
					<td class="kobayDetail_paytable_td">
						10,000원
					</td>
					
					<td class="kobayDetail_paytable_td">
						120,000원
					</td>
				</tr>
			</table> <!-- end of kobayDetail_paytable -->
		
			<table class="kobayDetail_paytable">
				<tr>
					<td colspan="3" class="kobayDetail_paytable_title">
						배송 정보 입력
					</td>
				</tr>
				<tr>
					<th>
						수령인
					</th>
					<td>
						<input type="text" class="kobayDetail_paytable_input" id="member_name" name="member_name" placeholder=" 홍길동">
					</td>
				</tr>
				<tr>
					<th>
						연락처
					</th>
					<td>
						<input type="text" class="kobayDetail_paytable_input" id="member_phone" name="member_phone" placeholder=" 01012341234">
					</td>
				</tr>
				
				<tr>
					<th rowspan="4" class="kobayDetail_paytable_addr">
						주소
					</th>
					
					<td>
						<input type="text" class="kobayDetail_paytable_input_post" id="member_post" name="member_post"><input type="button" value="우편번호">
					</td>
				</tr>
				<tr>
					
					<td>
						<input type="text" class="kobayDetail_paytable_input" id="member_addr1" name="member_addr1">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="kobayDetail_paytable_input" name="member_addr2">
					</td>
				</tr>
		
			</table> <!-- end of kobayDetail_paytable -->
		
		
			<table class="kobayDetail_paytable">
				<tr>
					<td colspan="4" class="kobayDetail_paytable_title">
						결제 정보
					</td>
				</tr>
				<tr>
					<th>
						주문 금액
					</th>
					<th>
						배송비
					</th>
					<th>
						결제 금액
					</th>
					<td rowspan="3" class="kobayDetail_total_td">
						<input type="button" class="kobayDetail_paybtn" value="결제 하기" onclick="final('s')">
					</td>
				</tr>
				<tr>
					<td>
						(+)120,000원
					</td>
					<td>
						(+) 10,000원
					</td>
					<td class="kobayDetail_final_price">
						(=) 130,000원
					</td>
				</tr>
			</table> <!-- end of kobayDetail_paytable -->
		</form>
		</div><!-- end of kobayDetail_row -->
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
