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

import BEAN.Result;
import DAO.ResultDAO;
import DB.DBConnection;

@WebServlet("/DeleteResult")
public class DeleteResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteResult() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
		Connection conn = (Connection) DBConnection.CreateConnection();
		
		int resultid = Integer.parseInt(request.getParameter("index"));
		
		boolean kt = ResultDAO.DeleteResult(resultid,conn);
		
		if (kt) {

		List<Result> list = ResultDAO.DisplayResult(pageid, count, conn);
		
		int sumrow=ResultDAO.CountRow(conn);
		
		int maxpageid= (sumrow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		
		request.setAttribute("listemp", list);
		
		request.setAttribute("numberpage", Integer.parseInt(pageidstr));
		
		request.setAttribute("result", list);
		
		RequestDispatcher rd= request.getRequestDispatcher("View/Admin/EditResult.jsp");
		rd.forward(request, response);
		}

		else {
			
			request.setAttribute("error", "Xóa tài khoản thất bại");
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/EditResult.jsp");
			rd.forward(request, response);
		}
		
	}

}
