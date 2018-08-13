<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *Must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Clever - Education &amp; Courses Template | Courses</title>

    <!-- Favicon -->
    <link rel="icon" href="../clever-img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../clever/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
	<link href="common-css/bootstrap.css" rel="stylesheet">
	<link href="single-post-2/css/styles.css" rel="stylesheet">
	<link href="single-post-2/css/responsive.css" rel="stylesheet">
	<script type="text/javascript">
		function submitComment(){
			if(document.comment.form_name.value == ""){
				document.comment.form_name.focus();
			}else if(document.comment.form_email.value ==""){
				document.comment.form_email.focus();
			}else if(document.comment.form_comment_content.value==""){
				document.comment.form_comment_content.focus();
			} else{
				document.comment.submit();		
			} 
		}
		
		function replyReady(comment_no, refer, lev, step){		
			$('#form_comment_no').val(comment_no);
			$('#form_refer').val(refer);
			$('#form_lev').val(lev);
			$('#form_step').val(step);
			document.comment.comment_content.focus();
		}
		
		function loadReply(board_no, refer, comment_no){
			console.log("board_no: "+board_no + "refer: "+refer + "comment_no: "+comment_no);
			$.ajax({
				url: "loadReply.do",
				type: "get",
				data: { "board_no" : board_no, "refer" : refer },
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				success: function(data){
					console.log("data : "+data);
					var html = "";
					html += "<hr>";
					if(data.length != 0){
						for(var i=0; i<data.length; i++){
							html += "<div class='comment'>";
							html += "<h5 class='reply-for'>Reply for <a href='#'><b>Katy Lui</b></a></h5>";
							html += "<div class='post-info'>";
							html += "<input type='hidden' name='comment_no' id='comment_no' value='"+ data[i].comment_no +"'>";
							html += "<input type='hidden' name='refer' id='refer' value='"+data[i].refer+"'>";
							html += "<input type='hidden' name='lev' id='lev' value='"+data[i].lev+"'>";
							html += "<input type='hidden' name='step' id='step' value='"+data[i].step+"'>";
							html += "<div class='left-area'>";
							html += "<a class='avatar' href='#'><img src='images/avatar-1-120x120.jpg' alt='Profile Image'></a>";
							html += "</div>";
							html += "<div class='middle-area'>";
							html += "<a class='name' href='#' name='email'><b>"+data[i].email+"</b></a>";
							html += "<h6 class='date' name='comment_date'>"+data[i].comment_date+"</h6>";
							html += "</div>";
							html += "<div class='right-area'>";
							html += "<h5 class='reply-btn'><a href='deleteComment.do?comment_no="+ data[i].comment_no 
									+"&board_no="+ data[i].board_no +"&refer="+data[i].refer+"&lev="+data[i].lev+"'><b>삭제</b></a></h5>";
							html += "</div>";
							html += "</div>";
							html += "<p name='comment_content'>"+data[i].comment_content+"</p>";
							html += "</div>";
						}
					}
					var replySectionId = "#"+comment_no;
					$(replySectionId).html(html);
				}
			});
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

    <!-- ##### Header Area Start ##### -->
	<%@include file="../include2/navybar4.jsp"%>
    <!-- ##### Header Area End ##### -->
	
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area">
        <!-- Breadcumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Tour</a></li>
                <li class="breadcrumb-item active" aria-current="page">Tour &amp; Diary</li>
            </ol>
        </nav>
    </div>
    <!-- ##### Breadcumb Area End ##### -->	
    
<style>
	#profile{
		border-radius: 30%;
	}
