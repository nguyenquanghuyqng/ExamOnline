package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.QuestionType;
import DAO.QuestionTypeDAO;
import DB.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/InsertQuestionType")
public class InsertQuestionType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertQuestionType() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("View/Question/InsertQuestionType.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = DBConnection.CreateConnection();

		int sumrow = QuestionTypeDAO.CountRow(conn);

		List<QuestionType> qtlist = new ArrayList<QuestionType>();
		request.setCharacterEncoding("UTF-8");
		int j=0;
		while(j<qtlist.size()){
			// qtlist.get(j).setQuestiontypeid(sumrow);
			qtlist.get(j).setQuestiontypename(request.getParameter("questiontypename[]"));
			j++;
		}
		boolean kt = QuestionTypeDAO.InsertQuestionType(qtlist, conn);

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

			List<QuestionType> list = QuestionTypeDAO.DisplayQuestionType(pageid, count, conn);

			int maxpageid = (sumrow / count) + 1;

			request.setAttribute("maxpageid", maxpageid);

			request.setAttribute("listemp", list);

			request.setAttribute("numberpage", Integer.parseInt(pageidstr));

			request.setAttribute("questiontypes", list);

			request.getRequestDispatcher("View/Question/UpdateDeleteQuestionType.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("View/Question/InsertQuestionType.jsp").forward(request, response);
		}

	}

}
