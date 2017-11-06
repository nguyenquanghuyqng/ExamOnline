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

import BEAN.AnswerUser;
import BEAN.Question;
import DAO.ExamDAO;
import DB.DBConnection;


@WebServlet("/TestSheetController")
public class TestSheetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public TestSheetController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn= DBConnection.CreateConnection();
		//tra ra so hang cau hoi.
		int countrow=ExamDAO.GetCountRow(conn);
		int diem=0;
		// lay ra danh sach cau tra loi cua user.
		List<AnswerUser> listansweruser= new ArrayList<AnswerUser>();
		
		
		//Lay ra danh sach cau hoi trong do co cau tra loi dung.
		List<Question> listcorrectanswer= ExamDAO.GetCorrectAnswer(conn);
		
		for(int i=1;i<=countrow;i++){
			String answer= request.getParameter("ans["+i+"]");	
//			if(answer!=null){
				AnswerUser au= new AnswerUser();
				au.setAnswer(answer);
				au.setNumber(i);
				listansweruser.add(au);
				
//			else{
//				request.setAttribute("msg", "You must choose all option");
//				List<Question> list= ExamDAO.DisplayQuestion(conn);
//				
//				request.setAttribute("listquiz", list);
//				
//				RequestDispatcher rd= request.getRequestDispatcher("View/TestSheet.jsp");
//				rd.forward(request, response);
//			}
			
		}
		
		
		for(Question qs : listcorrectanswer )
			for(AnswerUser au : listansweruser)
				if(qs.getNumber() == au.getNumber())
				{
					String a = qs.getCorrectoption();
					String b = au.getAnswer();
					if(a.equals(b))
						diem++;
				}
	
		
		// tra ve ket qua duoi dang setAttribute 
		request.setAttribute("diem", diem);
		request.setAttribute("tongDiem", countrow);
		RequestDispatcher rd= request.getRequestDispatcher("View/Result.jsp");
		rd.forward(request, response);
	}

}
