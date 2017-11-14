
package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.User;
import DAO.LoginDAO;

@WebServlet("/ViewProfile")
public class ViewProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewProfile() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginDAO lgdao = new LoginDAO();
		User us = new User();
		//Khởi tạo đối tượng Session
		HttpSession session = request.getSession(false);
		// Lấy ra username đăng nhập vào
		String user = (String) session.getAttribute("username");
		
		us = lgdao.getUser(user);
		
		request.setCharacterEncoding("UTF-8");
		String fullname = us.getFullname();
		String birthday = us.getBirthday();
		String country = us.getCountry();
		String phone = us.getPhone();
		
		request.setAttribute("fullname", fullname);
		request.setAttribute("birthday", birthday);
		request.setAttribute("country", country);
		request.setAttribute("phone", phone);
		RequestDispatcher rd = request.getRequestDispatcher("View/ViewProfile.jsp");
		rd.forward(request, response);

	}

}

