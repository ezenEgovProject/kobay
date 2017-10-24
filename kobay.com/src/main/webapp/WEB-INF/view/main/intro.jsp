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
              <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              	  회사소개
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item active" href="/intro">KOBAY 소개</a>
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

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Sidebar Page
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="/main">Home</a>
        </li>
        <li class="breadcrumb-item active">Kobay 소개</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="/intro" class="list-group-item active">Kobay 소개</a>
            <a href="#" class="list-group-item">경매방법</a>
            <a href="#" class="list-group-item">마감경매</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          <h2>Section Heading</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, et temporibus, facere perferendis veniam beatae non debitis, numquam blanditiis necessitatibus vel mollitia dolorum laudantium, voluptate dolores iure maxime ducimus fugit.</p>
        </div>
      </div>
      <!-- /.row -->

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
