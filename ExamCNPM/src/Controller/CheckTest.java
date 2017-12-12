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

/**
 * Servlet implementation class CheckTest
 */
@WebServlet("/CheckTest")
public class CheckTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckTest() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String abc = request.getParameter("data");
		int idMon = Integer.parseInt(abc);
		System.out.println("Number:  "+idMon);
		int sid = 0;
		int tsid = 0;
		String user = (String) session.getAttribute("username");
		List<Integer> subid = ExamDAO.getSubjectID(user);
		for (Integer sub : subid) {
			// 		    System.out.println("Subjectid : "+sub+" ");
			List<Integer> testid = ExamDAO.getTestID(user, sub);
			for (Integer test : testid) {
				boolean flag = ExamDAO.checkTestTime(user, sub, test);
				if (sub == 2 && idMon == 2) {
					if (flag == true) {
						sid = sub;
						tsid = test;
						session.setAttribute("subjectid", sid);
						session.setAttribute("testid", tsid);
						RequestDispatcher rd= request.getRequestDispatcher("/TestSheetForward");
						rd.forward(request, response);
						//System.out.println("Testid "+test+" ");  
					}
				}
					

				if (sub == 1 && idMon == 1) {
					if (flag == true) {
						sid = sub;
						tsid = test;
						session.setAttribute("subjectid", sid);
						session.setAttribute("testid", tsid);
						RequestDispatcher rd= request.getRequestDispatcher("/TestSheetForward");
						rd.forward(request, response);
					}
					//System.out.println("Testid "+test+" ");  
				}

				if (sub == 3 && idMon == 3) {
					if (flag == true) {
						sid = sub;
						tsid = test;
						session.setAttribute("subjectid", sid);
						session.setAttribute("testid", tsid);
						RequestDispatcher rd= request.getRequestDispatcher("/TestSheetForward");
						rd.forward(request, response);

					}
					//System.out.println("Testid "+test+" ");  
				}

			}
		}
		RequestDispatcher rd= request.getRequestDispatcher("/View/HomeStudent.jsp");
		rd.forward(request, response);
	}

}
