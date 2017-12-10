package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import BEAN.Question;
import BEAN.User;
import DB.DBConnection;


public class ExamDAO {
	
	
	
	public static Time getTime(String username)
	{
		String query = "SELECT tests.time\r\n" + 
				"FROM users\r\n" + 
				"  INNER JOIN users_subjects\r\n" + 
				"    ON users.userid = users_subjects.userid\r\n" + 
				"  INNER JOIN subjects\r\n" + 
				"    ON users_subjects.subjectid = subjects.subjectid\r\n" + 
				"  INNER JOIN tests\r\n" + 
				"	ON subjects.subjectid = tests.subjectid\r\n" + 
				"  where users.username ='"+username+"'";
		Time dt = null;
		try{
			Connection conn = (Connection) DBConnection.CreateConnection();
			PreparedStatement ps=(PreparedStatement) conn.prepareStatement(query);
			
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {

				dt = rs.getTime("time");	

			}
		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return dt;
		
		
		
	}
	
	public static int getNumberQuestion(String subjectid,String testid)
	{
		String query="select * from tests where subjectid=?";
		int id=0;
		try{
			Connection con=DBConnection.CreateConnection();
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,subjectid);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				id=rs.getInt("numberquestion");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return id;
	}
	
	
	@SuppressWarnings("unchecked")
	public static String getQuestion(String question_no,String questiontypeid){
		String query="select * from tests inner join test_question on tests.testid = test_question.testid \r\n" + 
				"	inner join questions on questions.questionid = test_question.questionid where questions.questiontypeid=?;";
		JSONObject obj=new JSONObject();

		try{
			Connection con= DBConnection.CreateConnection();
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,questiontypeid);
			ResultSet rs=ps.executeQuery();
			ResultSet rs1=null;
			
			if(rs.next()){
				// move the cursos to the given row number in this result set object.
				rs.absolute(Integer.parseInt(question_no));
				obj.put("question", rs.getString("contentquestion"));
				obj.put("id", rs.getString("questionid"));
				
				query="select *from questions inner join options on questions.questionid = options.quesitonid "
						+ "where questionid =?;";
				ps=(PreparedStatement) con.prepareStatement(query);
				ps.setString(1,rs.getString("questionid"));
				rs1=ps.executeQuery();
				
				if(rs1.next()){
					rs1.absolute(1);
					obj.put("a", rs1.getString("optionname"));
					
					rs1.absolute(2);
					obj.put("b", rs1.getString("optionname"));
					
					rs1.absolute(3);
					obj.put("c", rs1.getString("optionname"));
					
					rs1.absolute(4);
					obj.put("d", rs1.getString("optionname"));
				}
			}
			
			ps.close();
			rs.close();
			rs1.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return obj.toString();
	}
	
	
	

	

}
