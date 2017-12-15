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

import BEAN.Account;
import DAO.AccountDAO;
import DB.DBConnection;

@WebServlet("/ViewListClassExam")
public class ViewListClassExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewListClassExam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		Connection conn = DBConnection.CreateConnection();
		
		List<Account> list = AccountDAO.DisplayAccount(pageid, count, conn);
		
		int sumrow=AccountDAO.CountRow(conn);
		
		int maxpageid= (sumrow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		
		request.setAttribute("listemp", list);
		
		request.setAttribute("numberpage", Integer.parseInt(pageidstr));
		
		request.setAttribute("account", list);
		
		RequestDispatcher rd= request.getRequestDispatcher("View/Exam/ViewListUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}

}
