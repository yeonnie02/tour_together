<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>reboard_write.jsp</title>
	<script language="javascript">
	  function checkValue()
	  {
	    if(document.input.id.value == "")
		{
		  alert(" 아이디를 입력해주세요");
		  return false;
		}
		if(document.input.password.value == "")
		{
		  alert("비밀번호를 입력해주세요");
		  return false;
		}
		if(document.input.last_name.value == "")
		{
		  alert("성을 입력하세요");
		  return false;
		}
		if(document.input.first_name.value == "")
		{
		  alert("이름을 입력해주세요");
		  return false;
		}
		if(document.input.email.value == "")
		{
		  alert("이메일을 입력해주세요");
		  return false;
		}
		if(document.input.country.value == "")
		{
		  alert("국적을 입력해주세요");
		  return false;
		}
		document.input.submit();
	  }
	</script>
  </head>
  <body >
    <center>
      
	  <form name="input" action="insert.do" method="post">

			  아이디<input type="text" name="id" size="40"><br/>
			  
			  비밀번호 <input type="password" name="password" size="40"><br/>

			 성<input type="text" name="last_name" size="40"><br/>

			  이름<input type="text" name="first_name" size="40"><br/>
			  
			  이메일<input type="email" name="email" size="40"><br/>
			  
			   폰번호<input type="text" name="telephone" size="40"><br/>

			 프로필사진<input type="text" name="profile_path" size="40"><br/>
			 
			 자기소개<input type="text" name="intro" size="40"><br/>
			 
			 국적<input type="text" name="country" size="40"><br/>
			 
			 성별<input type="text" name="gender" size="40"><br/>
			 
			  생일<input type="text" name="birthday" size="40"><br/>

			  <input type="button" value="회원가입" onclick="checkValue()"><br/>
		
	</center>
  </body>
</html>
