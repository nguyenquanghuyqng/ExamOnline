package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Question_01;
import BEAN.Question;
import BEAN.Option;
import DAO.QuestionDAO;
import DB.DBConnection;

@WebServlet("/SaveEditQuestion")
public class SaveEditQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveEditQuestion() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = (Connection) DBConnection.CreateConnection();

		request.setCharacterEncoding("UTF-8");

		Question_01 qt = new Question_01();

		qt.setQuestionid(Integer.parseInt(request.getParameter("questionid")));
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
				o.setOptionid(Integer.parseInt(request.getParameter("option" + j)));
				o.setOptionname((char) (65 + j) + ". " + request.getParameter("option" + j));
				System.out.println(o.getOptionname());
				System.out.println(request.getParameter("optionCheck" + j));
				if (request.getParameter("optionCheck" + j) != null) {
					o.setIsanswer(true);
					qt.setCorrectoption(String.valueOf((char) (65 + j)));
				} else
					o.setIsanswer(false);
				op.add(o);
				j++;
			}

			System.out.println("start update" + qt.getCorrectoption());

			boolean kt = QuestionDAO.UpdateData(request, qt, op, conn);
			if (kt) {
				String pageidstr = request.getParameter("pageid");
				// count là số lượng phần tử tối đa hiện ở trang
				int count = 5;

				// Ep kieu Int
				int pageid = Integer.parseInt(pageidstr);

				// Neu pageid == 1 thi se khong phan trang
				// Neu pageid != 1 thi se phan trang

				if (pageid == 1) {

				} else {

					pageid = pageid - 1;
					pageid = pageid * count + 1;

				}

				List<Question> list = QuestionDAO.DisplayQuestion(pageid, count, conn);

				int sumrow = QuestionDAO.CountRow(conn);

				int maxpageid = (sumrow / count) + 1;

				request.setAttribute("maxpageid", maxpageid);

				request.setAttribute("listemp", list);

				request.setAttribute("numberpage", Integer.parseInt(pageidstr));

				request.setCharacterEncoding("utf-8");

				//			request.setAttribute("Questions", list);

				RequestDispatcher rd = request.getRequestDispatcher("View/Question/UpdateDeleteQuestion.jsp");
				rd.forward(request, response);
			} else {

				List<Question> list = QuestionDAO.SelectQuestion(qt.getQuestionid(), conn);
				request.setAttribute("questions", list);
				request.getRequestDispatcher("View/Question/EditQuestion.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
