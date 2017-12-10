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
		
		RequestDispatcher rd= request.getRequestDispatcher("View/Result.jsp");
		rd.forward(request, response);
	}

}
