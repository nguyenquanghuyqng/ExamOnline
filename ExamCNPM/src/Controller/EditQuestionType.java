package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.QuestionType;
import DAO.QuestionTypeDAO;
import DB.DBConnection;

@WebServlet("/EditQuestionType")
public class EditQuestionType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditQuestionType() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = (Connection) DBConnection.CreateConnection();
		
		int questionid = Integer.parseInt(request.getParameter("index"));
		
		List<QuestionType> list = QuestionTypeDAO.SelectQuestionType(questionid, conn);
		
		request.setAttribute("questiontypes", list);
		
		request.getRequestDispatcher("View/Question/UpdateDeleteQuestionType.jsp").forward(request, response);
		
	}

}
