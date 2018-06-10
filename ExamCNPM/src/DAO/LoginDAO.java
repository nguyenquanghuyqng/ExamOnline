package DAO;

import java.sql.*;
import java.util.*;

import com.mysql.jdbc.PreparedStatement;

import BEAN.User;
import BEAN.User_2;
import DB.DBConnection;

public class LoginDAO {

	public static boolean LoginUser(String name, String pass, Connection conn) {

		boolean t = false;

		java.sql.PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users";
		//String sql = "select username, pass, roleid from users where username = ?";
		try {

			ptmt = conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				String uname = rs.getString("username");
				String password = rs.getString("pass");
				int roleid = rs.getInt("roleid");

				if ((uname.equals(name)) && (password.equals(pass)) && roleid == 4) {
					t = true;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;

	}

	public static boolean LoginAdmin(String name, String pass, Connection conn) {

		boolean t = false;

		PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users";

		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				String uname = rs.getString("username");
				String password = rs.getString("pass");
				int roleid = rs.getInt("roleid");

				if ((uname.equals(name)) && (password.equals(pass)) && roleid == 1) {
					t = true;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;

	}

	public static boolean ExamManager(String name, String pass, Connection conn) {

		boolean t = false;

		PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users";

		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				String uname = rs.getString("username");
				String password = rs.getString("pass");
				int roleid = rs.getInt("roleid");

				if ((uname.equals(name)) && (password.equals(pass)) && roleid == 3) {
					t = true;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;

	}

	public static boolean LoginQuestion(String name, String pass, Connection conn) {

		boolean t = false;

		PreparedStatement ptmt = null;

		String sql = "select username, pass, roleid from users";

		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {

				String uname = rs.getString("username");
				String password = rs.getString("pass");
				int roleid = rs.getInt("roleid");

				if ((uname.equals(name)) && (password.equals(pass)) && roleid == 2) {
					t = true;
				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return t;

	}

	// Lấy tên User đăng nhập vào.
	public static String getUserName(String username, Connection conn) {
		String usname = null;

		PreparedStatement ptmt = null;

		String sql = "select fullname from users where username='" + username + "'";

		try {

			ptmt = (PreparedStatement) conn.prepareStatement(sql);

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

	// Lấy ra thông tin User đăng nhập vào.
	public User getUser(String username) {
		Connection con = DBConnection.CreateConnection();
		String sql = "select * from users where username='" + username + "'";
		User us = new User();
		try {
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String fullname = rs.getString("fullname");
				String birthday = rs.getString("birthday");
				String country = rs.getString("country");
				String phone = rs.getString("phone");
				String image = rs.getString("image");
				us = new User(fullname, birthday, country, phone,image);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return us;
	}

}
