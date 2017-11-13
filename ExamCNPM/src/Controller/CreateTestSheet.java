package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateTestSheet")
public class CreateTestSheet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateTestSheet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("View/Exam/CreateTestSheet.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		request.getParameter("classid");
		request.getParameter("timestart");
		request.getParameter("timeend");
		request.getParameter("testtypeid");
		request.getParameter("questiontypeid");
		
		
		
	}

}
