package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import BEAN.Account;
import DAO.AccountDAO;
import DB.DBConnection;

@WebServlet("/SaveEditAccount")
public class SaveEditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveEditAccount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = (Connection) DBConnection.CreateConnection();

		request.setCharacterEncoding("UTF-8");
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String fullname = request.getParameter("fullname");
		String birthday = request.getParameter("birthday");
		String country = request.getParameter("country");
		String phone = request.getParameter("phone");
		String image = request.getParameter("image");
		int roleid = Integer.parseInt(request.getParameter("roleid"));
		int classid = Integer.parseInt(request.getParameter("classid"));
		
		Account acc = new Account();
		
		acc.setUsername(username);
		acc.setPass(pass);
		acc.setFullname(fullname);
		acc.setBirthday(birthday);
		acc.setCountry(country);
		acc.setPhone(phone);
		acc.setImage(image);
		acc.setRoleid(roleid);
		acc.setClassid(classid);
		
		boolean kt = AccountDAO.UpdateData(request, userid, acc, conn);
		if (kt) {
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
			
			List<Account> list = AccountDAO.DisplayAccount(pageid, count, conn);
			
			int sumrow=AccountDAO.CountRow(conn);
			
			int maxpageid= (sumrow/count)+1;
			
			request.setAttribute("maxpageid", maxpageid);
			
			request.setAttribute("listemp", list);
			
			request.setAttribute("numberpage", Integer.parseInt(pageidstr));
			
			request.setCharacterEncoding("utf-8");
			
			request.setAttribute("account", list);
			
			RequestDispatcher rd= request.getRequestDispatcher("View/Admin/UpdateDeleteAcount.jsp");
			rd.forward(request, response);
		}
		else {
						
			List<Account> list = AccountDAO.SelectAccount(userid, conn);
			
			request.setAttribute("account", list);
			
			request.getRequestDispatcher("View/Admin/EditAccount.jsp").forward(request, response);
			
		}
		
	}

}
