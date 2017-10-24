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
	
	<%-- 대표 이미지 --%>
	function showMain(val){
		var mobj = document.getElementById("main_img");
		mobj.src = "../../../images/main_" + val;
	};
</script>

</head>

	

<body>
    <!-- Page Content -->

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
						<img src="../../../images/main_${detailResult.auctionUnq}.jpg" id="main_img" />
					</td>
					<td class="kobayDetail_paytable_td">
						[<c:out value="${detailResult.lCtg}"/>] <c:out value="${detailResult.aucTitle}"/>
					</td>
					
					<td class="kobayDetail_paytable_td">
						<c:out value="${detailResult.deliveryFee}"/>원
					</td>
					
					<td class="kobayDetail_paytable_td">
						<c:out value="${detailResult.bidPrice}"/>원
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

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>
