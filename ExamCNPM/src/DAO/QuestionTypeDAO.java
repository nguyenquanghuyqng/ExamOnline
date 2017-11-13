package DAO;
import java.sql.*;
import java.util.*;
import BEAN.QuestionType;
public class QuestionTypeDAO {
	
	public static List<QuestionType> DisplayQuestionType(int start, int count ,Connection conn) {

		List<QuestionType> list = new ArrayList<QuestionType>();

		String sql = "select * from questiontype limit "+(start-1)+", "+count+"";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				
				QuestionType qst = new QuestionType();

				qst.setQuestiontypeid(rs.getInt("questiontypeid"));
				qst.setQuestiontypename(rs.getString("questiontypename"));
				
				list.add(qst);
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	public static List<QuestionType> DisplayQuestionType_2(Connection conn) {

		List<QuestionType> list = new ArrayList<QuestionType>();

		String sql = "select * from questiontype";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				QuestionType qst = new QuestionType();

				qst.setQuestiontypeid(rs.getInt("questiontypeid"));
				qst.setQuestiontypename(rs.getString("questiontypename"));
				
				list.add(qst);
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	
	public static boolean DeleteQuestionType(int QuestionTypeid, Connection conn) {

		boolean t = false;

		String sql = "Delete From questiontype Where questiontypeid =?";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, QuestionTypeid);
			stmt.executeUpdate();
			t = true;
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
		
		public static int CountRow(Connection conn){
			
			int count=0;
			
			String sql= "select count(*) from questiontype";
			
			PreparedStatement ptmt;
			try {
				
				ptmt = conn.prepareStatement(sql);
				
				ResultSet rs= ptmt.executeQuery();
				
				rs.next();
				
				count= rs.getInt(1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return count;
			
		}
}
