package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import BEAN.Question;
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
		
		
		
		RequestDispatcher rd= request.getRequestDispatcher("View/TestSheet.jsp");
		rd.forward(request, response);
	}

}
