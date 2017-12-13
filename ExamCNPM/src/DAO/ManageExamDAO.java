package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
				ptmt.setInt(8, ts.getTestid());


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
