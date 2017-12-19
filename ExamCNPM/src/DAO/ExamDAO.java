package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DB.DBConnection;

public class ExamDAO {

	public static Time getTime(String username, int subjectid, int testid) {
		String query = "SELECT tests.time\r\n" + "FROM users\r\n" + "  INNER JOIN users_subjects\r\n"
				+ "    ON users.userid = users_subjects.userid\r\n" + "  INNER JOIN subjects\r\n"
				+ "    ON users_subjects.subjectid = subjects.subjectid\r\n" + "  INNER JOIN tests\r\n"
				+ "	ON subjects.subjectid = tests.subjectid\r\n"
				+ "  where users.username =? and subjects.subjectid=? and tests.testid=?";
		Time dt = null;
		try {
			Connection conn = (Connection) DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setInt(2, subjectid);
			ps.setInt(3, testid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				dt = rs.getTime("time");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dt;

	}

	public static int getNumberQuestion(int subjectid, int testid) {
		String query = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
				+ "inner join	tests on tests.subjectid = subjects.subjectid where subjects.subjectid=? and tests.testid=?";
		int id = 0;
		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, subjectid);
			ps.setInt(2, testid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt("numberquestion");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	public static int getQuestionID(int subjectid, int testid) {
		String query = "select *from  subjects  inner join	tests on tests.subjectid = subjects.subjectid inner join test_question on tests.testid = test_question.testid  \r\n"
				+ "inner join questions on questions.questionid = test_question.questionid where subjects.subjectid=? and tests.testid=?";
		int id = 0;
		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, subjectid);
			ps.setInt(2, testid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt("questionid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	public static int getQuestionTypeID(int subjectid, int testid) {
		String query = "select *from  subjects  inner join	tests on tests.subjectid = subjects.subjectid inner join test_question on tests.testid = test_question.testid  \r\n"
				+ "inner join questions on questions.questionid = test_question.questionid where subjects.subjectid=? and tests.testid=?";
		int id = 0;
		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, subjectid);
			ps.setInt(2, testid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt("questiontypeid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	@SuppressWarnings("unchecked")
	public static String getQuestion(String question_no,String username ,int subjectid, int testid, int questiontypeid) {
		String query = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
				+ "inner join	tests on tests.subjectid = subjects.subjectid inner join test_question on tests.testid = test_question.testid \r\n"
				+ "	inner join questions on questions.questionid = test_question.questionid where users.username=? and subjects.subjectid=? and tests.testid=? and questions.questiontypeid=?";
		JSONObject obj = new JSONObject();

		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, username);
			ps.setInt(2, subjectid);
			ps.setInt(3, testid);
			ps.setInt(4, questiontypeid);
			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = null;

			if (rs.next()) {
				// move the cursos to the given row number in this result set object.
				rs.absolute(Integer.parseInt(question_no));
				obj.put("question", rs.getString("contentquestion"));
				obj.put("id", rs.getString("questionid"));

				query = "select *from questions inner join options on questions.questionid = options.quesitonid "
						+ "where questionid =?;";
				ps = (PreparedStatement) con.prepareStatement(query);
				ps.setString(1, rs.getString("questionid"));
				rs1 = ps.executeQuery();

				if (rs1.next()) {
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
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj.toString();
	}

	public static boolean checkTestTime(String username, int subjectid, int testid) {
		Connection conn = DBConnection.CreateConnection();
		String sql = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
				+ "inner join	tests on tests.subjectid = subjects.subjectid where users.username=? and subjects.subjectid=? and tests.testid=?";
		PreparedStatement ptmt = null;
		Timestamp dtstart = null;
		Timestamp dtend = null;
		Timestamp dtnow = new Timestamp(System.currentTimeMillis());
		boolean flag = false;
		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setString(1, username);
			ptmt.setInt(2, subjectid);
			ptmt.setInt(3, testid);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				dtstart = rs.getTimestamp("datetimestart");
				dtend = rs.getTimestamp("datetimeend");
				if (dtstart.before(dtnow) == true && dtend.after(dtnow) == true) {
					flag = true;
					return flag;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	@SuppressWarnings("null")
	public static List<Integer> getSubjectID(String username) {
		String sql = "select *from users inner join users_subjects on users.userid = users_subjects.userid where users.username=?";
		List<Integer> ls = new ArrayList<Integer>();
		try {
			Connection conn = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer sub = rs.getInt("subjectid");
				ls.add(sub);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	public static List<Integer> getTestID(String username, int subjectid) {
		String sql = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
				+ "inner join	tests on tests.subjectid = subjects.subjectid where users.username=? and subjects.subjectid=? ";
		List<Integer> ls = new ArrayList<Integer>();
		try {
			Connection conn = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setInt(2, subjectid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Integer sub = rs.getInt("testid");
				ls.add(sub);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	public static LinkedHashMap getCorrectOption(String username, int subjectid, int testid) {
		String query = "select *from users inner join users_subjects on users.userid = users_subjects.userid \r\n"
				+ "inner join subjects on subjects.subjectid = users_subjects.subjectid \r\n"
				+ "inner join	tests on tests.subjectid = subjects.subjectid inner join test_question on tests.testid = test_question.testid \r\n"
				+ "	inner join questions on questions.questionid = test_question.questionid where  users.username=?  and subjects.subjectid=? and tests.testid=?";
		LinkedHashMap lhm = new LinkedHashMap<>();
		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, username);
			ps.setInt(2, subjectid);
			ps.setInt(3, testid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				int key = rs.getInt("questionid");
				String value = rs.getString("correctoption");
				lhm.put(key, value);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lhm;
	}

	public static void setResult(int userid, int testid,int diem) {
		String query = " insert into results(userid,testid,point) \r\n" + 
				" values(?,?,?,?)";
		try {
			Connection con = DBConnection.CreateConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, userid);
			ps.setInt(2, testid);
			ps.setInt(3, diem);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static int getUserID(String username) {
		int id = 0;
		
		
		 Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select * from users where username=?";

		try {
			
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setString(1, username);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				id = rs.getInt("userid");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return id;
	}
	
	public static String getFullNameID(int id) {
		String usname = null;
		
		
		 Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select fullname from users where userid=?";

		try {
			
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, id);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				usname = rs.getString("fullname");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return usname;
	}
	
	
	public static String getSubjectName(int id) {
		String subjectname = null;
		
		
		 Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select subjectname from subjects where subjectid=?";

		try {
			
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, id);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				subjectname = rs.getString("subjectname");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return subjectname;
	}
	
	
	
	public static String getTestName(int id) {
		String testtypename = null;
		
		
		 Connection conn = DBConnection.CreateConnection();

		PreparedStatement ptmt = null;

		String sql = "select testtypename from testtypes where testtypeid=?";

		try {
			
			ptmt = (PreparedStatement) conn.prepareStatement(sql);
			ptmt.setInt(1, id);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				testtypename = rs.getString("testtypename");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return testtypename;
	}
	@SuppressWarnings("unchecked")
	public static JSONArray getResult(int userid){
		String query="select * from results where userid=?";
		JSONArray array= new JSONArray();
		JSONObject obj;
		
		try{
			Connection con=DBConnection.CreateConnection();
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, userid);
			ResultSet rs=ps.executeQuery();
		
			
			
			while(rs.next()){
				
				obj=new JSONObject();
				obj.put("userid", rs.getInt("userid"));
				obj.put("testid", rs.getInt("testid"));
				obj.put("point", rs.getInt("point"));
				array.add(obj);
			}
			
			
			ps.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return array;
	}
	

}
