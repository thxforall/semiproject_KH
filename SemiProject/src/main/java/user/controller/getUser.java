package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.UserVO;
import user.model.impl.UserDAO;

@WebServlet("/getUser.do")
public class getUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public getUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("usernmae");
		
		UserVO vo = new UserVO();
		vo.setUsername(username);
		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("authUser", user);
		response.sendRedirect("updateuser.jsp?");
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
