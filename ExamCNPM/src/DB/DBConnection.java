package DB;
import java.sql.*;
public class DBConnection {
	public static Connection CreateConnection(){
		Connection conn= null;

		String url="jdbc:mysql://localhost:3306/examonline";
		String username="root";
		String password="1234";
		
//		String host= "node16809-examonline.kilatiron.com/examonline?useUnicode=true&amp;characterEncoding=utf8";
//		String url="jdbc:mysql://"+host+"/examonline";
//		String username="root";
//		String password="KMQeii39580";
//		
//		String url="jdbc:mysql://node16816-examonlinevn.kilatiron.com/examonline?useUnicode=true&amp;characterEncoding=utf8";
//		String username="root";
//		String password="PSSmqz60857";

		try {
			// load Driver
			Class.forName("com.mysql.jdbc.Driver");
			
			// create connection
			conn = DriverManager.getConnection(url,username,password);
			
			System.out.println("Connected successfully hihi...");
		} 
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(SQLException ex){
			ex.printStackTrace();
			System.out.println("Error connection " + ex);
		}

		return conn;
	}
}
