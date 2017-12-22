package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Exam;
import DAO.ManageExamDAO;
import DB.DBConnection;

@WebServlet("/DeleteExam")
public class DeleteExam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteExam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Khởi tạo kết nối 
		Connection conn = (Connection) DBConnection.CreateConnection();
		
		// Lấy giá trị thông qua việc get Parameter
		int testid = Integer.parseInt(request.getParameter("index"));
		int number = Integer.parseInt(request.getParameter("number"));
		
		boolean kt = ManageExamDAO.DeleteExam(testid, number, conn);
		
		if(kt) {
			System.out.println("Delete exam successfull");
		}
		else {
			System.out.println("Delete exam failed");
		}


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
