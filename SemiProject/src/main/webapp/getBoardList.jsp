<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/styles.css" type="text/css" />
    <title>Cheer:s Up🍻</title>
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
    <header class="main-header">
      <h1 class="main-header__title">Cheer:s Up🍻</h1>
    </header>

    <div class="main-board">
      <div class="board">
        <div class="search-board">
          <form class="search-form" action="getBoardList.do" method="post">
            <table class="search-input">
              <tr>
                <td>
                  <select name="searchCondition">
                    <option value="TITLE">Title</option>
                    <option value="CONTENT">Content</option>
                  </select>
                  <input type="text" name="searchKeyword" />
                  <input type="submit" value="Search" />
                </td>
              </tr>
            </table>
          </form>
        </div>
        <table class="board-table">
          <colgroup>
            <col />
            <col />
            <col />
            <col />
            <col />
          </colgroup>
          <thead>
            <th>Number</th>
            <th>Title</th>
            <th>Name</th>
            <th>Date</th>
            <th>Views</th>
          </thead>
          <tbody>
            <td>1</td>
            <td>
              <a href="#">안녕하세요</a>
            </td>
            <td>User</td>
            <td>2022.12.14</td>
            <td>0</td>
          </tbody>
        </table>
      </div>
    </div>

    <div class="footer-nav">
      <div><a href="#">Logout</a></div>
      <button>New Cheer:s Up</button>
    </div>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

    <!-- javascript -->
    <script type="text/javascript" src="js/clock.js"></script>
  </body>
</html>
