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
	function fn_detail(a) {
		var f = document.hiddenFrm;
		f.auctionunq.value = a;
		f.submit();
	}

</script>
<body>
<form name="hiddenFrm" method="post" action="/kobayDetail_detail">
	<input type="hidden" name="auctionunq" id="auctionunq"/>
</form>
      <!-- 낙찰된 경매 리스트 -->    
        
      <!-- Marketing Icons Section -->
       <div id="itemList" class="row">
   		 <c:forEach var="list" items="${resultList}" varStatus="status"> 
              <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card">
              	<a href="#" onclick="fn_detail('${list.auctionunq}')">
              		<img class="card-img-top" src="/upload/${list.aucimagemain}" alt="">
              		<span class="pt-2 pb-2 text-center" style="display: block; border-bottom: 1px solid #ddd">마감${totcnt3}</span>
              		<span class="item item-body">
              			<span class="item-title item-text" style="font-size: 14pt;">${list.auctitle}</span>
					  		<span class="item-text item-text">
					  			<span class="item-left">낙찰 가격: ${list.eprice}</span>
					  		</span>	
              		</span>
              	</a>
              	<div class="item-footer mt-2 row" style="margin-right: 0px; margin-left: 0px;">
					   		<div class="col-8">경매 참여인원: </div>
				</div>
              </div>
          	 <c:set var="totcnt3" value="${(totcnt3)-1}"/>
          	 </div>
          </c:forEach> <!-- /list-forEach -->
	   </div> <!-- /.row -->
</body>
</html>