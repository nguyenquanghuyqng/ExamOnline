package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Exam;
import BEAN.TestSheet;
import DB.DBConnection;

public class ManageExamDAO {

	// Insert One tsount Liên kết với servlet Inserttsount
		public static boolean CreateTestSheet(TestSheet ts) {

			Connection conn = DBConnection.CreateConnection();
			
			try {

				CallableStatement ptmt = conn.prepareCall("{call pr_CreateTest(? ,? ,? ,? ,? ,? ,? ,? )}");
				 
				ptmt.setString(1, ts.getDatetimestart());
				ptmt.setString(2, ts.getDatetimeend());
				ptmt.setString(3, ts.getTime());
				ptmt.setInt(4, ts.getNumber());
				ptmt.setInt(5, ts.getTesttypeid());
				ptmt.setInt(6, ts.getSubjectid());
				ptmt.setInt(7, ts.getClassid());
				ptmt.setInt(8, ts.getQuestiontypeid());

				int kt = ptmt.executeUpdate();
				
				
				
				if (kt != 0) {

					System.out.println("Successfull");
					return true;

				} else {

					System.out.println("Failed");
					return false;
				}

			} catch (SQLException e) {
				System.out.print("Error: "+e);
			}
			return false;
		}

		public static List<Exam> ShowListExam(int start, int count) {

			Connection conn = DBConnection.CreateConnection();
			
			// Khởi tạo một 1 list lưu trữ các dữ liệu
			List<Exam> exam = new ArrayList<Exam>();
			
			try {

				CallableStatement ptmt = conn.prepareCall("{call pr_ViewListTestSheet(?,?)}");

				ptmt.setInt(1, start-1);
				ptmt.setInt(2, count);
				
				ResultSet rs = ptmt.executeQuery();
				
				
				while(rs.next()) {
					
					Exam ex = new Exam();
					
					ex.setTestid(rs.getInt("testid"));
					ex.setTesttypename(rs.getString("testtypename"));
					ex.setClassname(rs.getString("classname"));
					ex.setSubjectname(rs.getString("subjectname"));
					ex.setDatetimestart(rs.getString("datetimestart"));
					ex.setDatetimeend(rs.getString("datetimeend"));
					ex.setNumberquestion(rs.getInt("numberquestion"));
					ex.setTime(rs.getString("time"));
					
					System.out.println(rs.getString("time"));
					System.out.println(rs.getString("datetimestart"));
					System.out.println(rs.getString("datetimeend"));
					
					exam.add(ex);
				}

			} catch (SQLException e) {
				System.out.print("Error: "+e);
			}
			return exam ;
		}
		public static int CountRow() {

			Connection conn = DBConnection.CreateConnection();
			
			int count = 0;

			String sql = "select count(*) from tests";

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
		
		public static boolean DeleteExam(int testid,int number, Connection conn) {

			boolean t = false;

			try {
				
				CallableStatement ptmt = conn.prepareCall("{call pr_DeleteExam(?,?)}");

				ptmt.setInt(1, testid);
				ptmt.setInt(2, number);
				
				int kt = ptmt.executeUpdate();
				
				if (kt != 0) {

					System.out.println("Successfull");
					return true;

				} else {

					System.out.println("Failed");
					return false;
				}
				
			}

			catch (Exception e) {
				e.printStackTrace();
			}
			return t;
		}
}
