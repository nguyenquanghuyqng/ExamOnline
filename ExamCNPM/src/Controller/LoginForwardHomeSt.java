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
		String program=null;
		String toeic = null;
		String web = null;
		boolean flag1=true,flag2=true,flag3=true;
		for (Integer sub : subid) {
			// 		    System.out.println("Subjectid : "+sub+" ");
			List<Integer> testid = ExamDAO.getTestID(user, sub);
			for (Integer test : testid) {
				boolean flag = ExamDAO.checkTestTime(user, sub, test);
				if(sub==1 && flag1==true)
				{
					if(flag==true)
					{
						program = "Hava a test";
						request.setAttribute("program", program);
						flag1 = false;
					}
					else
					{
						program = "Don't have a test";
						request.setAttribute("program", program);
					}
				}
				if(sub==2 && flag2 == true)
				{
					if(flag==true)
					{
						toeic = "Hava a test";
						request.setAttribute("toeic", toeic);
						flag2=false;
					}
					else
					{
						toeic = "Don't have a test";
						request.setAttribute("toeic", toeic);
					}
				}
				if(sub==3 && flag3==true)
				{
					if(flag==true)
					{
						web = "Hava a test";
						request.setAttribute("web", web);
						flag3=false;
					}
					else
					{
						web = "Don't have a test";
						request.setAttribute("web", web);
					}
				}
			}
		}
		
		if(program == null)
		{
			program = "Don't have subject";
			request.setAttribute("program", program);
		}
		if(toeic == null)
		{
			toeic = "Don't have subject";
			request.setAttribute("toeic", toeic);
		}
		if(web == null)
		{
			web = "Don't have subject";
			request.setAttribute("web", web);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/HomeStudent.jsp");
		rd.forward(request, response);
	}

}
