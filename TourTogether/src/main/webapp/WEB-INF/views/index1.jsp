<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<title>TourTogether</title>
<link rel="stylesheet"
	href="https://bootswatch.com/4/spacelab/bootstrap.min.css">
<style media="screen">
	#fb-btn {
		margin-top: 20px;
	}
	
	#logout, #feed, #join {
		display: none
	}
	
	#profile:link, #profile:visited {
		background-color: #f44336;
		color: white;
		padding: 14px 25px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	#logout, #close, #login, #join {
		background-color: #333333;
		color: white;
		padding: 14px 25px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	
	#profile:hover, #profile:active {
		background-color: red;
	}
	
	.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 35%; 
	width: 30%;
	height: 40%;
	padding: 70px;
	/* border: 3px solid red; */
	background-color: white;
	overflow: auto;	
}
</style>
</head>
<body>
<!--   <script src='{% static "js/jquery-1.11.3.min.js" %}'></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="login/fblogin.js"></script>

    <nav class="navbar navbar-default navbar-dark bg-dark">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="">TourTogether</a>
        </div>
        <div >
      	  <ul class="nav navbar-nav">
      	 	<!-- <li><a id="me" href="member/profile"> <img src="images/fb_default.jpg" width="100" height="100"></a></li> -->
      		<li><a id="me" href="member/profile"> <img src="//graph.facebook.com/${id}/picture?type=large" width="100" height="100"></a></li>
           	<%-- <li><a href="member/profile"> <img src="<c:url value="/resources/images/qwe.jpg" />" width="100" height="100"></a></li> --%>
           	<!-- <li><a href="member/profile"> <img src="/tour_together/images/qwe.jpg" width="100" height="100"></a></li> -->
           	<!--c:url 사용 시 주의 사항) https://m.blog.naver.com/PostView.nhn?blogId=phrack&logNo=80105009259&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F -->
          </ul>
          <%-- ${pageContext.request.contextPath} : /tour_together --%>
          <ul class="nav navbar-nav">
            <li><a id="profile" href="member/profile">Profile</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a  style="display:none" id="logout" href="" onclick="logout()">Logout</a></li>
            
            <!-- A.로그인 버튼을 사용하여 로그인 유도 https://developers.facebook.com/docs/facebook-login/web -->
            <!-- <fb:login-button 
              id="fb-btn"
              scope="public_profile,email,user_birthday,user_location,user_posts"
              onlogin="checkLoginState();">
            </fb:login-button> -->
            <li><a id="login" href="#open">로그인</a></li>
            <li><a id="join" href="#openn">회원가입</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container">
      <h3 id="heading">Log in to view your profile</h3>
      <div id="profile"></div>
      <div id="feed"></div>
    </div>
    <div class="white_content" id="open">
        <div align="center">
            <p>
            <!-- A.로그인 버튼을 사용하여 로그인 유도 https://developers.facebook.com/docs/facebook-login/web -->
            <fb:login-button 
              id="fb-btn" size="xlarge"
              scope="public_profile"
              onlogin="checkLoginState();">
              페이스북 계정으로 로그인
            </fb:login-button>
            <a href="#close">CLOSE</a></p>
        </div>
    </div>
    
    <div class="white_content" id="openn">
        <div align="center">
            
            <!-- A.로그인 버튼을 사용하여 로그인 유도 https://developers.facebook.com/docs/facebook-login/web -->
 <!--            
 		<div class="fb-login-button" data-max-rows="1" data-size="large" 
		data-button-type="continue_with" data-show-faces="true"
		data-auto-logout-link="true" data-use-continue-as="true"
		scope="public_profile,email,publish_pages,manage_pages" onlogin="checkLoginState();"></div> 
-->
			<fb:login-button size="xlarge" id="fb-btn"
	                 onlogin="checkLoginState();">
			 	 페이스북 계정으로 회원가입
			</fb:login-button>
			<div><a href="#close">CLOSE</a></div>
        </div>
    </div>
  </body>
</html>