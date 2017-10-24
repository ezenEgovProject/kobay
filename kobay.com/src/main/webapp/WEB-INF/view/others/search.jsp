<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Kobay 모두가 판매자이자 구매자이다.</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="../../../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../../../css/kobay.css" >

  </head>

  <body>

     <!-- Navigation -->
     <nav class="navbar navbar-default fixed-top navbar-static-top bg-blue" role="navigation" style="margin-bottom: 0">
		<div class="container" style="width: 100%;">
			<div class="row justify-content-between align-items-center" style="width: 100%;">
				<div class="col-12 col-sm-auto order-sm-1 text-center">
					<a class="navbar-brand" href="/main"><label class="logo" >Kobay</label></a>
				</div>
				<div class="col-4 order-sm-2">
				    <div class="input-group">
				      <span class="input-group-btn">
				        <a class="btn search-btn" href="/action/search"><i class="fa fa-search fa-lg" style="color: #0080ff"></i></a>
				      </span>
				      <input type="text" class="form-control search-input" placeholder="검색어를 입력하세요.">
				    </div><!-- /input-group -->
			  	</div>
				<div class="col-6 col-sm-auto order-sm-3" >
					 <span class="top-icon"><i class="fa fa-user-circle-o fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
					 <span class="top-icon"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true" style="color: #ffffff"></i></span>
				</div>
			</div>
		</div> 
	<!-- /.navbar-top -->
   
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light bg-light subnav">
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
         <ul class="navbar-nav mx-auto">
          	<li class="nav-item px-lg-4">
              <a class="nav-link" href="/main">홈</a>
            </li>
          	<li class="nav-item px-lg-4 dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  회사소개
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/intro">KOBAY 소개</a>
                <a class="dropdown-item" href="#">경매방법</a>
                <a class="dropdown-item" href="#">문의사항</a>
              </div>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">진행경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">예정경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">마감경매</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link" href="#">이벤트</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
	<!-- Page Content -->
    <div class="container">
		<div class="mb-4 mt-4 mt-3" id="accordion" role="tablist" aria-multiselectable="true">
		 <div class="card text-center">
			<div class="card-body h-75">
				<div class="row align-items-center">
				 	<div class="col-2 align-self-center">
				 		<p class="card-text">카테고리</p>
				 	</div>
				 	<div class="col-10">
				 		<ul class="list-inline" style="margin-bottom: 0px">
					 		<li>AA</li>
					 		<li>BB</li>
					 		<li>CC</li>
					 		<li>DD</li>
					 		<li>EE</li>
					 		<li>FF</li>
					 		<li>GG</li>
					 		<li>HH</li>
				 		</ul>
				 	</div> 
				</div>
			</div>
			<hr style="margin: 0px"/>
			<div class="card-body">
				<div class="col">
				 	Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 
				 	3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. 
				 	Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
				 	Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
			 	</div> 
			</div>
		 </div>
			
		</div>

  	</div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; kobay 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="../../../../vendor/jquery/jquery.min.js"></script>
    <script src="../../../../vendor/popper/popper.min.js"></script>
    <script src="../../../../vendor/bootstrap/js/bootstrap.min.js"></script>

  </body>

</html>
