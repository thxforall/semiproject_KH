<%@page import="user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" type="text/css"/>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <title>Sign Up</title>
  </head>
  <body>
 <% 
  	UserVO user =  (UserVO) session.getAttribute("authUser");
 %>  
    <div class="status-bar">
      <div class="status-bar__column">
        <span>No Service</span>
        <i class="fa-solid fa-wifi"></i>
      </div>
      <div class="status-bar__column time-box">
        <span></span>
      </div>
      <div class="status-bar__column">
        <span>100%</span>
        <i class="fa-solid fa-battery-full fa-lg"></i>
        <i class="fa-solid fa-bolt-lightning"></i>
      </div>
    </div>

    <header class="signup-header">
      <h1 class="signup-header__title">Cheer:s Up🍻</h1>
    </header>

    <form
      action="insertUser.do"
      method="post"
      id="signup-form"
    >
      <label for="username">Username
      <span class="hidden green-text">Checked!✔</span>
      <span class="hidden red-text">Failed!✔</span>
      </label>
      <input
        name="username"
        id="username"
        type="email"
        placeholder="@cheersup.com"
        required
      />
      <input type="button" id="btn" value="중복 확인" />
      <label for="password">Password</label>
      <input
        name="password"
        id="password"
        type="password"
        placeholder="🔒"
        required
      />
      <label for="password-confirm">Password Comfirm
      	<span class="hidden pw-red-text">Failed!✔</span>
      </label>
      <input
        name="password-confirm"
        id="password-confirm"
        type="password"
        placeholder="🔐"
        required
      />
      <label for="name">Name</label>
      <input name="name" id="name" type="text" required />
      <label for="mobilephone">Mobile Phone</label>
      <input
        name="mobilephone"
        id="mobilephone"	
        type="text"
        placeholder="📱"
        required
      />
      <label for="gender">Gender</label>
      <select name="gender" id="gender" required>
        <option value="">Gender</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
        <option value="other">Other</option>
      </select>
      <label for="birthdate">Date Of Birth</label>
      <input type="date" name="birthdate" id="birthdate" required />
      <input type="submit" value="Sign Up" />
      <a onclick = "index.jsp">Cancel</a>
    </form>
    <input type="hidden" name="idChk" value="invalid" />
    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>
    
    <!-- java script -->
    <script type="text/javascript" src="js/clock.js"></script>
	<script type="text/javascript">

$(document).ready(function(){
	$("#signup-form").submit(function(){
		if($('input[name=password]').val() != $('input[name=password-confirm]').val()) {
			$('.pw-red-text').removeClass("hidden");
			$('input[name=password-confirm]').css('border-color', "red");
			var offset = $('.signup-header').offset();
       		$('html').animate({scrollTop : offset.top}, 300);
			return false;
		}
		
  	});
});

$(document).ready(function(){
	$("#signup-form").submit(function(){
		if ($('input[name=idChk]').val() === 'invalid') {
			$('.red-text').removeClass("hidden");
			$('input[name=username]').css('border-color', "red");
			var offset = $('.signup-header').offset();
       		$('html').animate({scrollTop : offset.top}, 300);
			return false;
		}
  	});
	

	$("#btn").click(function() {
		var url = "checkID.do?username="+$('input[name=username]').val();
		$('.red-text').addClass("hidden");
		$('.green-text').addClass("hidden");
	$.getJSON(url, function(data) {
			if (data.username === $('input[name=username]').val()) {
				$('.red-text').removeClass("hidden");
				$('input[name=username]').css('border-color', "red");
				$('input[name=idChk]').val("invalid");
			} else if ($('input[name=username]').val() == "") {
				$('.red-text').removeClass("hidden");
				$('input[name=username]').css('border-color', "red");
				$('input[name=idChk]').val("invalid");
			}
			 else {
				$('input[name=username]').css('border-color', "green");
				$('.green-text').removeClass("hidden");
				$('input[name=idChk]').val("valid");
			 }
		});
	});
	
});
</script>
  </body>
</html>

