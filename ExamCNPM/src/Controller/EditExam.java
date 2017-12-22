package Controller;

import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import DAO.ManageExamDAO;
import BEAN.Exam;
@WebServlet("/EditExam")
public class EditExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditExam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Lấy số trang
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
		
		List<Exam> listexam = ManageExamDAO.ShowListExam(pageid, count);
		
		int sumrow=ManageExamDAO.CountRow();
		
		int maxpageid= (sumrow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
				
		request.setAttribute("numberpage", Integer.parseInt(pageidstr));
		
		request.setAttribute("listexam", listexam);
		
		request.getRequestDispatcher("View/Exam/EditExam.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
