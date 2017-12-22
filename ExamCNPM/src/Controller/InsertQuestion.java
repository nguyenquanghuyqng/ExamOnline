package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Question_01;
import BEAN.Subject;
import DAO.QuestionDAO;
import DAO.QuestionTypeDAO;
import DAO.SubjectDAO;
import DB.DBConnection;
import BEAN.Option;
import BEAN.QuestionType;

@WebServlet("/InsertQuestion")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertQuestion() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("View/Question/InsertQuestion.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Start controller");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();

		int sumrow = QuestionDAO.CountRow(conn);
		Question_01 qt = new Question_01();
		request.setCharacterEncoding("UTF-8");

		System.out.println("before getting number");
		qt.setNumber(Integer.parseInt(request.getParameter("number")));
		System.out.println("get number:"+ qt.getNumber());
		System.out.println("tip neh");
		qt.setContentquestion(request.getParameter("contentquestion"));
		qt.setCorrectoption(request.getParameter("correctoption"));
		qt.setMediaid(Integer.parseInt(request.getParameter("mediaid")));
		qt.setQuestiontypeid(Integer.parseInt(request.getParameter("questiontypeid")));

		try {
			boolean kt = QuestionDAO.InsertQuestion(qt, conn);

			List<Option> op = new ArrayList<Option>();
			request.setCharacterEncoding("UTF-8");
			int j = 1;
			while (j <= qt.getNumber()) {
				// qtlist.get(j).setQuestiontypeid(sumrow);
				Option o = new Option();
				o.setOptionname(request.getParameter("optionname"+j));
				if(request.getParameter("optionCheck"+j)=="true")
				{
					o.setIsanswer(true);
				}
				else
					o.setIsanswer(false);
				
				// op.get(j).setOptionname(request.getParameter("optionname[]"));
				//op.get(j).setIsanswer(request.getstat);
				op.add(o);
				j++;
			}

			QuestionDAO.InsertOptions(op, conn);

			if (kt) {


				// String pageidstr = request.getParameter("pageid");
				// int count = 5;

				// // Ep kieu Int
				// int pageid = Integer.parseInt(pageidstr);

				// Neu pageid == 1 thi se khong phan trang
				// Neu pageid != 1 thi se phan trang

				// if (pageid == 1) {
				// } else {

				// 	pageid = pageid - 1;
				// 	pageid = pageid * count + 1;
				// }

				List<QuestionType> questiontypes = QuestionTypeDAO.DisplayQuestionType(1, 20, conn);
				List<Subject> subjects = SubjectDAO.DisplaySubject(1, 20, conn);

				// int maxpageid = (sumrow / count) + 1;

				// request.setAttribute("maxpageid", maxpageid);

				// request.setAttribute("numberpage", Integer.parseInt(pageidstr));

				request.setAttribute("questiontypes", questiontypes);
				request.setAttribute("subjects", subjects);

				request.getRequestDispatcher("View/Question/UpdateDeleteQuestion.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("View/Question/InsertQuestion.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}