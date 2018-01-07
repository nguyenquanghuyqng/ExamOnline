package DAO;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import BEAN.Question;
import BEAN.QuestionType;
import BEAN.Question_01;
import BEAN.Option;
import DB.DBConnection;

public class QuestionDAO {

	public static String getQuestiontypename(int questiontypeid) {
		String name = null;
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

	public static String getOptions(int questionid) {
		String options = "";
		Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select *from options where questionid =?;";

		try {
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, questionid);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				options += (rs.getString("optionname") + "    \r\n");
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

	public static int maxOptionid(Connection conn) {
		String sql = "select max(optionid) from options";
		int max = 0;
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				System.out.println("Get Option truosc:" + max);
				max = rs.getInt("max(optionid)");
				System.out.println("Get Option sau:" + max);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}

	public static int maxQuestionid(Connection conn) {
		String sql = "select questionid from questions ORDER BY questionid DESC LIMIT 1";
		int max = 0;
		try {
			PreparedStatement ptmt = conn.prepareCall(sql);
			ResultSet rs = ptmt.executeQuery();
			max = rs.getInt("questionid");
			System.out.println("maxQuestionid= " + max);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}

	// public static boolean InsertOptions(int questionid,List<Option> qt, Connection conn) {

	// 	String sql = "call usp_iOption(?,?,?)";

	// 	PreparedStatement ptmt;

	// 	try {
	// 		ptmt = conn.prepareStatement(sql);
	// 		int j = 0;
	// 		while (j < qt.size()) {
	// 			ptmt.setInt(1, questionid);
	// 			ptmt.setString(2, qt.get(j).getOptionname());
	// 			ptmt.setBoolean(3, qt.get(j).isIsanswer());
	// 			if (ptmt.executeUpdate() == 0) {
	// 				return false;
	// 			}
	// 			j++;
	// 		}
	// 	} catch (SQLException e) {
	// 		e.printStackTrace();
	// 	}
	// 	return true;
	// }

	public static boolean InsertOptions(List<Option> qt, Connection conn) {

		String sql = "call usp_iOption(?,?)";

		PreparedStatement ptmt;

		try {
			ptmt = conn.prepareStatement(sql);
			int j = 0;
			while (j < qt.size()) {
				ptmt.setString(1, qt.get(j).getOptionname());
				ptmt.setBoolean(2, qt.get(j).isIsanswer());
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

	public static boolean InsertQuestion(Question_01 qt, Connection conn) {

		String sql = "call usp_iQuestion(?,?,?,?,?)";
		PreparedStatement ptmt;

		try {
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, qt.getNumber());
			ptmt.setString(2, qt.getContentquestion());
			ptmt.setString(3, qt.getCorrectoption());
			ptmt.setInt(4, qt.getMediaid());
			ptmt.setInt(5, qt.getQuestiontypeid());
			if (ptmt.executeUpdate() == 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public static List<Question> SelectQuestion(int id, Connection conn) {

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from questions where questionid = " + id + "";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

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
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return list;
	}
	
	public static boolean UpdateData(HttpServletRequest request, Question_01 qt, List<Option> op, Connection conn) {
		String sqlqt = "call usp_uQuestion(?,?,?,?,?,?) ;";
		String sqlop = "call usp_uOption(?,?,?,?);";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sqlqt);
			ptmt.setInt(1, qt.getQuestionid());
			ptmt.setInt(2, qt.getNumber());
			ptmt.setString(3, qt.getContentquestion());
			ptmt.setString(4, qt.getCorrectoption());
			ptmt.setInt(5, qt.getMediaid());
			ptmt.setInt(6, qt.getQuestiontypeid());

			int kt = ptmt.executeUpdate();

			if (kt != 0) {
				ptmt = conn.prepareStatement(sqlop);
				int j = 0;
				while (j < op.size()) {
					ptmt.setInt(1,qt.getQuestionid());
					ptmt.setInt(2,op.get(j).getOptionid());
					ptmt.setString(3, op.get(j).getOptionname());
					ptmt.setBoolean(4, op.get(j).isIsanswer());
					if (ptmt.executeUpdate() == 0) {
						return false;
					}
					j++;
					
				}
				ptmt.close();
				return true;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return false;
	}
}
