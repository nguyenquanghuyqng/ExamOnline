package DAO;

import java.sql.*;
import java.util.*;
import BEAN.Question;
import BEAN.Option;
import DB.DBConnection;
public class QuestionDAO {

	public static String getQuestiontypename(int questiontypeid)
	{
		String name=null;
		Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select questiontypename from questiontypes t where questiontypeid=?";

		try {
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, questiontypeid);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("questiontypename");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return name;
	}

	public static String getOptions(int questionid)
	{
		String options="";
		Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select *from options where questionid =?;";

		try {
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, questionid);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				options+=(rs.getString("optionname")+"    \r\n");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String text= options.toString();
		return options;
	}
	

	public static List<Question> DisplayQuestion(int start, int count, Connection conn) {

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from questions limit " + (start - 1) + ", " + count + "";
		//String sqlop= "select *from options  where questionid =?;";
		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();
			//ResultSet rsop=null;

			while (rs.next()) {

				Question qs = new Question();

				qs.setQuestionid(rs.getInt("questionid"));
				qs.setQuestiontype(getQuestiontypename(rs.getInt("questiontypeid")));
				//qs.setNumber(rs.getInt("number"));
				qs.setContentquestion(rs.getString("contentquestion"));
				qs.setOptions(getOptions(qs.getQuestionid()));
				qs.setCorrectoption(rs.getString("correctoption"));
				qs.setMediaid(rs.getInt("mediaid"));

				list.add(qs);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	/*
	public static List<Question> DisplayQuestion_2(Connection conn) {

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from questions";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Question qs = new Question();

				qs.setQuestionid(rs.getInt("questionid"));
				qs.setNumber(rs.getInt("number"));
				qs.setContentquestion(rs.getString("contentquestion"));
				qs.setOption1(rs.getString("option1"));
				qs.setOption2(rs.getString("option2"));
				qs.setOption3(rs.getString("option3"));
				qs.setOption4(rs.getString("option4"));
				qs.setCorrectoption(rs.getString("correctoption"));
				qs.setMediaid(rs.getInt("mediaid"));
				qs.setQuestiontypeid(rs.getInt("questiontypeid"));

				list.add(qs);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	*/

	public static boolean DeleteQuestion(int questionid, Connection conn) {

		boolean t = false;

		String sql = "call usp_dQuestion(?)";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, questionid);
			stmt.executeUpdate();
			t = true;
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}

	public static int CountRow(Connection conn) {

		int count = 0;

		String sql = "select count(*) from questions";

		PreparedStatement ptmt;
		try {

			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			rs.next();

			count = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public static int maxOptionid(Connection conn){
		String sql="select max(optionid) from options";
		int max=0;
		try{
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		max= rs.getInt(1);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}

	public static int maxQuestionid(Connection conn){
		String sql="select max(questionid) from questions";
		int max=0;
		try{
		PreparedStatement ptmt = conn.prepareStatement(sql);
		ResultSet rs = ptmt.executeQuery();
		max= rs.getInt(1);
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}

	public static boolean InsertOptions(List<Option> qt, Connection conn) {

		String sql = "insert into options value(?,?,?,?)";
		String n= "select max(optionid) from options";
		PreparedStatement ptmt;

		try {
			int questionid= maxQuestionid(conn);

			ptmt = conn.prepareStatement(n);
			ResultSet rs = ptmt.executeQuery();
			int i = rs.getInt(1);

			ptmt = conn.prepareStatement(sql);

			int j = 0;
			while (j < qt.size()) {
				ptmt.setInt(1,questionid);
				ptmt.setInt(2,++i);
				ptmt.setString(3, qt.get(j).getOptionname());
				ptmt.setBoolean(4, qt.get(j).isIsanswer());
				if (ptmt.executeUpdate() == 0) {
					return false;
				}
				j++;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}
