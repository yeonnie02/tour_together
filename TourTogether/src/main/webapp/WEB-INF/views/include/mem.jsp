<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="../js/paging.js"></script>
	<link rel="stylesheet" type="text/css" href="css/admin_mem_tab.css" />
	<link rel="stylesheet" type="text/css" href="css/admin_search_tab.css" />
	
	<!-- paging css  -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
</head>
<body>
	<!-- 회원 검색 테이블 -->
	<form action="searchMem.do" method="post" class="search">
		<table class="type03">
		    <tr>
		        <th scope="row">
		        	<select name="searchOpt" id="searchOpt" style="width:80px; height:30px;">
					  <option value="email">이메일</option>
					  <option value="telephone">전화번호</option>
					  <option value="lastName">성</option>
					  <option value="firstName">이름</option>
					  <option value="mem_class">등급</option>
					  <option value="join_date">가입일</option>
					  <option value="country">나라</option>
					  <option value="gender">성별</option>
					</select>
		        </th>
		        <td>
		        	<input type="text" name="inputText">
		        	<button type="submit" id="search">검색</button>
		        </td>
		    </tr>
		</table>
	</form>
	
	<!-- 회원 테이블 -->
	 <table class="type09">
	    <thead>
	    <tr>
	        <th scope="cols">선택</th>
	        <th scope="cols">이메일</th>
	        <th scope="cols">전화번호</th>
	        <th scope="cols">성</th>
	        <th scope="cols">이름</th>
	        <th scope="cols">등급</th>	        
	        <th scope="cols">나라</th>
	        <th scope="cols">성별</th>
	        <th scope="cols">가입일</th>       
	    </tr>
	    </thead>	    
	    
	    <c:forEach items="${list}" var="data">
		     <tbody>
			      <tr>
			        <th scope="row" align="center">
			        	<input type="checkbox" />
			        </th>
			        <td>${data.email}</td>	        
			        <td>${data.telephone}</td>
			        <td>${data.lastName}</td>	        
			        <td>${data.firstName}</td>
			        <td>${data.mem_class}</td>			        	        
			        <td>${data.country}</td>
			        <td>${data.gender}</td>
			        <td>${data.join_date}</td>
			      </tr>			      
		      </tbody>
	     </c:forEach>
	     <td><button id="block">차단</button></td>
	     <td/><td/><td/><td/><td/><td/><td/>
	     <td>총 ${pagingVo.total}명</td>
	 </table>
	
	<!-- paging view -->
	    <div align="center">
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
  	    <form action="admin_mem.do" method="post" id='frmPaging'>
			<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
			<input type='hidden' name='index' id='index' value='${pagingVo.index}'>
			<input type='hidden' name='pageStartNum' id='pageStartNum' value='${pagingVo.pageStartNum}'>
			<input type='hidden' name='listCnt' id='listCnt' value='${pagingVo.listCnt}'>
		</form>
		</div>

</body>
</html>