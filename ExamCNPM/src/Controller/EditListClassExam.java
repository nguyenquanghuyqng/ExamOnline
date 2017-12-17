package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.ClassExam;
import DAO.ManageExamDAO;
import DB.DBConnection;

@WebServlet("/EditListClassExam")
public class EditListClassExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditListClassExam() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = DBConnection.CreateConnection();
		
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
		
		List<ClassExam> list = ManageExamDAO.DisplayListClassExam(pageid, count, conn);
		
		int sumrow=ManageExamDAO.CountRow();
		
		int maxpageid= (sumrow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
				
		request.setAttribute("numberpage", Integer.parseInt(pageidstr));
		
		
		request.setAttribute("classexam", list);
		
		request.getRequestDispatcher("View/Exam/ListClassExam.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
