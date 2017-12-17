package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBConnection;

@WebServlet("/UpdateExam")
public class UpdateExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateExam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		DBConnection conn = (DBConnection) DBConnection.CreateConnection();
		
		
		
		request.getRequestDispatcher("View/Exam/UpdateExam.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
