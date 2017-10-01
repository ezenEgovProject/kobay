<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%-- Navagator --%>
<script src="../../js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$(function(){
	if(document.location.pathname == "/") {
		document.location.pathname = "/main";
	}
	$('.menu li > a[href="' + document.location.pathname + '"]').parent('li').addClass('active').siblings().removeClass('active');
}) 
</script>



	<nav class="navbar navbar-expand-lg navbar-light bg-light subnav">
	<div class="container">
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<div class="collapse navbar-collapse" id="navbarResponsive">
	    	<ul class="navbar-nav mx-auto menu">
	    		<li class="nav-item px-lg-4">
	        		<a class="nav-link" href="/main">홈</a>
	      		</li>
	    		<li class="nav-item px-lg-4 ">
	        		<a class="nav-link " href="/intro">회사소개</a>
	      		</li>	
	      		<li class="nav-item px-lg-4">
	      			<a class="nav-link" href="/list_1">진행경매</a>
	      		</li>
	      		<li class="nav-item px-lg-4">
	        		<a class="nav-link" href="/list_2">예정경매</a>
	      		</li>
	      		<li class="nav-item px-lg-4">
	        		<a class="nav-link" href="/list_3">마감경매</a>
	      		</li>
	      		<li class="nav-item px-lg-4">
	        		<a class="nav-link" href="#">이벤트</a>
	      		</li>
	    	</ul>
	  	</div>
	</div> <!-- /.container -->
</nav> <!-- /.Navagator -->