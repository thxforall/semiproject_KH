<%@page import="user.model.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
	a:hover, a:visited, a:link, a:active
	{
    text-decoration: none;
    color:black;
	}
	a:hover{
    color: black;
	}

</style>
<head>
<meta charset="UTF-8">
<title>UserPage</title>
</head>
<body>
 <% 
  	UserVO user =  (UserVO) session.getAttribute("authUser");
 %>
	<h1>회원 전용 페이지</h1>
	<p>안녕하세요. <%=user.getName() %> 님</p>
	<button><a href="logout.do">로그아웃</a></button>
	<button><a href="updateuser.jsp?id=<%=user.getId() %>">회원정보변경</a></button>

</body>
</html>














