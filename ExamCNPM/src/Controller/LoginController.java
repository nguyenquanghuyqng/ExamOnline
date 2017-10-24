package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import BEAN.User;
import DAO.LoginDAO;
import DB.DBConnection;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("View/HomeLogin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = new User();

		user.setUsername(username);
		user.setPassword(password);

		try {

			boolean kt = LoginDAO.LoginUser(username, password, conn);

			if (kt) {
				RequestDispatcher rd = request.getRequestDispatcher("View/HomeStudent.jsp");
				rd.forward(request, response);

			}

			boolean roleid = LoginDAO.LoginAdmin(username, password, conn);

			if (roleid) {

				RequestDispatcher rd = request.getRequestDispatcher("View/Admin/HomeAdmin.jsp");
				rd.forward(request, response);

			}

			boolean exammanager = LoginDAO.ExamManager(username, password, conn);

			if (exammanager) {

				RequestDispatcher rd = request.getRequestDispatcher("View/Exam/HomeExam.jsp");
				rd.forward(request, response);

			}
			
			boolean quesiton = LoginDAO.LoginQuestion(username, password, conn);

			if (quesiton) {

				RequestDispatcher rd = request.getRequestDispatcher("View/Question/HomeQuestion.jsp");
				rd.forward(request, response);

			}

			else {
				request.setAttribute("message", "Login Failed");
				RequestDispatcher rd = request.getRequestDispatcher("View/HomeLogin.jsp");
				rd.forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
