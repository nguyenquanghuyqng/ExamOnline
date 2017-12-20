package DAO;

import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import BEAN.Subject;

public class SubjectDAO {

	public static List<Subject> DisplaySubject(int start, int count, Connection conn) {

		List<Subject> list = new ArrayList<Subject>();

		String sql = "select * from subjects limit " + (start - 1) + ", " + count + "";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Subject qst = new Subject();

				qst.setSubjectid(rs.getInt("subjectid"));
				qst.setSubjectname(rs.getString("subjectname"));

				list.add(qst);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static List<Subject> DisplaySubject_2(Connection conn) {

		List<Subject> list = new ArrayList<Subject>();

		String sql = "select * from subjects";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Subject qst = new Subject();

				qst.setSubjectid(rs.getInt("subjectid"));
				qst.setSubjectname(rs.getString("subjectname"));

				list.add(qst);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public static List<Subject> SelectSubject(int id, Connection conn) {

		List<Subject> list = new ArrayList<Subject>();

		String sql = "select * from subjects where subjectid = " + id + "";

		try {

			PreparedStatement ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				Subject qt = new Subject();

				qt.setSubjectid(rs.getInt("subjectid"));
				qt.setSubjectname(rs.getString("subjectname"));

				list.add(qt);

			}
			ptmt.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		return list;
	}


	// public static boolean DeleteSubject(int Subjectid, Connection conn) {

	// 	boolean t = false;

	// 	String sql = "call usp_dSubject(?)";
		
	// 	try {
	// 		PreparedStatement stmt = conn.prepareStatement(sql);
	// 		stmt.setInt(1, Subjectid);
	// 		stmt.executeUpdate();
	// 		t = true;
	// 	}

	// 	catch (Exception e) {
	// 		e.printStackTrace();
	// 	}
	// 	return t;
	// }

	// public static int CountRow(Connection conn) {

	// 	int count = 0;

	// 	String sql = "select count(*) from Subjects";

	// 	PreparedStatement ptmt;
	// 	try {

	// 		ptmt = conn.prepareStatement(sql);

	// 		ResultSet rs = ptmt.executeQuery();

	// 		rs.next();

	// 		count = rs.getInt(1);

	// 	} catch (SQLException e) {
	// 		// TODO Auto-generated catch block
	// 		e.printStackTrace();
	// 	}

	// 	return count;
	// }

	// public static int maxSubjectid(Connection conn){
	// 	String sql="select max(Subjectid) from Subjects";
	// 	int max=0;
	// 	try{
	// 	PreparedStatement ptmt = conn.prepareStatement(sql);
	// 	ResultSet rs = ptmt.executeQuery();
	// 	max= rs.getInt(1);
	// 	} catch (SQLException e) {
	// 	// TODO Auto-generated catch block
	// 		e.printStackTrace();
	// 	}
	// 	return max;
	// }

	// public static boolean InsertSubject(List<Subject> qt, Connection conn) {

	// 	String sql = "insert into Subjects (Subjectid, Subjectname) value(?,?)";
	// 	String n= "select max(Subjectid) from Subjects";
	// 	PreparedStatement ptmt;

	// 	try {
	// 		ptmt = conn.prepareStatement(n);
	// 		ResultSet rs = ptmt.executeQuery();
	// 		int i = rs.getInt(1);

	// 		ptmt = conn.prepareStatement(sql);

	// 		int j = 0;
	// 		while (j < qt.size()) {
	// 			ptmt.setInt(1,++i);
	// 			ptmt.setString(2, qt.get(j).getSubjectname());
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

	// public static boolean UpdateData(HttpServletRequest request, int id,Subject qt, Connection conn) {

	// 	boolean t = false;

	// 	String sql = "UPDATE Subjects set Subjectname=? where Subjectid=" + id + ";";

	// 	try {

	// 		PreparedStatement ptmt = conn.prepareStatement(sql);
	// 		ptmt.setString(1, qt.getSubjectname());

	// 		int kt = ptmt.executeUpdate();

	// 		if (kt != 0) {

	// 			return t = true;
	// 		}
	// 		ptmt.close();

	// 	} catch (SQLException e) {
	// 		System.out.println(e.getMessage());
	// 	}

	// 	return t;

	// }

}
