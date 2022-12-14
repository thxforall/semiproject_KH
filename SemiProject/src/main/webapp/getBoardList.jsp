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
      <!-- 검색 시작 -->
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
        
        <!-- 검색 결과 조회 테이블 -->
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
		<c:forEach items="${boardList }" var="board">
			<tbody>
				<td>${board.seq }</td>
				<td align="left"> <a href="getBoard.do?seq=${board.seq }">${board.title }</a> </td>
				<td>${board.writer }</td>
				<td>${board.regDate }</td>
				<td>${board.cnt }</td>
			</tbody>								
		</c:forEach>
        </table>
      </div>
    </div>

    <div class="footer-nav">
      <div><a href="logout.do">Logout</a></div>
      <button onclick="insertBoard.jsp">New Cheer:s Up</button>
    </div>

    <script
      src="https://kit.fontawesome.com/4bf42f841a.js"
      crossorigin="anonymous"
    ></script>

    <!-- javascript -->
    <script type="text/javascript" src="js/clock.js"></script>
  </body>
</html>
