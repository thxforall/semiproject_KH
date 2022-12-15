<%@page import="user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <title>Write🍻</title>
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
    <header class="main-header">
      <h1 class="main-header__title">Cheer:s Up🍻</h1>
    </header>

    <div class="getboard-main">
      <form action="insertBoard.do" method="post">
        <input name="seq" type="hidden" value="${board.seq }" />
        <table class="getboard">
          <div class="getboard-title">
            <span>제목</span>
            <div>
              <input type="text" name="title" required />
            </div>
          </div>
          <div class="getboard-writer">
            <span>작성자</span>
            <input type="text" name="writer" value="<%=user.getName() %>" readonly />
          </div>
          <div class="getboard-content">
            <span>내용</span>
            <div>
              <textarea name="content" rows="10" cols="40" required></textarea>
            </div>
          </div>
          <div class="getboard-submit">
            <input type="submit" value="Thank You!" />
          </div>
        </table>
      </form>
    </div>
    <div class="board-footer-nav">
      <div><a href="getBoardList.do">Back</a></div>
    </div>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

    <!-- javascript -->
    <script type="text/javascript" src="js/clock.js"></script>
  </body>
</html>
