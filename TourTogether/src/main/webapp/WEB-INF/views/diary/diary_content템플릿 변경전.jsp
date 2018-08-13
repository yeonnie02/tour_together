<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>TITLE</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">

	<!-- modal -->
	<link href="resources/css/login/login.css" rel="stylesheet">

	<!-- Font -->

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">


	<!-- Stylesheets -->
	<link href="common-css/bootstrap.css" rel="stylesheet">
	<link href="common-css/ionicons.css" rel="stylesheet">
	<link href="single-post-2/css/styles.css" rel="stylesheet">
	<link href="single-post-2/css/responsive.css" rel="stylesheet">
	
	<!-- coolfact css -->
    <link rel="stylesheet" href="../resources/css/coolfact/style.css">
	
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

	<!-- header -->
	<%@include file="../include2/navybar4.jsp"%>

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
						<div class="post-image"><img src="images/blog-1-1000x600.jpg" alt="Blog Image"></div>

						<div class="post-bottom-area">

							${ diary.diary_content }
							<%-- <p class="para"> ${ diary.diary_content }</p> --%>

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
								<!-- 수정 및 삭제 버튼  -->
								<div class="editdel right-area">
							        <a href="edit.do?diary_no=${diary.diary_no }" class="editt">수정</a>
							        <a href="delete.do?diary_no=${ diary.diary_no }" class="dell">삭제</a><!-- 수정 및 삭제 버튼  -->
							    </div>

							</div><!-- post-info -->
							
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

	<!-- footer  + modal 인클루드 -->
	<%@include file="../include2/footer.jsp"%>


	<!-- SCIPTS -->

	<script src="common-js/jquery-3.1.1.min.js"></script>

	<script src="common-js/tether.min.js"></script>

	<script src="common-js/bootstrap.js"></script>

	<script src="common-js/scripts.js"></script>
	
	<!-- ##### coolfact JS ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="../js/bootstrap/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
    <script src="../js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="../js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="../js/plugins/active.js"></script>
    
    <script src="resources/js/login/fblogin.js"></script>	

</body>
</html>
