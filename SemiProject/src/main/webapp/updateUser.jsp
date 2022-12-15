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
    <title>Edit Account Info</title>
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
      action="updateUser.do"
      method="post"
      id="signup-form"
    >
      <label for="username">Username</label>
      <input
        name="username"
        id="username"
        type="email"
        value="<%=user.getUsername() %>" readonly
      />
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
      <input name="name" id="name" type="text" value="<%=user.getName() %>" readonly />
      <label for="mobilephone">Mobile Phone</label>
      <input
        name="mobilephone"
        id="mobilephone"
        type="text"
        placeholder="📱"
        value="<%=user.getMobilePhone() %>"
      />
      <label for="gender">Gender</label>
      <select name="gender" id="gender" value="<%=user.getGender()%>">
        <option value="">Gender</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
        <option value="other">Other</option>
      </select>
      <input type="submit" value="Edit Info" />
      <a onclick = "javascript:history.back();">Cancel</a>
    </form>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>
    
    <!-- javascript -->
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
	const selectGender = "<%=user.getGender()%>";
	if(selectGender == "female") {
		$('option[value=female]').attr('selected','selected')
	} else if(selectGender == "male") {
		$('option[value=male]').attr('selected','selected')
		
	} else if(selectGender == "other") {
		$('option[value=other]').attr('selected','selected')
	}
	
</script>
  </body>
</html>

