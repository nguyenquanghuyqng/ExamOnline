package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import BEAN.Account;
import BEAN.Result;
import DB.DBConnection;

public class ResultDAO {

	// Hàm lấy dữ liệu user để show lên bảng
	public static List<Result> DisplayResult(int start, int count, Connection conn) {

		List<Result> list = new ArrayList<Result>();

//		String sql = "select resultid, results.userid, username, fullname, point, testid" + " from users, results "
//				+ "where users.userid=results.userid  limit " + (start - 1) + ", " + count + "";

		String sql = "{ call pr_HaveExam(?,?)}";
		try {

			PreparedStatement ptmt = conn.prepareCall(sql);
			ptmt.setInt(1, start-1);
			ptmt.setInt(2, count);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Result rt = new Result();

				rt.setResultid(rs.getInt("resultid"));
				rt.setUserid(rs.getInt("userid"));
				rt.setFullname(rs.getString("fullname"));
				rt.setUsername(rs.getString("username"));
				rt.setPoint(rs.getInt("point"));
				rt.setTestid(rs.getInt("testid"));
//				rt.setClasses(rs.getString("classname"));

				list.add(rt);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	// Lấy danh sách những thí sinh không thi và không có kết quả thi
	public static List<Result> DisplayDontResult(int start, int count, Connection conn) {

		List<Result> list = new ArrayList<Result>();

		// String sql = "select users.userid, users.username, users.fullname,
		// results.point, results.testid" + " from users "
		// + "left join results on users.userid=results.userid group by users.userid
		// limit "+ (start - 1) + ", " + count + "" ;

		// String sql = "select users.userid, users.username, users.fullname" + " from
		// users"
		// + "where not exists (select results.userid "
		// + "from results, users"
		// + "where results.userid=users.userid) limit "+ (start - 1) + ", " + count +
		// "" ;

//		String sql = "select users.userid, users.username, users.fullname " 
//				+ "from users "
//				+ "left join results on users.userid=results.userid" 
//				+ "where results.userid is null";
		
		String sql ="{ call pr_DontExam(?,?)}";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);
			ptmt.setInt(1, start-1);
			ptmt.setInt(2, count);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Result rt = new Result();

				// rt.setresultsid(rs.getInt("resultid"));
				rt.setUserid(rs.getInt("userid"));
				rt.setFullname(rs.getString("fullname"));
				rt.setUsername(rs.getString("username"));
				rt.setClasses(rs.getString("classname"));
				// rt.setPoint(rs.getInt("point"));
				// rt.setTestid(rs.getInt("testid"));

				list.add(rt);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	public static boolean DeleteResult(int id, Connection conn) {
		
		boolean t = false;

		String sql = "Delete From results Where resultid =?";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
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

		String sql = "select count(*) from results";

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
	public static boolean UpdateResult(Result rt, Connection conn) {

		boolean t = false;

		String sql = "{ call pr_UpdateResult(?,?,?,?)}";

		try { 
			PreparedStatement ptmt = conn.prepareCall(sql);

			ptmt.setInt(1, rt.getResultid());
			ptmt.setInt(2, rt.getUserid());
			ptmt.setInt(3, rt.getPoint());
			ptmt.setInt(4, rt.getTestid());

			int kt = ptmt.executeUpdate();

			if (kt != 0) {

				// request.setAttribute("message", "Insert data success");
				return t = true;
			}
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return t;

	}
	
	public static List<Result> checkTestTime(int start, int count, Timestamp date) {
		Connection conn = DBConnection.CreateConnection();
//		String sql = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
//				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
//				+ "inner join	tests on tests.subjectid = subjects.subjectid where users.username=? and subjects.subjectid=? and tests.testid=?";

		List<Result> list = new ArrayList<Result>();
		
		String sql ="select results.resultid,users.userid,users.username," +
			    "users.fullname,results.point, tests.testid,tests.datetimestart,tests.datetimeend" +
				"from users,results,tests" +
				"where users.userid=results.userid" +
				"and results.testid= tests.testid"+
			    "limit " + (start - 1) + ", " + count + "";
		
		PreparedStatement ptmt = null;
		Timestamp dtstart = null;
		Timestamp dtend = null;
		Timestamp dtnow = date;
		
		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, start-1);
			ptmt.setInt(2, count);

			ResultSet rs = ptmt.executeQuery();

				while (rs.next()) {

					dtstart = rs.getTimestamp("datetimestart");
					dtend = rs.getTimestamp("datetimeend");
					if (dtstart.before(dtnow) == true && dtend.after(dtnow) == true) {
						Result rt = new Result();

						rt.setResultid(rs.getInt("resultid"));
						rt.setUserid(rs.getInt("userid"));
						rt.setFullname(rs.getString("fullname"));
						rt.setUsername(rs.getString("username"));
						rt.setPoint(rs.getInt("point"));
						rt.setTestid(rs.getInt("testid"));
//						rt.setClasses(rs.getString("classname"));

						list.add(rt);
					}

			}

		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
