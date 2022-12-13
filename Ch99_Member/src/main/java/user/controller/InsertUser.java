package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserVO;
import user.model.impl.UserDAO;

@WebServlet("/insertUser.do")
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력정보 추출
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		String tel = request.getParameter("tel");
		
		
		
		// 2.DB 연동
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setEmail(email);
		vo.setRole(role);
		vo.setTel(tel);
		
		
		UserDAO userDAO = new UserDAO();
		userDAO.insertUser(vo); // insert sql 문 작성
		
		response.sendRedirect("login.jsp");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
