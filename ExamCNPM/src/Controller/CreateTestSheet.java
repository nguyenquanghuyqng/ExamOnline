package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Exam;
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
		
		System.out.println("Hello");
		System.out.println(request.getParameter("classid"));
		
		ts.setClassid(Integer.parseInt(request.getParameter("classid")));
		ts.setDatetimestart(request.getParameter("timestart"));
		ts.setDatetimeend(request.getParameter("timeend"));
		ts.setTime(request.getParameter("time"));
		ts.setTesttypeid(Integer.parseInt(request.getParameter("testtypeid")));
		ts.setSubjectid(Integer.parseInt(request.getParameter("subjectid")));
		ts.setQuestiontypeid(Integer.parseInt(request.getParameter("questiontypeid")));
		ts.setNumber(Integer.parseInt(request.getParameter("number")));
		
		boolean kt = ManageExamDAO.CreateTestSheet(ts);
		
		if(kt) {
			
			String pageidstr= request.getParameter("pageid");
			// count là số lượng phần tử tối đa hiện ở trang
			int count =5;
			
			// Ep kieu Int
			int pageid=Integer.parseInt(pageidstr);
			
			// Neu pageid == 1 thi se khong phan trang
			// Neu pageid != 1 thi se phan trang
			
			if(pageid==1){
				
			}
			else{
				
				pageid=pageid-1;
				pageid=pageid*count + 1;
				
			}
			
			List<Exam> listexam = ManageExamDAO.ShowListExam(pageid, count);
			
			int sumrow=ManageExamDAO.CountRow();
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
					
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setAttribute("listexam", listexam);
			
			request.getRequestDispatcher("View/Exam/EditExam.jsp").forward(request, response);
			
		}
		else {
			request.getRequestDispatcher("View/Exam/CreateTestSheet.jsp").forward(request, response);
		}
		
		
	}

}
