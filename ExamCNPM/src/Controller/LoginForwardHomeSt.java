package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ExamDAO;


@WebServlet("/LoginForwardHomeSt")
public class LoginForwardHomeSt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginForwardHomeSt() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String user = (String) session.getAttribute("username");
		List<Integer> subid = ExamDAO.getSubjectID(user);
		for (Integer sub : subid) {
			// 		    System.out.println("Subjectid : "+sub+" ");
			List<Integer> testid = ExamDAO.getTestID(user, sub);
			for (Integer test : testid) {
				boolean flag = ExamDAO.checkTestTime(user, sub, test);
				if(sub==1)
				{
					if(flag==true)
					{
						String program = "Hava a test";
						request.setAttribute("program", program);
					}
					else
					{
						String program = "Don't have a test";
						request.setAttribute("program", program);
					}
				}
				if(sub==2)
				{
					if(flag==true)
					{
						String toeic = "Hava a test";
						request.setAttribute("toeic", toeic);
					}
					else
					{
						String toeic = "Don't have a test";
						request.setAttribute("toeic", toeic);
					}
				}
				if(sub==3)
				{
					if(flag==true)
					{
						String web = "Hava a test";
						request.setAttribute("web", web);
					}
					else
					{
						String web = "Don't have a test";
						request.setAttribute("web", web);
					}
				}
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("/View/HomeStudent.jsp");
		rd.forward(request, response);
	}

}
