<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.context.SecurityContext" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.GrantedAuthority" %>
<%@ page import="com.cndy.tt.member.Member" %>
<%
	String tag = "[ loginForm ] ";
	Authentication auth = SecurityContextHolder.getContext().getAuthentication(); //(로그인)인증 객체

	Object principal = auth.getPrincipal(); //인증에 성공시 member 객체 리턴 
	System.out.println(tag+" principal: "+principal);
	String email = "";
	if(principal != null && principal instanceof Member){
		email = ((Member)principal).getEmail();
		System.out.println(tag+"email: "+email);
		System.out.println(tag+"id: "+((Member)principal).getId());
		System.out.println(tag+"password: "+((Member)principal).getPassword());
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>로그인 페이지</title>
</head>

<body onload="document.f.id.focus();">

<h3>아이디와 비밀번호를 입력해주세요.</h3>

<c:url value="/login" var="loginUrl" />
<form:form name="f" action="${loginUrl}" method="POST">
    <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
    </c:if>
    <p>
        <label for="username">아이디</label>
        <input type="text" id="id" name="id" />
    </p>
    <p>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password"/>
    </p>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
    <button type="submit" class="btn">로그인</button>
</form:form>

</body>
</html>
