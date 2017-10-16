<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
<link rel="stylesheet" href="../../../css/font.css" />
<style>
.nav{padding-left:0;margin-bottom:0;list-style:none}
.nav>li{position:relative;display:block}
.nav>li>a{position:relative;display:block;padding:1rem 1rem}
.nav>li>a:focus,.nav>li>a:hover{text-decoration:none;background-color:#eee}
.nav>li.disabled>a{color:#777}
.nav>li.disabled>a:focus,.nav>li.disabled>a:hover{color:#777;text-decoration:none;cursor:not-allowed;background-color:transparent}
.nav .open>a,.nav .open>a:focus,.nav .open>a:hover{background-color:#eee;border-color:#337ab7}
.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}
.nav>li>a>img{max-width:none}
.nav-tabs{border-bottom:1px solid #ddd}
.nav-tabs>li{float:left;margin-bottom:-1px}
.nav-tabs>li>a{margin-right:0px;line-height:1.42857143;border:1px solid transparent;border-radius:4px 4px 0 0}
.nav-tabs>li>a:hover{border-color:#eee #eee #ddd}
.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover{
	color:#555;cursor:default;
	background-color:#fff;
	border:1px solid #ddd;
	border-bottom-color:transparent
	}
a {
    color: #337ab7;
    text-decoration: none;
}

a {
    background-color: transparent;
}

.tab-content {
	padding-top: 1.5rem;
	border-left:1px solid #ddd;
	border-right:1px solid #ddd;
	border-bottom:1px solid #ddd;
}
.badge {
    display: inline-block;
    min-width: 10px;
    padding-right: 0.3rem;
    font-size: 10px;
    font-weight: 700;
    line-height: 1;
    color: #999999;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    background-color: transparent;
    border-radius: 10px;
}
.nav-tabs li {
	display:block; 
	width:25%;
	background: transparent;
	font-size: .9rem; 
	font-family:"나눔고딕";
	text-decoration:none;
}
.sub-body {
	border-top: 1px solid rgba(0,0,0,.125);
	display: none; 
	padding-left: 1.25rem;
	padding-right: 1.25rem;
	padding-top: 0.5rem;
	padding-bottom: 0.5rem;
}

</style>

  <body>
  	<!-- Page Content -->
	<div class="container" align="center"> 
		<div class="mb-4 mt-4"  style="width: 90%">
			<div class="tab-list">
				<ul class="nav nav-tabs">
	       			<li class="active"><a href="#tab_a" data-toggle="tab" aria-expanded="false" >전체보기</a></li>
	       			<li class=""><a href="#tab_b" data-toggle="tab" aria-expanded="false"  >진행경매</a></li>
	       			<li class=""><a href="#tab_c" data-toggle="tab" aria-expanded="false" > 예정경매</a></li>
	       			<li class=""><a href="#tab_d" data-toggle="tab" aria-expanded="false" >예정경매</a></li>
				</ul>
			</div><!-- /.tab-list -->
			
      		<div class="tab-content" >
	       		<div class="tab-pane active" id="tab_a">
	       			<h4>Kobay dasds소개</h4>
	           			<p>To change our Pills/Tabs into a vertically stacked variation we need to insert the class nav-stacked into the opening ul tag. 
	           			The result would be a vertical stack of pills/tabs and the content pane displayed below that stack. 
	           			I prefer to change this into panes that display to the right or left of the tabs/pills. 
	           			To achieve that we need to add Bootstrap 3’s grid classes that set the number of columns for the nav and for the tab-content:.</p>
	           	</div>
	        	<div class="tab-pane" id="tab_b">
	             	<h4>진행경매</h4>
	            	<p>bbbbbbbbbbbb.</p>
	        	</div>
	        	<div class="tab-pane" id="tab_c">
	             	<h4>예정경매</h4>
	            	<p>ccccccccccccccccc.</p>
	        	</div>
			</div><!-- tab content -->
		</div>
	</div><!-- /.container -->

    <!-- Footer -->
 
	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap3.3.7.min.js"></script>
</body>
</html>
