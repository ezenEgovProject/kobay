<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<div id="itemList" class="row">
	<c:forEach items="${itemList}" var="list">	
		<div class="col-lg-4 col-sm-6 portfolio-item"> 
			<div class="card">
				<a href="#" class="item">
				 	<img class="card-img-top" src="http://placehold.it/700x400" alt="">
				  	<span class="item item-body">
				  		<span class="item-text c-grey" style="font-size: 10pt;">[${list.mctg}]</span>
				    	<span class="item-text item-title ">${list.auctitle}</span>
				  		<span class="item-text">
				  			<span class="item-left h6 c-black"><strong>₩ ${list.price }</strong></span>
			   				<span class="item-right" style="text-align: right;"><span style="color:red;">${list.bids }</span>명 입찰참여</span>
				  		</span>		
					</span>   
				</a>
			   	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
			   		<div class="col-4">${list.sellername}</div>
			   		<div class="col-8">${list.sdate}~${list.edate }</div>
			  	</div>
			</div>
      	</div>	<!-- /.list -->
	</c:forEach><!-- /list-foreach -->
</div> <!-- /.row -->
</body>
