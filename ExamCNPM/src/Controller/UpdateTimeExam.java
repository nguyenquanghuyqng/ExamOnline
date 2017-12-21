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
import DAO.ManageExamDAO;

@WebServlet("/UpdateTimeExam")
public class UpdateTimeExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateTimeExam() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		TestSheet ts = new TestSheet();
		System.out.println("Hello");
		System.out.println(request.getParameter("datetimestart"));
		System.out.println(request.getParameter("datetimeend"));
		System.out.println(request.getParameter("time"));

		ts.setTestid(Integer.parseInt(request.getParameter("testid")));
		ts.setDatetimestart(request.getParameter("datetimestart"));
		ts.setDatetimeend(request.getParameter("datetimeend"));
		ts.setTime(request.getParameter("time"));

		boolean kt = ManageExamDAO.UpdateTimeTestSheet(ts);

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

		List<Exam> listexam = ManageExamDAO.ShowListExam(pageid, count);

		int sumrow = ManageExamDAO.CountRow();

		int maxpageid = (sumrow / count) + 1;

		request.setAttribute("maxpageid", maxpageid);

		request.setAttribute("numberpage", Integer.parseInt(pageidstr));

		request.setAttribute("listexam", listexam);

		request.getRequestDispatcher("View/Exam/EditExam.jsp").forward(request, response);

	}

}
