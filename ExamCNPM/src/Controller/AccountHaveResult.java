package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Result;
import DAO.ResultDAO;
import DB.DBConnection;

@WebServlet("/AccountHaveResult")
public class AccountHaveResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AccountHaveResult() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = DBConnection.CreateConnection();
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

		List<Result> list = ResultDAO.DisplayResult(pageid, count, conn);

		int sumrow = ResultDAO.CountRow(conn);

		int maxpageid = (sumrow / count) + 1;

		request.setAttribute("maxpageid", maxpageid);

		request.setAttribute("numberpage", Integer.parseInt(pageidstr));

		request.setAttribute("result", list);

		request.getRequestDispatcher("View/Admin/AccountHaveResult.jsp").forward(request, response);
	}

}
