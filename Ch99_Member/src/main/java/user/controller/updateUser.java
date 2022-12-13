package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserVO;
import user.model.impl.UserDAO;

@WebServlet("/updateUser.do")
public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public updateUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 입력정보 추출
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String role = request.getParameter("role");
		
		
		// DB연동
		UserVO vo = new UserVO();
		vo.setPassword(password);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setRole(role);
		vo.setId(id);
		
		UserDAO userDAO = new UserDAO();
		userDAO.updateUser(vo);
		
		response.sendRedirect("main.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
