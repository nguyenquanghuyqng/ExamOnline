package DAO;

import java.sql.*;
import java.util.*;

import javax.swing.JOptionPane;

import BEAN.Account;

public class AccountDAO {

	public static List<Account> DisplayAccount(int start, int count ,Connection conn) {

		List<Account> list = new ArrayList<Account>();

		String sql = "select * from users limit "+(start-1)+", "+count+"";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Account acc = new Account();

				acc.setUserid(rs.getInt("userid"));
				acc.setUsername(rs.getString("username"));
				acc.setPass(rs.getString("pass"));
				acc.setFullname(rs.getString("fullname"));
				acc.setBirthday(rs.getString("birthday"));
				acc.setCountry(rs.getString("country"));
				acc.setPhone(rs.getString("phone"));
				acc.setImage(rs.getString("image"));
				acc.setRoleid(rs.getInt("roleid"));

				list.add(acc);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	public static List<Account> DisplayAccount_2(Connection conn) {

		List<Account> list = new ArrayList<Account>();

		String sql = "select * from users";

		try {

			PreparedStatement ptmt = conn.prepareCall(sql);

			ResultSet rs = ptmt.executeQuery();

			while (rs.next()) {
				Account acc = new Account();

				acc.setUserid(rs.getInt("userid"));
				acc.setUsername(rs.getString("username"));
				acc.setPass(rs.getString("pass"));
				acc.setFullname(rs.getString("fullname"));
				acc.setBirthday(rs.getString("birthday"));
				acc.setCountry(rs.getString("country"));
				acc.setPhone(rs.getString("phone"));
				acc.setImage(rs.getString("image"));
				acc.setRoleid(rs.getInt("roleid"));

				list.add(acc);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	// Hàm kiểm tra xóa tài khoản giá trị truyền vào là roleid và connection
	public static boolean DeleteAccount(int userid, Connection conn) {

		boolean t = false;

		String sql = "Delete From users Where userid =?";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userid);
			stmt.executeUpdate();
			t = true;
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	// Hàm trả về tổng số hàng trong một table
	
		public static int CountRow(Connection conn){
			
			int count=0;
			
			String sql= "select count(*) from users";
			
			PreparedStatement ptmt;
			try {
				
				ptmt = conn.prepareStatement(sql);
				
				ResultSet rs= ptmt.executeQuery();
				
				rs.next();
				
				count= rs.getInt(1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return count;
			
		}
}
