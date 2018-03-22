<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">
<link rel="stylesheet" href="../../../css/search.css" />
<link rel="stylesheet" href="../../../css/tab.css" />

<style>
.slide-item-img {
	max-height: 98px;
}
.slide-main-text {
	text-shadow: 2px 1px #fff;
	text-decoration: underline;
}

.main-list-item {
 position:relative;
 display:block;
 width: 8%;
 margin-right: 4%;
 height: 102px;
 padding: 0rem .35rem 0.5rem;
 background-color:#fff;
 border:1px solid rgba(255,255,255,1);
 border-radius:.25rem;
 text-align: center;
 color: #000;
 font-size: 0.8rem;
 }
 .main-list-item:first-child {
 	margin-left: 10%;
 }
 .main-list-item:last-child {
	margin-right: 10%;
}
.main-list-item:focus,.main-list-item:hover{text-decoration:none}
.main-list-item.disabled,.main-list-item:disabled{color:#868e96;background-color:#fff}
.main-list-item.active{
z-index:2;
color:#007bff;
background-color:rgba(255,255,255,0);
border-color:#007bff;
border:2px solid #007bff;
/* border-bottom: 0px solid rgba(255,255,255,0); */}
</style>

<script>
function reqlog(){
    alert("로그인을 해주세요.");
    location.href = "/loginreg";
}
function fn_detail(value) {
  	if(isLogin == "null") {
		alert("로그인이 필요한 서비스입니다.\n로그인 해주세요.");
	  	location.href = "/loginreg";
  	} else {
	 	location.href = "/kobayDetail_detail?auctionUnq=" + value ;
  	}
}
</script>
  <body>
	<!-- Main Slider -->
      	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        	<ol class="carousel-indicators">
          		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        	</ol>
        	<div class="carousel-inner" role="listbox">
          		<!-- Slide One - Set the background image for this slide in the line below -->
          		<div class="carousel-item   active" style="background-image: url('../../../images/slide02_bg.jpg')">
            		<div class="d-md-block" style="margin-left: 15%">
              			<img src="../../../images/slide02_content.png"/>
            		</div>
          		</div>
          		<!-- Slide Two - Set the background image for this slide in the line below -->
          		<div class="carousel-item" style="background-image: url('../../../images/slide03_bg.jpg')">
	              	<div class="d-md-block" style="margin-left: 18%;">
	                   	<c:choose>
	                    	<c:when test="${sessionScope.id  != null}">
	                        	<a href="/write"><img src="../../../images/slide03_content.png"/></a>
	                    	</c:when>
		                    <c:otherwise>   
		                        <a href="javascript:reqlog();"><img src="../../../images/slide03_content.png"/></a>
		                    </c:otherwise>
	                 	</c:choose>
           	 		</div>  
          		</div>
          		<!-- Slide Three - Set the background image for this slide in the line below -->
	            <div class="carousel-item" style="background-image: url('../../../images/slide01_bg.jpg'); padding-left: 5%;">
	            	<div class="d-md-block" style="margin-left: 15%">
              			<a href="/list_1"><img src="../../../images/slide01_content.png"/></a>
            		</div>
	          	</div>
	        </div>
	        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	          	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          	<span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	          	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	          	<span class="sr-only">Next</span>
	        </a>
      	</div>
    <!-- /메엔화면이 아니면 삭제해주세요. -->
    <!-- /Main Slider -->
	
    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
			<!-- Sidebar Column -->
	  		<div class="mt-4" >
	    		<div class="nav nav-pills nav-stacked">
	       			<c:forEach items="${lCtgList}" var="lCtg" varStatus="tabStatus">
	       				<c:set var="tabHref" value="#${lCtg.ctgcd}"/> 
	       				<c:set var="img" value="ctg0${tabStatus.count}.png"/>
	       				<c:if test="${tabStatus.count eq 1 }">
	       					<a href="${tabHref }" data-toggle="pill" class="main-list-item active">
	       					<img alt="" src="../../../images/category/${img}">
		       				<p>${lCtg.ctgnm }</p>
	       				</a>
	       				</c:if>
	       				<c:if test="${tabStatus.count ne 1 }">
	       					<a href="${tabHref }" data-toggle="pill" class="main-list-item">
	       					<img alt="" src="../../../images/category/${img}">
		       				<p>${lCtg.ctgnm }</p>
	       				</a>
	       				</c:if>
		       				
	       			</c:forEach>
				</div>
	   		</div>	   		
	  		<!-- Content Column -->
	      	<div class="mb-4">
	       		<div class="tab-content" style="border: none;">
	       		    <div class="tab-pane active" id="A01">
       					<div id="itemList1" class="row">
       						<c:forEach items="${A01List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
					</div>
       				<div class="tab-pane" id="A02">
       					<div id="itemList2" class="row">
       						<c:forEach items="${A02List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
       				<div class="tab-pane" id="A03">
       					<div id="itemList3" class="row">
       						<c:forEach items="${A03List}" var="mainList">
								<div id="item" class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
       				<div class="tab-pane" id="A04">
       					<div id="itemList4" class="row">
       						<c:forEach items="${A04List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
       				<div class="tab-pane" id="A05">
       					<div id="itemList5" class="row">
       						<c:forEach items="${A05List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
       				<div class="tab-pane" id="A06">
       					<div id="itemList6" class="row">
       						<c:forEach items="${A06List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
	       			<div class="tab-pane" id="A07">
       					<div id="itemList7" class="row">
       						<c:forEach items="${A07List}" var="mainList">
								<div id="item " class="col-lg-4 col-sm-6 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<a href="javascript:fn_detail('${mainList.auctionunq}')" class="item">
												<img class="card-img-top" src="/upload/${mainList.aucimagemain}" alt="">
												<span class="item item-content">
													<span class="item-text c-grey" style="font-size: 10pt;">[${mainList.mctg}]</span>
													<span class="item-text item-title ">${mainList.auctitle}</span>
													<span class="item-text">
														<c:choose>
															<c:when test="${mainList.price eq null || mainList.price eq '0'}">
																<span class="item-left h6 c-black"><strong>\ ${mainList.sprice }</strong></span>
															</c:when>
															<c:otherwise>
																<span class="item-left h6 c-black"><strong>\ ${mainList.price }</strong></span>
															</c:otherwise>
														</c:choose>				  			
														<span class="item-right" style="text-align: right; margin-bottom: .5rem">
															<span style="color:red;">${mainList.bids }</span>명 입찰참여
														</span>
													</span>		
												</span>   
											</a>
										</div>
										<div class="item-footer pb-1 pt-1 row" style="margin-right: 0px; margin-left: 0px;">
											<div class="col-4">${mainList.sellername}</div>
											<div class="col-8">${mainList.sdate}~${mainList.edate }</div>
										 </div>
									</div>
								</div>	<!-- /.list -->
							</c:forEach>
       					</div>
       				</div>
			</div><!-- tab content -->
  
  		</div>
      
   
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap.min.js"></script>

   

  </body>

</html>