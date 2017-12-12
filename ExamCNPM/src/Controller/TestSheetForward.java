package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ExamDAO;
import DB.DBConnection;


@WebServlet("/TestSheetForward")
public class TestSheetForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TestSheetForward() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn= DBConnection.CreateConnection();
		HttpSession session=request.getSession(false);
		int subjectid = (int) session.getAttribute("subjectid");
		System.out.println(subjectid);
		int testid = (int) session.getAttribute("testid");
		System.out.println(testid);
		
		//lay tong so cau hoi
		int numberqs = ExamDAO.getNumberQuestion(subjectid, testid);
		
		// lay ra question id
		int qsID = ExamDAO.getQuestionID(subjectid, testid);
		
		//lay ra question type id
		int qstypeID = ExamDAO.getQuestionTypeID(subjectid, testid);
		
		//lay ra gio thi trong bai thi
		Date time =  ExamDAO.getTime("trung",subjectid,testid);
		Calendar calendar = GregorianCalendar.getInstance(); // creates a new calendar instance
		calendar.setTime(time);   // assigns calendar to given date 
		int hours = calendar.get(Calendar.HOUR_OF_DAY); // gets hour in 24h format
		int minute = calendar.get(Calendar.MINUTE);        // gets hour in 12h format
		int second = calendar.get(Calendar.SECOND);       // gets month number, NOTE this is zero based!
		System.out.println(""+hours+""+minute+""+second+"");
		request.setAttribute("hours", hours);
		request.setAttribute("minute", minute);
		request.setAttribute("second", second);
		request.setAttribute("numberqs", numberqs);
		request.setAttribute("qsID", qsID);
		session.setAttribute("qstypeID", qstypeID);
		RequestDispatcher rd= request.getRequestDispatcher("View/TestSheet.jsp");
		rd.forward(request, response);
	}

}