</style>
				<!-- 다이어리 내용 출력 -->
				<c:forEach items="${ diary }" var="diary">
					<c:set var="board_no" value="${ diary.diary_no }"/>

    <!-- ##### Catagory Area Start ##### -->
    <div class="clever-catagory blog-details bg-img d-flex align-items-center justify-content-center p-3 height-400" style="background-image: url(../clever-img/blog-img/7.jpg);">
         <div class="blog-details-headline">
         	<h3><a href="#"><img id="profile" src="images/avatar-1-120x120.jpg" alt="Profile Image" height="30%"width="30%"></a></h3>
            <h3>${ diary.title }</h3>
            <div class="meta d-flex align-items-center justify-content-center">
                <a href="#">${ diary.write_date }</a>
                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                <a href="#">${ diary.region }</a>
                <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                <a href="#">Tourist</a>
            </div>
        </div>
    </div>
    <!-- ##### Catagory Area End ##### -->

    <!-- ##### Blog Details Content ##### -->
    <div class="blog-details-content section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Blog Details Text -->
                    <div class="blog-details-text">
                        <p class="text-right py-1">
                        		동행자: ${diary.company}<br/> 
								투어 시작날짜: ${diary.start_date}
						<p>
                        <h5 class="py-1">${diary.diary_content}</h5>
                        <!-- Tags -->
                        <div class="post-tags">
                            <ul>
								<li><a href="#">Mnual</a></li>
								<li><a href="#">Liberty</a></li>
								<li><a href="#">Recommendation</a></li>
								<li><a href="#">Inspiration</a></li>
                            </ul>
                        </div>
                    </div>
                    								<!-- 수정 및 삭제 버튼  -->
								<div class="editdel">
							        <a href="edit.do?diary_no=${diary.diary_no }" class="editt">수정</a>
							        <a href="delete.do?diary_no=${ diary.diary_no }" class="dell">삭제</a><!-- 수정 및 삭제 버튼  -->
							    </div>
                </div>
            </div>
        </div>
        
        </c:forEach><!-- 다이어리 내용 출력 끝 -->

        <div class="related-posts section-padding-100-0">
            <div class="container-fluid">
                <div class="row">
                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-100">
                            <img src="../clever-img/blog-img/3.jpg" alt="">
                            <!-- Blog Content -->
                            <div class="blog-content">
                                <a href="#" class="blog-headline">
                                    <h4>북촌 한옥마을 기기</h4>
                                </a>
                                <div class="meta d-flex align-items-center">
                                    <a href="#">Sarah Parker</a>
                                    <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    <a href="#">Tourist</a>
                                </div>
                                <p>놀러가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</p>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-100">
                            <img src="../clever-img/blog-img/4.jpg" alt="">
                            <!-- Blog Content -->
                            <div class="blog-content">
                                <a href="#" class="blog-headline">
                                    <h4>안산 영어마을 고고</h4>
                                </a>
                                <div class="meta d-flex align-items-center">
                                    <a href="#">Sarah Parker</a>
                                    <span><i class="fa fa-circle" aria-hidden="true"></i></span>
                                    <a href="#">Art &amp; Design</a>
                                </div>
                                <p>여행가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
										<h5 class="reply-btn"><a href='javascript:replyReady(${comment_no }, ${refer },${lev },${step })'><b>댓글</b></a></h5><br/>
										<h5 class="reply-btn"><a href='deleteComment.do?comment_no=${comment_no }&board_no=${ board_no }&refer=${refer}'><b>삭제</b></a></h5>
									</div>
	
								</div><!-- post-info -->
	
								<p name="comment_content">${ comment.comment_content }</p>
	
							</div>	
							
							<c:if test="${ lev ne 0 }">		
								<a id="loadReply" href="javascript:loadReply(${ board_no }, ${ refer }, ${comment_no })">더보기</a>
								<div id='${ comment_no}'></div>				
							</c:if>					
							
						</div>
					</c:forEach>

					<a class="more-comment-btn" href="#"><b>VIEW MORE COMMENTS</a>
					
					<!-- comment-form -->
					<div class="comment-form">
						<form name="comment" method="post" action='insertComment.do'>
						
							<div class="row">
							
								<input type="hidden" name="comment_no" id="form_comment_no" value="0">
								<input type="hidden" name="board_no" value="${ board_no }">
								<input type="hidden" name="refer" id="form_refer" value="0">
								<input type="hidden" name="lev" id="form_lev" value="0">
								<input type="hidden" name="step" id="form_step" value="0">

								<div class="col-sm-6">
									<input type="text" aria-required="true" name="name" id="form_name" class="form-control"
										placeholder="Enter your name" aria-invalid="true" required >
								</div><!-- col-sm-6 -->
								<div class="col-sm-6">
									<input type="email" aria-required="true" name="email" id="form_email" class="form-control"
										placeholder="Enter your email" aria-invalid="true" required>
								</div><!-- col-sm-6 -->

								<div class="col-sm-12">
									<textarea name="comment_content" rows="2" id="form_comment_content" class="text-area-messge form-control"
										placeholder="Enter your comment" aria-required="true" required></textarea >
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

   
    <!-- ##### Blog Details Content ##### -->
    
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <!-- Top Footer Area -->
        <div class="top-footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Footer Logo -->
                        <div class="footer-logo">
                            <a href="index.html"><img src="../clever-img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite -->
                        <p><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bottom Footer Area -->
        <div class="bottom-footer-area d-flex justify-content-between align-items-center">
            <!-- Contact Info -->
            <div class="contact-info">
                <a href="#"><span>Phone:</span> +44 300 303 0266</a>
                <a href="#"><span>Email:</span> info@clever.com</a>
            </div>
            <!-- Follow Us -->
            <div class="follow-us">
                <span>Follow us</span>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="../clever-js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../clever-js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../clever-js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="../clever-js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="../clever-js/active.js"></script>
	<!-- Facebook Login js -->

</body>
</html>
