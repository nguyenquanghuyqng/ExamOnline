package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Account;
import DAO.AccountDAO;
import DB.DBConnection;

@WebServlet("/EditAccount")
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditAccount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = (Connection) DBConnection.CreateConnection();
		
		int userid = Integer.parseInt(request.getParameter("index"));
		
		List<Account> list = AccountDAO.SelectAccount(userid, conn);
		
		request.setAttribute("account", list);
		
		request.getRequestDispatcher("View/Admin/EditAccount.jsp").forward(request, response);
		
	}

}
