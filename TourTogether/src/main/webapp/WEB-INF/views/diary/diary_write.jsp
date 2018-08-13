<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>TITLE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	
	<!-- summernote -->
	
	<!-- include libraries(jQuery, bootstrap) --> 
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
 	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	
	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->

	<link href="common-css/bootstrap.css" rel="stylesheet">

	<link href="common-css/ionicons.css" rel="stylesheet">


	<link href="blank-static/css/styles.css" rel="stylesheet">

	<link href="blank-static/css/responsive.css" rel="stylesheet">	 
	
	<!-- SCIPTS -->

	<script src="common-js/tether.min.js"></script>

	
	<!-- include summernote css/js -->
	<link href="summernote/summernote.css" rel="stylesheet">
	<script src="summernote/summernote.js"></script>
	<script src="summernote/lang/summernote-ko-KR.js"></script>
	
	<script>
		function submitContent(){
			document.input.submit();
			
		}
		
		/* summernote script */
		/* jQuery.noConflict(); */
	    $(document).ready(function() {
	        $('#summernote').summernote({
	        	height: 400,
	        	minHeight: null,         
	            maxHeight: null,
	 	        lang : 'ko-KR',
	 	        callbacks: {
					onImageUpload: function(files, editor, welEditable) {			            
			            for(var i=0; i<files.length; i++){
			            	sendFile(files[i], editor, welEditable);
			            }	
			        },
			        
			        // TODO 이미지 지우기
			        onMediaDelete: function(target){
			        	console.log(target[0].src);
			        	deleteFile(target[0]);
			        }
				} 
	        });
	    });
		
		function sendFile(file, editor, welEditable){
        	data = new FormData();
        	data.append("file", file);
        	var $note = $(this);
        	$.ajax({
        		data: data,
        		type: 'POST',
        		url: "fileUpload.do",
        		cache: false,
        		contentType: false,
        		processData: false,
        		enctype: "multipart/form-data",
        		success: function(url){
        			alert(url);
        			$('#summernote').summernote('insertImage', url);
        		}
        	});
		}
		
		function deleteFile(src){
			$.ajax({
				data: {src: src},
				type: 'POST',
				url: myUrl,
				cache: false,
				success: function(resp){
					console.log(resp);
				}
			});
		}
	</script>
</head>

<body onload="input.title.focus()">

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

	<div class="slider display-table center-text">
		<h1 class="title display-table-cell"></h1>
	</div><!-- slider -->

	<section class="blog-area section">
		<div class="container">

			<div class="row">
				<div class="col-lg-2 col-md-0"></div>
				<div class="col-lg-8 col-md-12">
				
					<!-- content -->
					<form name="input" method="post" action="../diary/write.do" enctype="multipart/form-data">
						<div><a>제목</a>&emsp;<input type="text" name="title"></div><br/>
						<div><a>글쓴이</a>&emsp;<input type="text" name="email"></div><br/>
						<div><a>지역</a>&emsp;<input type="text" name="region"></div><br/>
						<div><a>동행자</a>&emsp;<input type="text" name="company"></div><br/>
						<!-- summernote -->
						<textarea id="summernote" name="diary_content"></textarea>
						
						<button type="button" onclick="submitContent()">작성</button>
   					</form>
				    
				</div><!-- col-sm-8 col-sm-offset-2 -->
			</div><!-- row -->

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

</body>
</html>
