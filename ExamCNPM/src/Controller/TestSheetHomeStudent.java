package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TestSheetHomeStudent")
public class TestSheetHomeStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public TestSheetHomeStudent() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd= request.getRequestDispatcher("View/HomeStudent.jsp");
		rd.forward(request, response);
	}

}
