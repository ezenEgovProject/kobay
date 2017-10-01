<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>

</head>
<body>
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">Sidebar Page
	        <small>Subheading</small>
	    </h1>
	
	    <ol class="breadcrumb">
			<li class="breadcrumb-item"> <a href="/main">Home</a> </li>
	        <li class="breadcrumb-item active">회사 소개</li>
	    </ol>
	
		<!-- Content Row -->
		<div class="row">
	  		<!-- Sidebar Column -->
	  		<div class="col-lg-3 mb-4">
	    		<div class="list-group nav nav-pills nav-stacked " >
	       			<a href="#tab_a" data-toggle="pill" class="list-group-item active">Kobay 소개</a>
	       			<a href="#tab_b" data-toggle="pill" class="list-group-item">경매방법</a>
	       			<a href="#tab_c" data-toggle="pill" class="list-group-item">마감경매</a>
				</div>
	   		</div>
	  		<!-- Content Column -->
	      	<div class="col-lg-9 mb-4">
	       		<div class="tab-content">
	        		<div class="tab-pane active" id="tab_a">
	        			<h4>Kobay 소개</h4>
	            			<p>To change our Pills/Tabs into a vertically stacked variation we need to insert the class nav-stacked into the opening ul tag. 
	            			The result would be a vertical stack of pills/tabs and the content pane displayed below that stack. 
	            			I prefer to change this into panes that display to the right or left of the tabs/pills. 
	            			To achieve that we need to add Bootstrap 3’s grid classes that set the number of columns for the nav and for the tab-content:.</p>
	            	</div>
		        	<div class="tab-pane" id="tab_b">
		             	<h4>경매방법</h4>
		            	<p>bbbbbbbbbbbb.</p>
		        	</div>
		        	<div class="tab-pane" id="tab_c">
		             	<h4>마감경매</h4>
		            	<p>ccccccccccccccccc.</p>
		        	</div>
				</div>
			</div><!-- tab content -->
		</div> <!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="../../../vendor/jquery/jquery.min.js"></script>
	<script src="../../../vendor/popper/popper.min.js"></script>
	<script src="../../../vendor/bootstrap/js/bootstrap.min.js"></script>
   
</body>

</html>
