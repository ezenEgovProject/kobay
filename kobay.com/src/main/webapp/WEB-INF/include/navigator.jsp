<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%-- Navagator --%>
<script type="text/javascript">
$(function(){
	if(document.location.pathname == "/") {
		document.location.pathname = "/main";
	}
	$('.menu li > a[href="' + document.location.pathname + '"]').parent('li').addClass('active').siblings().removeClass('active');
}) 
</script>
<style>
.bg-kobay {
	background-color: rgba(86, 182, 230, 0.8);
} 
</style>
	<nav class="navbar navbar-expand-lg navbar-light bg-kobay subnav">
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
	        		<a class="nav-link" href="/intro">Kobay소개</a>
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