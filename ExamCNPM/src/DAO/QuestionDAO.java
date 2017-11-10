package DAO;

import java.sql.*;
import java.util.*;
import BEAN.Question;

public class QuestionDAO {

	public static List<Question> DisplayQuestion(int start, int count, Connection conn) {

		List<Question> list = new ArrayList<Question>();

		String sql = "select * from questions limit " + (start - 1) + ", " + count + "";

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

	public static boolean DeleteQuestion(int questionid, Connection conn) {

		boolean t = false;

		String sql = "Delete From questions Where questionid =?";

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
}
