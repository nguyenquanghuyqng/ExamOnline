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
		System.out.println("questiontype controller");
//		System.out.println("trc khi get number");
//		int number = Integer.parseInt(request.getParameter("number1"));
		Connection conn = DBConnection.CreateConnection();

		//List<QuestionType> qtlist = new ArrayList<QuestionType>();
		request.setCharacterEncoding("UTF-8");
		System.out.println("trc khi get number");
		// int number = Integer.parseInt(request.getParameter("number"));
		// int j=1;
		// System.out.println("trc khi get questiontype list");
		// while(j<=number){
		// 	// qtlist.get(j).setQuestiontypeid(sumrow);
		// 	QuestionType qt =  new QuestionType();
		// 	qt.setQuestiontypename(request.getParameter("questiontype"+Integer.toString(j)));
		// 	System.out.println("trong get questiontype list: "+ qt.getQuestiontypename());
		// 	// qtlist.get(j).setQuestiontypename(request.getParameter("questiontype"+j+1));
		// 	// System.out.println("option 0 = "+qtlist.get(j).getQuestiontypename());
		// 	qtlist.add(qt);
		// 	j++;
		// }
		// System.out.println("sau khi get questiontype list");
		// boolean kt = QuestionTypeDAO.InsertQuestionType(qtlist, conn);
		QuestionType qt =  new QuestionType();
		qt.setQuestiontypename(request.getParameter("questiontypename"));
		boolean kt = QuestionTypeDAO.InsertAQuestionType(qt, conn);

//		if (kt) {


		// 	request.getRequestDispatcher("View/Question/UpdateDeleteQuestionType.jsp").forward(request, response);
		// }
		// else {
			request.getRequestDispatcher("View/Question/InsertQuestionType.jsp").forward(request, response);
		}

	}


