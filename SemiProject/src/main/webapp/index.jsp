<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" />
    <title>Welcome to Cheer:s Up🍻</title>
  </head>
  <body>
  	
    <div class="status-bar">
      <div class="status-bar__column">
        <span>No Service</span>
        <i class="fa-solid fa-wifi"></i>
      </div>
      <div id="time-box" class="status-bar__column">
        <span>11:11</span>
      </div>
      <div class="status-bar__column">
        <span>110%</span>
        <i class="fa-solid fa-battery-full fa-lg"></i>
        <i class="fa-solid fa-bolt-lightning"></i>
      </div>
    </div>

    <header class="welcome-header">
      <h1 class="welcome-header__title">Welcome to Cheer:s Up🍻</h1>
      <p class="welcome-header__text">
        If you have a "Cheer:s Up" Account, log in with your email or phone number.
      </p>
    </header>

    <form
      action="../kokoa-clone-2022/friends.html"
      method="get"
      id="login-form"
    >
      <input name="username" type="text" placeholder="Email or phone number" />
      <input name="password" type="password" placeholder="Password" />
      <input type="submit" value="Log In" />
      <a>Create Account</a>
    </form>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
