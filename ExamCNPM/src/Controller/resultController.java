package Controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ExamDAO;

@WebServlet("/resultController")
public class resultController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public resultController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		//// String id=Test.getUserID((String)session.getAttribute("username"));
		int diem = 0;
		String username = (String) session.getAttribute("username");
		int userid = ExamDAO.getUserID(username);
		int subjectid = (int) session.getAttribute("subjectid");
		int testid = (int) session.getAttribute("testid");
		int numberqs = ExamDAO.getNumberQuestion(subjectid, testid);
		LinkedHashMap lhmanswer = (LinkedHashMap) session.getAttribute("all_answers");
		LinkedHashMap lhmcorrect = ExamDAO.getCorrectOption(username, subjectid, testid);
		Set set1 = lhmanswer.entrySet();
		Set set2 = lhmcorrect.entrySet();
		// create loop frist element
		Iterator it1 = set1.iterator();
		Iterator it2 = set2.iterator();
		// return true if inrteration has more elements
		while (it1.hasNext() && it2.hasNext()) {
			Map.Entry as = (Map.Entry) it1.next();
			Map.Entry cr = (Map.Entry) it2.next();
			System.out.println("" + as.getKey().toString() + "  " + as.getValue().toString() + "");

			if (as.getKey().toString().equals(cr.getKey().toString())
					&& as.getValue().toString().equals(cr.getValue().toString())) {
				diem++;
			}

		}

		while (it2.hasNext()) {
			Map.Entry m = (Map.Entry) it2.next();
			System.out.println("" + m.getKey().toString() + "  " + m.getValue().toString() + "");

		}
		ExamDAO.setResult(userid,testid,diem);
		request.setAttribute("numberqs", numberqs);
		request.setAttribute("diem", diem);
		request.setAttribute("tongDiem", ExamDAO.getNumberQuestion(subjectid, testid));

		request.getRequestDispatcher("/View/Result.jsp").forward(request, response);

	}

}
