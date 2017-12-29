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
import javax.servlet.http.Part;
import java.nio.file.Paths;
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

		Question_01 qt = new Question_01();
		request.setCharacterEncoding("UTF-8");

		System.out.println("before getting number");
		System.out.println("get number:" + request.getParameter("number"));
		System.out.println("tip neh");
		System.out.println("content = " + (request.getParameter("contentquestion")));
		System.out.println("questiontypeid = " + request.getParameter("questiontypeid1"));
//
//		System.out.println("Get Part");
//		System.out.println("media = " + request.getParameter("media"));
//		Part filePath = request.getPart("media");
//		
//		System.out.println("Path" + filePath);
//		
		
		System.out.println("Start import excel");
		System.out.println("media = " + request.getParameter("media"));
		qt.setNumber(Integer.parseInt(request.getParameter("number")));
		qt.setContentquestion(request.getParameter("contentquestion"));
		//qt.setMediaid(Integer.parseInt(request.getParameter("media")));
		qt.setQuestiontypeid(Integer.parseInt(request.getParameter("questiontypeid1")));

		try {
			List<Option> op = new ArrayList<Option>();
			request.setCharacterEncoding("UTF-8");
			int j = 0;
			
			while (j < qt.getNumber()) {
				Option o = new Option();

				o.setOptionname((char) (65 + j) + ". " + request.getParameter("option" + j));
				System.out.println(o.getOptionname());
				System.out.println(request.getParameter("optionCheck" + j));
				if (request.getParameter("optionCheck" + j) != null) {
					o.setIsanswer(true);
//					qt.setCorrectoption(qt.getCorrectoption()+ String.valueOf((char) (65 + j))+";");
					qt.setCorrectoption(String.valueOf((char) (65 + j)));
				} else
					o.setIsanswer(false);
				op.add(o);
				j++;
			}
			
			System.out.println("qt.correctoption= "+qt.getCorrectoption());
			boolean kt = QuestionDAO.InsertQuestion(qt, conn);
			QuestionDAO.InsertOptions(op, conn);

			List<QuestionType> questiontypes = QuestionTypeDAO.DisplayQuestionType(1, 20, conn);
			List<Subject> subjects = SubjectDAO.DisplaySubject(1, 20, conn);

			request.setAttribute("questiontypes", questiontypes);
			request.setAttribute("subjects", subjects);
			request.getRequestDispatcher("View/Question/InsertQuestion.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}