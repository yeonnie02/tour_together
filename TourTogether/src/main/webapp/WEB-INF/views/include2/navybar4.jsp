<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.context.SecurityContext" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.GrantedAuthority" %>
<%@ page import="com.cndy.tt.member.Member" %>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">


        <!-- Navbar Area -->
        <div class="clever-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="cleverNav">

                    <!-- Logo -->
                    <a class="nav-brand" href="/tour_together"><img src="../clever-img/core-img/TTLogo.PNG" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li><a href="/tour_together">Home</a></li>
                                <li><a href="#">dropdown</a>
                                    <ul class="dropdown">
                                        <li><a href="../board/content.do">board content</a></li>
                                        <li><a href="../board/form.do">board form</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="../diary/search.do">search</a></li>
                                        <li><a href="../admin/admin_mem.do">admin</a></li>
                                    </ul>
                                </li>
                                <li><a href="../board/list.do">Board</a></li>
                                <li><a href="../member/guide_list.do">Guider</a></li>
                                <li><a href="../diary/list.do">Diary</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>

                            <!-- Search Button -->
                            <div class="search-area">
                                <form action="#" method="post">
                                    <input type="search" name="search" id="search" placeholder="Search">
                                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>

                            <!-- Register / Login -->
                            <div class="register-login-area">
                                

                                <!-- spring security 권한 확인 -->
		    					<sec:authorize access="isAnonymous()">   
                                	<a href="<c:url value="login/join.do" />" class="btn">Register</a>
                                	<a href="<c:url value="login/login.do"/>" class="btn active">Login</a>
                                </sec:authorize>
                                
                                <sec:authorize access="isAuthenticated()">
                                	<sec:authorize access="hasRole('ROLE_ADMIN')">
		    						<a href="<c:url value="admin/admin_mem.do"/>" >관리자</a><br/>
		    						</sec:authorize>
		    						
		    						<form:form action="${pageContext.request.contextPath }/login/logout.do" method="POST">
							    	<input type="submit" class="btn active" value="Logout"></a>
							    	</form:form>
							    </sec:authorize>                                
                                

                            </div>

                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->