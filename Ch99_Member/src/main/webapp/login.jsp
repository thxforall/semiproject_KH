<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>
	<h1>로그인</h1>
    <form action="login.do" method="get">
      <div>
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" />
      </div>
      <div>
        <label for="password">암 호</label>
        <input type="password" name="password" id="password" />
      </div>
      <div class="btn-bar">
        <input type="submit" value="로그인" />
        <input type="reset" value="취소" onclick = "javascript:history.back();" />        
        <input type="button" value="회원가입" onclick="insertUser();"/>
      </div>
    </form>
    <script type="text/javascript">
    	function insertUser() {
    		location.href = '<%= request.getContextPath() %>/insertuser.jsp';
    	}
    
    </script>
</body>
</html>