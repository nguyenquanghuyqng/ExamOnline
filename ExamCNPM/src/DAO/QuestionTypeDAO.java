package DAO;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import BEAN.QuestionType;

public class QuestionTypeDAO {

	public static List<QuestionType> DisplayQuestionType(int start, int count, Connection conn) {

		List<QuestionType> list = new ArrayList<QuestionType>();

		String sql = "select * from questiontypes limit " + (start - 1) + ", " + count + "";

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

		String sql = "select * from questiontypes";

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

	public static List<QuestionType> SelectQuestionType(int id, Connection conn) {

		List<QuestionType> list = new ArrayList<QuestionType>();

		String sql = "select * from questiontypes where questiontypeid = " + id + "";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				QuestionType qt = new QuestionType();

				qt.setQuestiontypeid(rs.getInt("questiontypeid"));
				qt.setQuestiontypename(rs.getString("questiontypename"));

				list.add(qt);

			}
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return list;
	}


	public static boolean DeleteQuestionType(int questiontypeid, Connection conn) {

		boolean t = false;

		String sql = "call usp_dQuestiontype(?)";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, questiontypeid);
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

		String sql = "select count(*) from questiontypes";

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

	public static int maxQuestiontypeid(Connection conn){
		String sql="select max(questiontypeid) from questiontypes";
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

	// public static boolean InsertQuestionType(List<QuestionType> qt, Connection conn) {

	// 	// String sql = "insert into questiontypes (questiontypeid, questiontypename) value(?,?)";
	// 	// String n= "select max(questiontypeid) from questiontypes";
	// 	String sql = "call usp_iQuestiontype(?)";
	// 	PreparedStatement ptmt;

	// 	try {
	// 		ptmt = conn.prepareStatement(sq);
	// 		ResultSet rs = ptmt.executeQuery();
	// 		int i = rs.getInt(1);

	// 		ptmt = conn.prepareStatement(sql);

	// 		int j = 0;
	// 		while (j < qt.size()) {
	// 			ptmt.setInt(1,++i);
	// 			ptmt.setString(2, qt.get(j).getQuestiontypename());
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

	public static boolean InsertQuestionType(List<QuestionType> qt, Connection conn) {
		String sql = "call usp_iQuestiontype(?)";
		PreparedStatement ptmt;

		try {
			ptmt = conn.prepareStatement(sql);

			int j = 0;
			while (j < qt.size()) {
				ptmt.setString(1, qt.get(j).getQuestiontypename());
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

	public static boolean InsertAQuestionType(QuestionType qt, Connection conn) {
		String sql = "call usp_iQuestiontype(?)";
		PreparedStatement ptmt;

		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, qt.getQuestiontypename());
			if (ptmt.executeUpdate() == 0) {
				return false;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	public static boolean UpdateData(HttpServletRequest request, int id,QuestionType qt, Connection conn) {

		boolean t = false;

		String sql = "UPDATE questiontypes set questiontypename=? where questiontypeid=" + id + ";";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, qt.getQuestiontypename());

			int kt = ptmt.executeUpdate();

			if (kt != 0) {

				return t = true;
			}
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return t;

	}

}
