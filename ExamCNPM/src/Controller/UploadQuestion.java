package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BEAN.Question;
import DAO.QuestionDAO;
import DAO.UploadQuestionDAO;
import DB.DBConnection;

@WebServlet("/UploadQuestion")
@MultipartConfig
public class UploadQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UploadQuestion() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
//		String path = request.getParameter("file");
		System.out.println("Get Part");
		
		Part filePath = request.getPart("file");
		
		System.out.println("Path" + filePath);
		
		
		System.out.println("Start import excel");
		UploadQuestionDAO.ImportExcel(request, response, conn, filePath);

//		conn = DBConnection.CreateConnection();
		
		// Lấy danh sach question dua vao list
		System.out.println("Show date ");
		List<Question> list = QuestionDAO.DisplayQuestion(pageid, count, conn);

		int sumrow=QuestionDAO.CountRow(conn);
		
		int maxpageid= (sumrow/count)+1;
		
		request.setAttribute("maxpageid", maxpageid);
		
		request.setAttribute("numberpage", Integer.parseInt(pageidstr));
		
		request.setAttribute("questions", list);

		RequestDispatcher rd = request.getRequestDispatcher("View/Question/InsertQuestion.jsp");
		
		rd.forward(request, response);
	}

}
