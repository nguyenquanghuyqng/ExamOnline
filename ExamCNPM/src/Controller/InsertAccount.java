package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Account;
import DAO.AccountDAO;
import DB.DBConnection;
import java.sql.*;
import java.util.List;

@WebServlet("/InsertAccount")
public class InsertAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertAccount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("View/Admin/InsertAccount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		Connection conn = DBConnection.CreateConnection();

		int sumrow = AccountDAO.CountRow(conn);

		Account acc = new Account();
		request.setCharacterEncoding("UTF-8");

		acc.setUsername(request.getParameter("username"));
		acc.setPass(request.getParameter("pass"));
		acc.setFullname(request.getParameter("fullname"));
		acc.setBirthday(request.getParameter("birthday"));
		acc.setCountry(request.getParameter("country"));
		acc.setPhone(request.getParameter("phone"));
		acc.setImage(request.getParameter("image"));
		acc.setRoleid(Integer.parseInt(request.getParameter("roleid")));

		boolean kt = AccountDAO.InsertOneAccount(acc, conn, sumrow+1);

		if (kt) {

			String pageidstr = request.getParameter("pageid");
			// count là số lượng phần tử tối đa hiện ở trang
			int count = 5;

			// Ep kieu Int
			int pageid = Integer.parseInt(pageidstr);

			// Neu pageid == 1 thi se khong phan trang
			// Neu pageid != 1 thi se phan trang

			if (pageid == 1) {

			} else {

				pageid = pageid - 1;
				pageid = pageid * count + 1;

			}

			List<Account> list = AccountDAO.DisplayAccount(pageid, count, conn);

			int maxpageid = (sumrow / count) + 1;

			request.setAttribute("maxpageid", maxpageid);

			request.setAttribute("listemp", list);

			request.setAttribute("numberpage", Integer.parseInt(pageidstr));

			request.setAttribute("account", list);

			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/UpdateDeleteAcount.jsp");
			rd.forward(request, response);
		}
		else {
			request.getRequestDispatcher("View/Admin/InsertAccount.jsp").forward(request, response);
		}

	}

}
