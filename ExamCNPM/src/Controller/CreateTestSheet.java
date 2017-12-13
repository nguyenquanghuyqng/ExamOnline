package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.TestSheet;
import DAO.AccountDAO;
import DAO.ManageExamDAO;

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
		
		TestSheet ts = new TestSheet();
		System.out.println("Hello Huy");
		
		System.out.println(request.getParameter("testid"));
		System.out.println(request.getParameter("classid"));
		System.out.println(request.getParameter("timestart"));
		System.out.println(request.getParameter("timeend"));
		System.out.println(request.getParameter("time"));
		System.out.println(request.getParameter("testtypeid"));
		System.out.println(request.getParameter("subjectid"));
		System.out.println(request.getParameter("number"));
		
		ts.setTestid(Integer.parseInt(request.getParameter("testid")));
		ts.setClassid(Integer.parseInt(request.getParameter("classid")));
		ts.setDatetimestart(request.getParameter("datetimestart"));
		ts.setDatetimeend(request.getParameter("datetimeend"));
		ts.setTime(request.getParameter("time"));
		ts.setTesttypeid(Integer.parseInt(request.getParameter("testtypeid")));
		ts.setSubjectid(Integer.parseInt(request.getParameter("subjectid")));
		ts.setNumber(Integer.parseInt(request.getParameter("number")));
		
		
		
		
		boolean kt = ManageExamDAO.CreateTestSheet(ts);
		
		if(kt) {
			System.out.println("Create Exam Succesfully");
		}
		
		
		
	}

}
