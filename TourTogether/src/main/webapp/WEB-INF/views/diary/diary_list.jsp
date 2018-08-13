<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE HTML>
<html>
<head>
	<title>TITLE</title>
	
	<!-- 페이징 스크립트 -->
	<script type="text/javascript" src="../js/paging.js"></script>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">

	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->

	<link href="common-css/bootstrap.css" rel="stylesheet">

	<link href="common-css/ionicons.css" rel="stylesheet">

	<link href="layout-1/css/styles.css" rel="stylesheet">

	<link href="layout-1/css/responsive.css" rel="stylesheet">
	
	<!-- paging css  -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">

</head>
<body >

	<header>
		<div class="container-fluid position-relative no-side-padding">

			<!-- ## LOGO -->
			<a href="#" class="logo"><img src="images/logo.png" alt="Logo Image"></a>

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<!-- ## main-menu -->
			<ul class="main-menu visible-on-click" id="main-menu">
				<li><a href="#">Home</a></li>
				<li><a href="#">Categories</a></li>
				<li><a href="#">Features</a></li>
			</ul>
			
			<!-- ## search -->
			<div class="src-area">
				<form>
					<button class="src-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
					<input class="src-input" type="text" placeholder="Type of search">
				</form>
			</div>

		</div><!-- conatiner -->
	</header>

	<div class="slider"></div><!-- slider -->

	<section class="blog-area section">
		<div class="container">
		
			<!-- 글쓰기 버튼  -->
			<div><a href='write.do'><button>글쓰기</button></a><br/><br/></div>
		
			<!-- 게시물 출력 -->
			<div class="row">
			
				<c:forEach items="${list}" var="data">
					
					<div class="col-lg-4 col-md-6">
						<div class="card h-100">
							<div class="single-post post-style-2">
								
								<div class="blog-image"><img src="images/marion-michele-330691.jpg" alt="Blog Image"></div>
	
								<!-- ## PROFILE -->
								<a class="avatar" href="#"><img src="images/icons8-team-355979.jpg" alt="Profile Image"></a>
	
								<div class="blog-info">
									<!-- ## TITLE -->
									<h4 class="title">
										<a href='content.do?diary_no=${data.diary_no}&index=${pagingVo.index}'>
										<b>${data.title}</b></a>
									</h4>
	
									<!-- ## post footer -->
									<ul class="post-footer">
										<li><i class="ion-heart"></i>${ data.user_like }</a></li>
										<li><i class="ion-chatbubble"></i>6</a></li>
										<li><i class="ion-eye"></i>${data.count_read}</a></li>
									</ul>
									
								</div><!-- blog-info -->
							</div><!-- single-post -->
						</div><!-- card -->
					</div><!-- col-lg-4 col-md-6 -->
					
				</c:forEach>
				
			</div><!-- row -->
			
			<!-- paging view -->	
			<ul id="paging" class="pagination">
				<c:if test="${pagingVo.pageStartNum ne 1}">
					<!--맨 첫페이지 이동 -->
					<li><a onclick='pagePre(${pagingVo.pageCnt+1},${pagingVo.pageCnt});'>&laquo;</a></li>
					<!--이전 페이지 이동 -->
					<li><a onclick='pagePre(${pagingVo.pageStartNum},${pagingVo.pageCnt});'>&lsaquo;</a></li>
				</c:if>
				
				<!--페이지번호 -->
				<c:forEach var='i' begin="${pagingVo.pageStartNum}" end="${pagingVo.pageLastNum}" step="1">
					<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
				</c:forEach>
				
				<c:if test="${pagingVo.lastChk}">
					<!--다음 페이지 이동 -->
					<li><a onclick='pageNext(${pagingVo.pageStartNum},${pagingVo.total},${pagingVo.listCnt},${pagingVo.pageCnt});'>&rsaquo;</a></li>
					<!--마지막 페이지 이동 -->
					<li><a onclick='pageLast(${pagingVo.pageStartNum},${pagingVo.total},${pagingVo.listCnt},${pagingVo.pageCnt});'>&raquo;</a></li>
				</c:if>
			</ul>
	  	    <form action="./list.do" method="post" id='frmPaging'>
				<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
				<input type='hidden' name='index' id='index' value='${pagingVo.index}'>
				<input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVo.pageStartNum}'>
				<input type='hidden' name='listCnt' id='listCnt' value='${pagingVo.listCnt}'>	
			</form>

		</div><!-- container -->
	</section><!-- section -->


	<footer>

		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-6">
					<div class="footer-section">

						<a class="logo" href="#"><img src="images/logo.png" alt="Logo Image"></a>
						<p class="copyright">Bona @ 2017. All rights reserved.</p>
						<p class="copyright">Designed by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
						<ul class="icons">
							<li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
							<li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
						</ul>

					</div><!-- footer-section -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
						<div class="footer-section">
						<h4 class="title"><b>CATAGORIES</b></h4>
						<ul>
							<li><a href="#">BEAUTY</a></li>
							<li><a href="#">HEALTH</a></li>
							<li><a href="#">MUSIC</a></li>
						</ul>
						<ul>
							<li><a href="#">SPORT</a></li>
							<li><a href="#">DESIGN</a></li>
							<li><a href="#">TRAVEL</a></li>
						</ul>
					</div><!-- footer-section -->
				</div><!-- col-lg-4 col-md-6 -->

				<div class="col-lg-4 col-md-6">
					<div class="footer-section">

						<h4 class="title"><b>SUBSCRIBE</b></h4>
						<div class="input-area">
							<form>
								<input class="email-input" type="text" placeholder="Enter your email">
								<button class="submit-btn" type="submit"><i class="icon ion-ios-email-outline"></i></button>
							</form>
						</div>

					</div><!-- footer-section -->
				</div><!-- col-lg-4 col-md-6 -->

			</div><!-- row -->
		</div><!-- container -->
	</footer>


	<!-- SCIPTS -->

	<script src="common-js/jquery-3.1.1.min.js"></script>

	<script src="common-js/tether.min.js"></script>

	<script src="common-js/bootstrap.js"></script>

	<script src="common-js/scripts.js"></script>

</body>
</html>
