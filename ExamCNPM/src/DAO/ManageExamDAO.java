package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.ClassExam;
import BEAN.Exam;
import BEAN.TestSheet;
import DB.DBConnection;

public class ManageExamDAO {

	// Insert One tsount Liên kết với servlet Inserttsount
		public static boolean CreateTestSheet(TestSheet ts) {

			// Khởi tạo kết nối
			Connection conn = DBConnection.CreateConnection();
			
			try {

				// Khởi tạo và gọi câu truy vấn đến store
				CallableStatement ptmt = conn.prepareCall("{call pr_CreateTest(? ,? ,? ,? ,? ,? ,? ,? )}");
				 
				// Set các giá trị cho câu truy vấn
				ptmt.setString(1, ts.getDatetimestart());
				ptmt.setString(2, ts.getDatetimeend());
				ptmt.setString(3, ts.getTime());
				ptmt.setInt(4, ts.getNumber());
				ptmt.setInt(5, ts.getTesttypeid());
				ptmt.setInt(6, ts.getSubjectid());
				ptmt.setInt(7, ts.getClassid());
				ptmt.setInt(8, ts.getQuestiontypeid());

				// Câu lệnh thực hiện câu truy vấn
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

		public static List<Exam> ShowListExam(int start, int end) {

			Connection conn = DBConnection.CreateConnection();
			
			// Khởi tạo một 1 list lưu trữ các dữ liệu
			List<Exam> exam = new ArrayList<Exam>();
			
			try {

				CallableStatement ptmt = conn.prepareCall("{call pr_ViewListTestSheet(?,?)}");

				ptmt.setInt(1, start-1);
				ptmt.setInt(2, end);
				
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
		
		public static boolean DeleteExam(int testid, int number, Connection conn) {

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
		public static List<ClassExam> DisplayListClassExam(int start, int count, Connection conn){
			List<ClassExam> list = new ArrayList<ClassExam>();
			
			try {
				CallableStatement ptmt = conn.prepareCall("{call pr_ListClassExam(?,?)}");
				
				ptmt.setInt(1, start-1);
				ptmt.setInt(2, count);
				
				ResultSet rs = ptmt.executeQuery();
				
				while(rs.next()) {
					ClassExam cx = new ClassExam();
					
					cx.setClassid(rs.getInt("classid"));
					cx.setClassname(rs.getString("classname"));
					cx.setSubjectname(rs.getString("subjectname"));
					cx.setTesttypemame(rs.getString("testtypemame"));
					cx.setTestid(rs.getInt("testid"));
					
					list.add(cx);
					
				}
				
			}
			catch(Exception e) {
				System.err.println("Error :"+e.getMessage());
			}
			
			return list;
		}
		
		public static boolean UpdateTimeTestSheet(TestSheet ts) {

			Connection conn = DBConnection.CreateConnection();
			
			try {

				CallableStatement ptmt = conn.prepareCall("{call pr_UpdateTimeExam(? ,? ,? ,?)}");
				 
				ptmt.setInt(1, ts.getTestid());
				ptmt.setString(2, ts.getDatetimestart());
				ptmt.setString(3, ts.getDatetimeend());
				ptmt.setString(4, ts.getTime());

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
}
