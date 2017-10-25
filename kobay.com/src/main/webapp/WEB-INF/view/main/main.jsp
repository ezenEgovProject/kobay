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
</style>
<style>

/* a {
    color: #337ab7;
    text-decoration: none;
}

a {
    background-color: transparent;
} */
</style>
<script>

</script>
<script>
//게시글 이동
function fn_detail(value) {
	location.href = "/list_1";
}
function reqlog(){
    alert("로그인을 해주세요.");
    location.href = "/loginreg";
}
</script>
  <body>
	<!-- Main Slider -->
    <header>
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
	            	<div class="d-md-block" style="margin-left: 5%;">
	              		<div id="nullList" class="row" style="padding-top: 5%">
							<c:forEach items="${nullList}" end="2" var="nullList">
								<div id="item" class="col-lg-2 col-sm-2 portfolio-item">
									<div id="itemCard" class="card">
										<div class="item-body">
											<div class="item">
										 		<img class="card-img-top slide-item-img" src="/upload/${nullList.aucimagemain}" alt="">
										  		<span class="item item-content">
										  			<span class="item-text c-grey" style="font-size: 10pt;">[${nullList.mctg}]</span>
										    		<span class="item-text item-title ">${nullList.auctitle}</span>
										  			<span class="item-text">
										  				<strong>₩ ${nullList.price }</strong>
										  			</span>		
												</span>   
											</div>
										</div>
									</div>
				    			</div>	<!-- /.list -->
							</c:forEach><!-- /list-foreach -->
							<div style="text-align: right; margin-left: 10%; margin-top: 10%;">
								<h2 class="strong slide-main-text"><a class="text-warning" href="/list_1">진행중인 경매 보러가기!</a></h2>
							</div>
						</div>
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
    </header>
    <!-- /메엔화면이 아니면 삭제해주세요. -->
    <!-- /Main Slider -->

    <!-- Page Content -->
    <!-- 각자페이지에서 변경할 부분 -->
    <div class="container">
			<!-- Sidebar Column -->
	  		<div class="mt-4">
	    		<div class="nav nav-pills nav-stacked " >
	       			<a href="#tab_a" data-toggle="pill" class="list-group-item active">Kobay 소개</a>
	       			<a href="#tab_b" data-toggle="pill" class="list-group-item">경매방법</a>
	       			<a href="#tab_c" data-toggle="pill" class="list-group-item">마감경매</a>
				</div>
	   		</div>	   		
	  		<!-- Content Column -->
	      	<div class="mb-4" style="margin-top: 1px; border-top: 1px solide #ddd;">
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
  
      <!-- Marketing Icons Section -->
      <div class="row" id="pills-tabContent">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2>Portfolio Heading</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Two</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Three</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Four</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Five</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Six</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
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