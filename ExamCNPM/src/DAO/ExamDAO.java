package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Question;
import BEAN.User;
import DB.DBConnection;


public class ExamDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		DBConnection conn = new DBConnection();
		ExamDAO ex = new ExamDAO();
		List<Question> list=ex.DisplayQuestion(conn.CreateConnection());
		System.out.println(list.get(0).getContentquestion().toString());
	}
	
	
	
	public static List<Question> DisplayQuestion(Connection conn){
		
		List<Question> list= new ArrayList<Question>();
		
		String sql= "select * from questions";
		
		try {
			PreparedStatement ptmt= conn.prepareStatement(sql);
			
			ResultSet rs= ptmt.executeQuery();
			
			while(rs.next()){
				
				int number= rs.getInt("number");
				String contentquestion= rs.getString("contentquestion");
				String option1=rs.getString("option1");
				String option2=rs.getString("option2");
				String option3=rs.getString("option3");
				String option4=rs.getString("option4");
				String correctoption=rs.getString("correctoption");
				
				Question ibt= new Question();
				
				ibt.setNumber(number);
				ibt.setContentquestion(contentquestion);
				ibt.setOption1(option1);
				ibt.setOption2(option2);
				ibt.setOption3(option3);
				ibt.setOption4(option4);
				ibt.setCorrectoption(correctoption);
				
				list.add(ibt);
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
		return list;
	}
	
	public static List<Question> GetCorrectAnswer(Connection conn){
		List<Question> list= new ArrayList<Question>();
		
		String sql= "select * from questions";
		
		try {
			PreparedStatement ptmt= conn.prepareStatement(sql);
			
			ResultSet rs= ptmt.executeQuery();
			
			while(rs.next()){
				
				int number= rs.getInt("number");
				String contentquestion= rs.getString("question");
				String option1=rs.getString("option1");
				String option2=rs.getString("option2");
				String option3=rs.getString("option3");
				String option4=rs.getString("option4");
				String correctoption=rs.getString("correctanswer");
				
				Question ibt= new Question();
				
				ibt.setNumber(number);
				ibt.setContentquestion(contentquestion);
				ibt.setOption1(option1);
				ibt.setOption2(option2);
				ibt.setOption3(option3);
				ibt.setOption4(option4);
				ibt.setCorrectoption(correctoption);
				
				list.add(ibt);
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	
	}

	public static int GetCountRow(Connection conn){
		int count=0;
		
		String sql="select count(*) from questions";
		PreparedStatement ptmt;
		
		try {
			ptmt=conn.prepareStatement(sql);
			
			ResultSet rs=ptmt.executeQuery();
			
			rs.next();
			count=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

}
