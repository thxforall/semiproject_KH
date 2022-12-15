package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import user.model.UserVO;
import user.model.impl.UserDAO;

@WebServlet("/checkID.do")
public class CheckIDController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckIDController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력 정보 추출
		String username = request.getParameter("username");
		
		// 2. DB 연동 처리
		UserVO vo = new UserVO();
		vo.setUsername(username);
		
		UserDAO userDAO = new UserDAO();
		String newUsername = userDAO.existUsername(vo);
		
		JSONObject usernameJson = new JSONObject();
		usernameJson.put("username", newUsername);
		response.setContentType("application/json");
		
		// {"id" : "1111"}
		System.out.println(usernameJson);
		PrintWriter out = response.getWriter();
		out.print(usernameJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
