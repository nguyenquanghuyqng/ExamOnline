package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import BEAN.User;
import DAO.EditUserDAO;
import DB.DBConnection;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProfile() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = (Connection) DBConnection.CreateConnection();
		// Khởi tạo đối tượng Session
		HttpSession session = request.getSession(false);
		// Lấy ra username đăng nhập vào
		String username = (String) session.getAttribute("username");
		String name = request.getParameter("fullname");
		System.out.println("Full :" + name);
		User us = new User();

		// set all the values in User's class object.
		us.setUsername(username);
		us.setFullname(request.getParameter("fullname"));
		us.setBirthday(request.getParameter("birthday"));
		us.setCountry(request.getParameter("country"));
		us.setPhone(request.getParameter("phone"));
		boolean flag = EditUserDAO.UpdateUser(us, conn);

		if (flag == true) {
			RequestDispatcher rd = request.getRequestDispatcher("View/ViewProfile.jsp");
			rd.forward(request, response);
		}
	}

}
