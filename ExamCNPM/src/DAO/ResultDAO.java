package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Result;

public class ResultDAO {

	// Hàm lấy dữ liệu user để show lên bảng
	public static List<Result> DisplayResult(int start, int count, Connection conn) {

		List<Result> list = new ArrayList<Result>();

//		String sql = "select resultid, results.userid, username, fullname, point, testid" + " from users, results "
//				+ "where users.userid=results.userid  limit " + (start - 1) + ", " + count + "";

		String sql = "{ call pr_HaveExam()}";
		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Result rt = new Result();

				rt.setResulttestid(rs.getInt("resultid"));
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
		
		String sql ="{ call pr_DontExam()}";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

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

}
