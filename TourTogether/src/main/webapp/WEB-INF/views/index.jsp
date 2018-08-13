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
	
	#logout, #feed {
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
	#logout, #close, #login {
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
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
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
    <script>
    /* SDKë¥¼ ì½ì´ë¤ì¸ ë¤ì ì´ê¸°í  start */
      window.fbAsyncInit = function() {//window.fbAsyncInitì í ë¹ë í¨ìë SDKë¥¼ ëª¨ë ì½ì´ë¤ì´ë©´ ì¤íë¨
        FB.init({//SDKì´ê¸°í(ì¤ì )			//ëª¨ë  SDK í¨ìë FB.init ë¤ìì í¸ì¶í´ì¼ í¨
          appId      : '637602396604778',
          cookie     : true,
          xfbml      : true,
          version    : 'v3.0'
        });
         FB.getLoginStatus(function(response) {//ì¬ì©ìì Facebook ë¡ê·¸ì¸ ìí ë° ì± ì¸ì¦ ì¬ë¶ë¥¼ íì¸
            statusChangeCallback(response);//í¨ìí¸ì¶
        }); //ì´ê² ëë¬¸ì ì´ê¸°ì ì¤ë¥ ë°ìíìì
      };
      (function(d, s, id){ //ì¦ì í¸ì¶ í¨ì ì (Immediately Invoked Function Expression, IIFE) //ì¸í°íë¦¬í°ê° í´ë¹ í¨ìì ëë¬íë©´ ìëì¼ë¡ í¸ì¶ëë í¨ì
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "https://connect.facebook.net/en_US/sdk.js";//https ìë¶íë©´ ì¤ë¥ //sdkì½ì´ë¤ì´ë urlì¸ë¯
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
      /* SDKë¥¼ ì½ì´ë¤ì¸ ë¤ì ì´ê¸°í  end */
      
       function statusChangeCallback(response){//ë¡ê·¸ì¸ ìíë³ if else ë¡ì§
         if(response.status === 'connected'){
           console.log('Logged in and authenticated');
           
           //authResponseë ì¬ì©ìì ID, ì í¨í ì¡ì¸ì¤ í í°, ìëªë ìì²­ ë° ì¡ì¸ì¤ í í°ê³¼ ìëªë ìì²­ì´ ê°ê° ë§ë£ëë ìê°ì ì ê³µ.
           var uid = response.authResponse.userID;
           //í í°: ê¸¸ì´ê° ë³í  ì ìë ë¶ëªíí ë¬¸ìì´  https://developers.facebook.com/docs/facebook-login/access-tokens/?translation
           var accessToken = response.authResponse.accessToken;//JavaScriptì© Facebook SDKììë ìëì¼ë¡ ì¬ì©ì ì¡ì¸ì¤ í í°ì ì»ì´ ë¸ë¼ì°ì  ì¿ í¤ì ì ì§->í í°ì¼ë¡ ì¸ìì ì§íë¨ë§?
        		   //ë§ì½ ê·¸ë ë¤ë©´ í í°ì responseìì ì»ì ì ìì¼ëê¹ - responseê° ì¿ í¤ì ì ì§ëë¨ë§!? -> í í°ë§ ì¿ í¤ì ì¡´ì¬í´ë ë¡ê·¸ì¸ì ì ì§ê°ë¥í´ì ì¥ë´ëª»í¨
        		   // -> ë¡ê·¸ì¸í  ëë§ë¤ response(í í°)ë¥¼ ì»ê¸°ìí´ FB.getLoginStatus(function(response){} í¸ì¶
        				   //ê²°êµ­ ì¶ê°ì ì¸ ì¸ìì²ë¦¬ë íìíì§ ìë?
           console.log('uid: '+uid+' /  accessToken: '+accessToken)
           setElements(true);
           //testAPI();
         } else {
           console.log('Not authenticated');
           setElements(false);
         }
       }
      function checkLoginState() { // fb:login-button ë²í¼ì í´ë¦­íë©´ ìíë¨ 
        FB.getLoginStatus(function(response) {//ì¬ì©ìì Facebook ë¡ê·¸ì¸ ìí ë° ì± ì¸ì¦ ì¬ë¶ë¥¼ íì¸ //responseê°ì²´ë¥¼ ë°ë ê³³!? ë°ìì ì¿ í¤ì ìëì ì¥!?
          statusChangeCallback(response);//í¨ìí¸ì¶
          testAPI();//ë¡ê·¸ì¸ë²í¼í´ë¦­ì ëªìí fieldë¥¼ ê°ì²´íìì¼ë¡ responseì ì ì¥
        }, true);//(true ì¶ê°ì´ì ) https://developers.facebook.com/docs/reference/javascript/FB.getLoginStatus#events
      }
      function testAPI(){//
        FB.api('/me?fields=first_name, last_name, gender, birthday, email', function(response){//FB.api()ë¥¼ íµí´ Graph APIë¥¼ í¸ì¶í  ì ìì //responseë ì´ë¨ëê±°ì§???????
          if(response && !response.error){
            console.log("FB.api()");
            alert(JSON.stringify(response));
            //buildProfile(response);
            addBook(response);
          }
        })
      }
      function setElements(isLoggedIn){//ì´ê±°ë¥¼ íë©´ ë°ëëë§ë¤ íì¸í´ì¼í¨ 1.ë©ì¸íì´ì§ë¡ëì 2.ë¡ê·¸ì¸,ë¡ê·¸ìì ì§í //1ë²ì´ ì²ë¦¬ìë¨ true,false
        if(isLoggedIn){
          document.getElementById('logout').style.display = 'block';//ë¡ê·¸ììë²í¼
          document.getElementById('fb-btn').style.display = 'none';
          document.getElementById('heading').style.display = 'none';
          document.getElementById('open').style.display = 'none';
          document.getElementById('login').style.display = 'none';
        } else {
          document.getElementById('login').style.display = 'block';
          document.getElementById('logout').style.display = 'none';
          document.getElementById('fb-btn').style.display = 'block';
          document.getElementById('heading').style.display = 'block';
        }
      }
      function logout(){//ë¡ê·¸ììë²í¼ ëë ì ë ìí //íë¶ë¡ê·¸ìì í htmlë³ê²½
        FB.logout(function(response){
          setElements(false);
        });
        $.post("member/sessionoff", function(){ alert("sessionofffffffffffffffffffffffffffffffffffffffffffffffffffff")})
        .done(function(){
        	console.log("sessionoff done^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
        })
		.error(function(){
			console.log("sessionoff error####################################################");
		})
      }
      function addBook(response) {
    	    $.post("member/add03", 
    	            response,
    	            function(checkIdNum) { alert("success!! checkIdNum : "+checkIdNum); }
			)
			.fail(function() {
    			alert( "error" );
 			 })

    	}
      
    </script>

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
      		<li><a id="me" href="member/profile"> <img src="//graph.facebook.com/${id}/picture?type=large" width="100" height="100"></a></li>
           	<%-- <li><a href="member/profile"> <img src="<c:url value="/resources/images/qwe.jpg" />" width="100" height="100"></a></li> --%>
           	<!-- <li><a href="member/profile"> <img src="/tour_together/images/qwe.jpg" width="100" height="100"></a></li> -->
           	<!--c:url ì¬ì© ì ì£¼ì ì¬í­) https://m.blog.naver.com/PostView.nhn?blogId=phrack&logNo=80105009259&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F -->
          </ul>
          <%-- ${pageContext.request.contextPath} : /tour_together --%>
          <ul class="nav navbar-nav">
            <li><a id="profile" href="member/profile">Profile</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a  style="display:none" id="logout" href="" onclick="logout()">Logout</a></li>
            
            <!-- A.ë¡ê·¸ì¸ ë²í¼ì ì¬ì©íì¬ ë¡ê·¸ì¸ ì ë https://developers.facebook.com/docs/facebook-login/web -->
            <!-- <fb:login-button 
              id="fb-btn"
              scope="public_profile,email,user_birthday,user_location,user_posts"
              onlogin="checkLoginState();">
            </fb:login-button> -->
            <li><a id="login" href="#open">LOGIN</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container">
    		    <br/>
		    <a href="diary/list.do">다이어리 리스트</a><br/>

		    <a href="admin/admin_mem.do">관리자</a><br/>
      <h3 id="heading">Log in to view your profile</h3>
      <div id="profile"></div>
      <div id="feed"></div>
    </div>
    <div class="white_content" id="open">
        <div>
            <p>
            <!-- A.ë¡ê·¸ì¸ ë²í¼ì ì¬ì©íì¬ ë¡ê·¸ì¸ ì ë https://developers.facebook.com/docs/facebook-login/web -->
            <fb:login-button 
              id="fb-btn"
              scope="public_profile"
              onlogin="checkLoginState();">
            </fb:login-button>
            <a href="#close">CLOSE</a></p>
        </div>
    </div>
  </body>
</html>