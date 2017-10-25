<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="utf-8">
<script>
	/* 상세보기 페이지 */
</script>
<body>
 	<!-- 진행 중인 경매 리스트  -->    
    <!-- Marketing Icons Section -->
       <c:forEach items="${resultList}" var="list">
		<div id="item" class="col-lg-4 col-sm-6 portfolio-item">
			<div id="itemCard" class="card">
				<div class="item-body">
					<a href="javascript:fn_detail('${list.auctionunq}')" class="item">
					 	<img class="card-img-top" style="height: 198px;" src="/upload/${list.aucimagemain}" alt="">
					  	<span class="item item-content">
					  		<span class="item-text c-grey" style="font-size: 10pt;">[${list.mctg}]</span>
					    	<span class="item-text item-title ">${list.auctitle}</span>
					  		<span class="item-text">
					  		<c:choose>
					  			<c:when test="${list.price eq null || list.price eq 0}">
					  				<span class="item-left h6 c-black"><strong>₩ ${list.sprice}</strong></span>
					  			</c:when>
					  			<c:otherwise>
					  				<span class="item-left h6 c-black"><strong>₩ ${list.price }</strong></span>
					  			</c:otherwise>
					  		</c:choose>
				   				<span class="item-right" style="text-align: right; margin-bottom: .5rem"><span style="color:red;">${list.bids }</span>명 입찰참여</span>
					  		</span>			
						</span>   
					</a>
				</div>
			   	<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
			   		<div class="col-4">${list.sellername}</div>
			   		<div class="col-8 text-right">마감 : ${list.edate }</div>
			  	</div>
			</div>
      	</div>	<!-- /.list -->
	</c:forEach><!-- /list-forEach -->
</body>
</html>