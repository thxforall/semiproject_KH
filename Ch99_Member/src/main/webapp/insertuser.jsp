<%@page import="user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
      div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin: 5px 0;
        width: 300px;
      }
      #id-box {
        width: 450px;
      }
      .btn-bar {
        width: 250px;
        display: flex;
        justify-content: space-around;
        align-items: center;
      }
    </style>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>회원가입</title>
</head>
<body>
 <% 
  	UserVO user =  (UserVO) session.getAttribute("authUser");
 %>
<h1>회원가입</h1>
    <form action="insertUser.do" method="post" id="frm">
      <div>
        <label for="name">이름</label>
        <input type="text" name="name" id="name" required />
      </div>
      <div id="id-box">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id" required />
        <input type="button" id="btn" value="중복 확인" />
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
        <input type="email" name="email" id="email" required />
      </div>
      <div>
        <label for="tel">전화번호</label>
        <input type="text" name="tel" id="tel" required />
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
    
	<input type="hidden" name="idChk" value="invalid" />
</center>

<script type="text/javascript">

$(document).ready(function(){
	$("#frm").submit(function(){
		if($('input[name=password]').val() != $('input[name=password-check]').val()) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		
  	});
});

$(document).ready(function(){
	$("#frm").submit(function(){
		if ($('input[name=idChk]').val() === 'invalid') {
		    alert("id가 중복되었거나 중복 체크하지 않았습니다.");
			return false;
		}
  	});
	

	$("#btn").click(function() {
		var url = "checkID.do?id="+$('input[name=id]').val();
		$.getJSON(url, function(data) {
			if (data.id === $('input[name=id]').val()) {
				alert("중복");
				$('input[name=idChk]').val("invalid");
			} else {
				alert("비중복");
				$('input[name=idChk]').val("valid");
			}
		});
	});
	
});



</script>


</body>
</html>