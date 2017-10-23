<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var listCount = ${pageSize};
$(document).ready(function() {
	console.log(listCount);
	
});
</script>
<body>
	<c:forEach items="${itemList}" var="list">
		<div id="item" class="col-lg-4 col-sm-6 portfolio-item">
			<div id="itemCard" class="card">
				<div class="item-body">
					<a href="#" class="item">
					 	<img class="card-img-top" src="http://placehold.it/700x400" alt="">
					  	<span class="item item-content">
					  		<span class="item-text c-grey" style="font-size: 10pt;">[${list.mctg}]</span>
					    	<span class="item-text item-title ">${list.auctitle}</span>
					  		<span class="item-text">
					  			<span class="item-left h6 c-black"><strong>₩ ${list.price }</strong></span>
				   				<span class="item-right" style="text-align: right; margin-bottom: .5rem"><span style="color:red;">${list.bids }</span>명 입찰참여</span>
					  		</span>		
						</span>   
					</a>
				</div>
			   	<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
			   		<div class="col-4">${list.sellername}</div>
			   		<div class="col-8">${list.sdate}~${list.edate }</div>
			  	</div>
			</div>
      	</div>	<!-- /.list -->
	</c:forEach><!-- /list-foreach -->

</body>
