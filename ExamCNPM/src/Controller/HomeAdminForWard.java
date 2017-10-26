package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeAdminForWard")
public class HomeAdminForWard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeAdminForWard() {
		super();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/HomeAdmin.jsp");
		rd.forward(request, response);
	}

}
