<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>TITLE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">


	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->

	<link href="diary/common-css/bootstrap.css" rel="stylesheet">

	<link href="diary/common-css/swiper.css" rel="stylesheet">

	<link href="diary/common-css/ionicons.css" rel="stylesheet">


	<link href="diary/front-page-category/css/styles.css" rel="stylesheet">

	<link href="diary/front-page-category/css/responsive.css" rel="stylesheet">
	
	<link href="diary/front-page-category/css/two-button.css" rel="stylesheet">
	
	<link href="resources/css/login/login.css" rel="stylesheet">
	
	<!-- coolfact css -->
    <link rel="stylesheet" href="resources/css/coolfact/style.css">

</head>
<body >
<!--   <script src='{% static "js/jquery-1.11.3.min.js" %}'></script> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

	<!-- header -->
	<%@include file="include2/navybar3.jsp"%>

	<div class="main-slider">
		<div class="swiper-container position-static" data-slide-effect="slide" data-autoheight="false"
			data-swiper-speed="500" data-swiper-autoplay="10000" data-swiper-margin="0" data-swiper-slides-per-view="4"
			data-swiper-breakpoints="true" data-swiper-loop="true" >
			<div class="swiper-wrapper">

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-1-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>BEAUTY</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-2-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>SPORT</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-3-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>HEALTH</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-4-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>DESIGN</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-5-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>MUSIC</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

				<div class="swiper-slide">
					<a class="slider-category" href="#">
						<div class="blog-image"><img src="images/category-6-400x250.jpg" alt="Blog Image"></div>

						<div class="category">
							<div class="display-table center-text">
								<div class="display-table-cell">
									<h3><b>MOVIE</b></h3>
								</div>
							</div>
						</div>

					</a>
				</div><!-- swiper-slide -->

			</div><!-- swiper-wrapper -->

		</div><!-- swiper-container -->

	</div><!-- slider -->

	<section class="blog-area section">
		<div class="container">

			<div class="row">

				<div class="col-lg-6 col-md-3">
					<div class="card h-100">
						<div class="post-style-1">
									<!-- https://nanati.me/css-button-design/    (12가지 패턴의 버튼)-->
								    <div class="button_base b07_3d_double_roll" onclick="window.location.href='.';">
								        <div>가이드</div>
								        <div>가이드</div>
								        <div>가이드</div>
								        <div>가이드</div>
								    </div>
							
							
						</div><!-- single-post -->
					</div><!-- card -->
				</div><!-- col-lg-6 col-md-3 -->

				<div class="col-lg-6 col-md-3">
					<div class="card h-100">
						<div class="post-style-1">
							
								    <div class="button_base b07_3d_double_roll" onclick="window.location.href='';">
								        <div>여행</div>
								        <div>여행</div>
								        <div>여행</div>
								        <div>여행</div>
								    </div>

						</div><!-- single-post -->

					</div><!-- card -->
				</div><!-- col-lg-6 col-md-3 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="images/marion-michele-330691.jpg" alt="Blog Image"></div>

							<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>

							<div class="blog-info">

								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
								Concepts in Physics?</b></a></h4>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>

							</div><!-- blog-info -->
						</div><!-- single-post -->
					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="images/audrey-jackson-260657.jpg" alt="Blog Image"></div>

							<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>

							<div class="blog-info">
								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>
							</div><!-- blog-info -->

						</div><!-- single-post -->

					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="images/pexels-photo-370474.jpeg" alt="Blog Image"></div>

							<a class="avatar" href="#"><img src="images/averie-woodard-319832.jpg" alt="Profile Image"></a>

							<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
								Concepts in Physics?</b></a></h4>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->
					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-8 col-md-12">
					<div class="card h-100">
						<div class="single-post post-style-2">

							<div class="blog-image"><img src="images/brooke-lark-194251.jpg" alt="Blog Image"></div>

							<div class="blog-info">

								<h6 class="pre-title"><a href="#"><b>HEALTH</b></a></h6>

								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>

								<div class="avatar-area">
									<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>
									<div class="right-area">
										<a class="name" href="#"><b>Lora Plamer</b></a>
										<h6 class="date" href="#">on Sep 29, 2017 at 9:48am</h6>
									</div>
								</div>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>

							</div><!-- blog-right -->

						</div><!-- single-post extra-blog -->

					</div><!-- card -->
				</div><!-- col-lg-8 col-md-12 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="images/dmitri-popov-326976.jpg" alt="Blog Image"></div>

							<a class="avatar" href="#"><img src="images/averie-woodard-319832.jpg" alt="Profile Image"></a>

							<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
								Concepts in Physics?</b></a></h4>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->
					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">

						<div class="single-post post-style-2 post-style-3">

							<div class="blog-info">

								<h6 class="pre-title"><a href="#"><b>HEALTH</b></a></h6>

								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>

								<div class="avatar-area">
									<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>
									<div class="right-area">
										<a class="name" href="#"><b>Lora Plamer</b></a>
										<h6 class="date" href="#">on Sep 29, 2017 at 9:48am</h6>
									</div>
								</div>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>

							</div><!-- blog-right -->

						</div><!-- single-post extra-blog -->

					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">
						<div class="single-post post-style-1">

							<div class="blog-image"><img src="images/ben-o-sullivan-382817.jpg" alt="Blog Image"></div>

							<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>

							<div class="blog-info">
								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>
							</div><!-- blog-info -->

						</div><!-- single-post -->

					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">

						<div class="single-post post-style-4">

							<div class="display-table">
								<h4 class="title display-table-cell"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>
							</div>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->

						<div class="single-post">

							<div class="display-table">
								<h4 class="title display-table-cell"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>
							</div>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->

					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="card h-100">

						<div class="single-post post-style-4">

							<div class="display-table">
								<h4 class="title display-table-cell"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>
							</div>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->

						<div class="single-post">

							<div class="display-table">
								<h4 class="title display-table-cell"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>
							</div>

							<ul class="post-footer">
								<li><a href="#"><i class="ion-heart"></i>57</a></li>
								<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
								<li><a href="#"><i class="ion-eye"></i>138</a></li>
							</ul>

						</div><!-- single-post -->

					</div><!-- card -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-8 col-md-12">
					<div class="card h-100">
						<div class="single-post post-style-2">

							<div class="blog-image"><img src="images/icons8-team-355990.jpg" alt="Blog Image"></div>

							<div class="blog-info">

								<h6 class="pre-title"><a href="#"><b>HEALTH</b></a></h6>

								<h4 class="title"><a href="#"><b>How Did Van Gogh's Turbulent Mind Depict One of the Most Complex
									Concepts in Physics?</b></a></h4>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>

								<div class="avatar-area">
									<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>
									<div class="right-area">
										<a class="name" href="#"><b>Lora Plamer</b></a>
										<h6 class="date" href="#">on Sep 29, 2017 at 9:48am</h6>
									</div>
								</div>

								<ul class="post-footer">
									<li><a href="#"><i class="ion-heart"></i>57</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><a href="#"><i class="ion-eye"></i>138</a></li>
								</ul>

							</div><!-- blog-right -->

						</div><!-- single-post extra-blog -->

					</div><!-- card -->
				</div><!-- col-lg-8 col-md-12 -->

			</div><!-- row -->

			<a class="load-more-btn" href="#"><b>LOAD MORE</b></a>

		</div><!-- container -->
	</section><!-- section -->

	<!-- footer  + modal 인클루드 -->
	<%@include file="include2/footer2.jsp"%>

	<!-- SCIPTS -->

	<script src="diary/common-js/jquery-3.1.1.min.js"></script>

	<script src="diary/common-js/tether.min.js"></script>

	<script src="diary/common-js/bootstrap.js"></script>

	<script src="diary/common-js/swiper.js"></script>

	<script src="diary/common-js/scripts.js"></script>
	
	
	<!-- ##### coolfact JS ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/bootstrap/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/plugins/active.js"></script>
    
    <script src="resources/js/login/fblogin.js"></script>

</body>
</html>
