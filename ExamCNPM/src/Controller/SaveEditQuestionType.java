package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.QuestionType;
import DAO.QuestionTypeDAO;
import DB.DBConnection;

@WebServlet("/SaveEditQuestionType")
public class SaveEditQuestionType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveEditQuestionType() {
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
		
		int questiontypeid = Integer.parseInt(request.getParameter("questiontypeid"));
		String questiontypename = request.getParameter("questiontypename");
		
		QuestionType qt = new QuestionType();
		
		qt.setQuestiontypeid(questiontypeid);
		qt.setQuestiontypename(questiontypename);

		
		boolean kt = QuestionTypeDAO.UpdateData(request, questiontypeid, qt, conn);
		if (kt) {
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
			
			List<QuestionType> list = QuestionTypeDAO.DisplayQuestionType(pageid, count, conn);
			
			int sumrow=QuestionTypeDAO.CountRow(conn);
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
			
			request.setAttribute("listemp", list);
			
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setCharacterEncoding("utf-8");
			
//			request.setAttribute("questiontypes", list);
			
			RequestDispatcher rd= request.getRequestDispatcher("View/Question/UpdateDeleteQuestionType.jsp");
			rd.forward(request, response);
		}
		else {
						
			List<QuestionType> list = QuestionTypeDAO.SelectQuestionType(questiontypeid, conn);
			
			request.setAttribute("questiontypes", list);
			
			request.getRequestDispatcher("View/Question/EditQuestionType.jsp").forward(request, response);
			
		}
		
	}

}
