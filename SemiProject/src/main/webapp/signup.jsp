<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" />
    <title>Sign Up</title>
  </head>
  <body>
    <div class="status-bar">
      <div class="status-bar__column">
        <span>No Service</span>
        <i class="fa-solid fa-wifi"></i>
      </div>
      <div class="status-bar__column">
        <span>18:43</span>
      </div>
      <div class="status-bar__column">
        <span>110%</span>
        <i class="fa-solid fa-battery-full fa-lg"></i>
        <i class="fa-solid fa-bolt-lightning"></i>
      </div>
    </div>

    <header class="signup-header">
      <h1 class="signup-header__title">Cheer:s Up🍻</h1>
    </header>

    <form
      action="../kokoa-clone-2022/friends.html"
      method="get"
      id="signup-form"
    >
      <label for="username">Username</label>
      <input
        name="username"
        id="username"
        type="email"
        placeholder="@cheersup.com"
        required
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
      <input name="name" id="name" type="text" required />
      <label for="mobile-phone">Mobile Phone</label>
      <input
        name="mobie-phone"
        id="mobie-phone"
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
      <a href="#">Cancle</a>
    </form>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>

