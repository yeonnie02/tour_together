<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>TITLE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">


	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->

	<link href="common-css/bootstrap.css" rel="stylesheet">

	<link href="common-css/ionicons.css" rel="stylesheet">


	<link href="single-post-2/css/styles.css" rel="stylesheet">

	<link href="single-post-2/css/responsive.css" rel="stylesheet">
	
	<script type="text/javascript">
	
		function submitComment(){
			document.comment.submit();
		}
		
		function replyReady(comment_no, refer, lev, step){		
			$('#form_comment_no').val(comment_no);
			$('#form_refer').val(refer);
			$('#form_lev').val(lev);
			$('#form_step').val(step);
			document.comment.comment_content.focus();
		}
		
		function cancelReply(){
			$('#form_comment_no').val("0");
			$('#form_refer').val("0");
			$('#form_lev').val("0");
			$('#form_step').val("0");
		}
	
	</script>

</head>
<body >

	<header>
		<div class="container-fluid position-relative no-side-padding">

			<a href="#" class="logo"><img src="images/logo.png" alt="Logo Image"></a>

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li><a href="#">Home</a></li>
				<li><a href="#">Categories</a></li>
				<li><a href="#">Features</a></li>
			</ul><!-- main-menu -->

			<div class="src-area">
				<form>
					<button class="src-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
					<input class="src-input" type="text" placeholder="Type of search">
				</form>
			</div>

		</div><!-- conatiner -->
	</header>

	<div class="slider">

	</div><!-- slider -->

	<section class="post-area">
		<div class="container">

			<div class="row">

				<div class="col-lg-1 col-md-0"></div>
				<div class="col-lg-10 col-md-12">
				
				<!-- 다이어리 내용 출력 -->
				<c:forEach items="${ diary }" var="diary">

					<c:set var="board_no" value="${ diary.diary_no }"/>
					<div class="main-post">

						<div class="post-top-area">
							
							<h5 class="pre-title"><b>${ diary.region }</b></h5>

							<h3 class="title"><b>${ diary.title }</b></a></h3>

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>${ diary.email }</b></a>
									<h6 class="date">${ diary.write_date }</h6>
								</div>

							</div><!-- post-info -->

							<p class="para"> 
								동행자: ${ diary.company }<br/> 
								투어 시작날짜: ${ diary.start_date }
							</p>

						</div><!-- post-top-area -->

						<div class="post-image"><img src="images/blog-1-1000x600.jpg" alt="Blog Image"></div>

						<div class="post-bottom-area">

							${ diary.diary_content }

							<ul class="tags">
								<li><a href="#">Mnual</a></li>
								<li><a href="#">Liberty</a></li>
								<li><a href="#">Recommendation</a></li>
								<li><a href="#">Inspiration</a></li>
							</ul>

							<div class="post-icons-area">
								<ul class="post-icons">
									<li><a href="#"><i class="ion-heart"></i>${ diary.user_like }</a></li>
									<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
									<li><i class="ion-eye"></i>${ diary.count_read }</a></li>
								</ul>

							</div>

							<div class="post-footer post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b> ${ diary.email }</b></a>
									<h6 class="date">${ diary.write_date }</h6>
								</div>

							</div><!-- post-info -->
							
							<!-- 수정 및 삭제 버튼  -->
							<br/><a href='edit.do?diary_no=${diary.diary_no }'><button class="submit-btn">수정</button></a>
							<a href='delete.do?diary_no=${ diary.diary_no }'><button class="submit-btn">삭제</button></a>

						</div><!-- post-bottom-area -->

					</div><!-- main-post -->
					
					</c:forEach>

				</div><!-- col-lg-8 col-md-12 -->
			</div><!-- row -->
		</div><!-- container -->
	</section><!-- post-area -->

	<section class="comment-section center-text">
		<div class="container"><br/>

			<div class="row">

				<div class="col-lg-2 col-md-0"></div>

				<div class="col-lg-8 col-md-12">

					<h4><b>COMMENTS(12)</b></h4>
					
					<!-- commnets-area -->
					<c:forEach items="${ comments }" var="comment">
						<c:set var="comment_no" value="${ comment.comment_no }"/>
						<c:set var="refer" value="${ comment.refer }"/>
						<c:set var="lev" value="${ comment.lev }"/>
						<c:set var="step" value="${ comment.step }"/>
						
						<div class="commnets-area text-left">
	
							<div class="comment">
	
								<div class="post-info">
									
									<input type="hidden" name="comment_no" id="comment_no" value="${ comment_no }">
									<input type="hidden" name="refer" id="refer" value="${ refer }">
									<input type="hidden" name="lev" id="lev" value="${ lev }">
									<input type="hidden" name="step" id="step" value="${ step }">
									<div class="left-area">
										<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
									</div>
	
									<div class="middle-area">
										<a class="name" href="#" name="email"><b>${ comment.email }</b></a>
										<h6 class="date" name="comment_date">${ comment.comment_date }</h6>
									</div>
	
									<div class="right-area">
										<h5 class="reply-btn"><a href='javascript:replyReady(${comment_no }, ${refer },${lev },${step })'><b>REPLY</b></a></h5>
									</div>
	
								</div><!-- post-info -->
	
								<p name="comment_content">${ comment.comment_content }</p>
	
							</div>
	
						</div>
					</c:forEach>

					<div class="commnets-area text-left">

						<div class="comment">

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>Katy Liu</b></a>
									<h6 class="date">on Sep 29, 2017 at 9:48 am</h6>
								</div>

								<div class="right-area">
									<h5 class="reply-btn" ><a href="#"><b>REPLY</b></a></h5>
								</div>

							</div><!-- post-info -->

							<p>Lorem ipsum </p>

						</div>

						<div class="comment">
							<h5 class="reply-for">Reply for <a href="#"><b>Katy Lui</b></a></h5>

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>Katy Liu</b></a>
									<h6 class="date">on Sep 29, 2017 at 9:48 am</h6>
								</div>

								<div class="right-area">
									<h5 class="reply-btn" ><a href="#"><b>REPLY</b></a></h5>
								</div>

							</div><!-- post-info -->

							<p>Lorem ipsum dolor sit amet,</p>

						</div>

					</div><!-- commnets-area -->

					<a class="more-comment-btn" href="#"><b>VIEW MORE COMMENTS</a>
					
					<!-- comment-form -->
					<div class="comment-form">
						<form name="comment" method="post" action='insertComment.do'>
						
							<div class="row">
							
								<input type="text" name="comment_no" id="form_comment_no" value="0">
								<input type="hidden" name="board_no" value="${ board_no }">
								<input type="text" name="refer" id="form_refer" value="0">
								<input type="text" name="lev" id="form_lev" value="0">
								<input type="text" name="step" id="form_step" value="0">

								<div class="col-sm-6">
									<input type="text" aria-required="true" name="name" class="form-control"
										placeholder="Enter your name" aria-invalid="true" required >
								</div><!-- col-sm-6 -->
								<div class="col-sm-6">
									<input type="email" aria-required="true" name="email" class="form-control"
										placeholder="Enter your email" aria-invalid="true" required>
								</div><!-- col-sm-6 -->

								<div class="col-sm-12">
									<textarea name="comment_content" rows="2" class="text-area-messge form-control"
										placeholder="Enter your comment" aria-required="true" aria-invalid="false"></textarea >
								</div><!-- col-sm-12 -->
								<div class="col-sm-12">
									<button class="submit-btn" onclick="submitComment()"><b>확인</b></button>&emsp;&emsp;
								</div><!-- col-sm-12 -->

							</div><!-- row -->
						</form>
					</div>

				</div><!-- col-lg-8 col-md-12 -->

			</div><!-- row -->

		</div><!-- container -->
	</section>

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
