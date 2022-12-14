<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" type="text/css"/>
    <title>Edit Account Info</title>
  </head>
  <body>
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
        value="<%=user.getId() %>" readonly
      />
      <label for="password">Password</label>
      <input
        name="password"
        id="password"
        type="password"
        placeholder="🔒"
        required
      />
      <label for="password-confirm">password Comfirm</label>
      <input
        name="password-confirm"
        id="password-confirm"
        type="password"
        placeholder="🔐"
        required
      />
      <label for="name">Name</label>
      <input name="name" id="name" type="text" value="<%=user.getName() %>" readonly />
      <label for="mobile-phone">Mobile Phone</label>
      <input
        name="mobie-phone"
        id="mobie-phone"
        type="text"
        placeholder="📱"
        required
      />
      <label for="gender">Gender</label>
      <select name="gender" id="gender" value="<%=user.getGender()%>">
        <option value="">Gender</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
        <option value="other">Other</option>
      </select>
      <label for="birthdate">Date Of Birth</label>
      <input type="date" name="birthdate" id="birthdate" value="<%=user.getBirtDate()%>" />
      <input type="submit" value="Edit Info" />
      <a href="#" onclick = "javascript:history.back();">Cancel</a>
    </form>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>
    
    <!-- javascript -->
    <script type="text/javascript" src="js/clock.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#frm").submit(function(){
    		if($('input[name=password]').val() != $('input[name=password-confirm]').val()) {
    			alert("비밀번호가 일치하지 않습니다");
    			return false;
    		}
    		
      	});
    });
</script>
  </body>
</html>

