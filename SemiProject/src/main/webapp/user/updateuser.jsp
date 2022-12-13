<%@page import="user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<meta charset="UTF-8">
 <style>
      div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 5px 0;
        width: 250px;
      }
      .btn-bar {
        width: 250px;
        display: flex;
        justify-content: space-around;
        align-items: center;
      }
    </style>
<title>회원정보변경</title>
</head>
<body>
 <% 
  	UserVO user =  (UserVO) session.getAttribute("authUser");
 %>
	<h1>회원정보변경</h1>
    <form action="updateUser.do" method="post" id="frm">
      <div>
        <label for="name">이름</label>
        <input type="text" name="name" id="name" value="<%=user.getName() %>" readonly />
      </div>
      <div id="id-box">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" value="<%=user.getId() %>" readonly />
      </div>
      <div>
        <label for="password">암 호</label>
        <input type="password" name="password" id="password" required />
      </div>
      <div>
        <label for="password-check">암호 확인</label>
        <input
          type="password"
          name="password-check"
          id="password-check"
          required
        />
      </div>
      <div>
        <label for="email">이메일</label>
        <input type="email" name="email" id="email" value="<%=user.getEmail()%>" />
      </div>
      <div>
        <label for="tel">전화번호</label>
        <input type="text" name="tel" id="tel" value="<%=user.getTel()%>"/>
      </div>
      <div>
        <span>등급</span>
        <input type="radio" id="user" name="role" value="user" />
        <label for="user">일반회원</label>
        <input type="radio" id="admin" name="role" value="admin" />
        <label for="admin">관리자</label>
      </div>
      <div class="btn-bar">
        <input type="submit" value="확인" />
        <input type="reset" value="취소" onclick = "javascript:history.back();" />        
      </div>
    </form>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#frm").submit(function(){
    		if($('input[name=password]').val() != $('input[name=password-check]').val()) {
    			alert("비밀번호가 일치하지 않습니다");
    			return false;
    		}
    		
      	});
    });
</script>
</body>
</html>