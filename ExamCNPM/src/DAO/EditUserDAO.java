package DAO;

import java.util.*;

import BEAN.EditUser;

import java.sql.*;

public class EditUserDAO {

	public static boolean DisplayEditUser(EditUser user,Connection conn) {
		
		List<EditUser> list = new ArrayList<EditUser>();

		String sql = "update users set uername=?, pass=?, fullname=?, birthday=?, country=?, "
				+ "phone=?, image=?  where userid=?";

		try {
			
			PreparedStatement ptmt = conn.prepareStatement(sql);
			
			ptmt.setString(1, user.getUsername());
			ptmt.setString(2, user.getPass());
			ptmt.setString(3, user.getFullname());
			ptmt.setString(4, user.getBirthday());
			ptmt.setString(5, user.getCountry());
			ptmt.setString(6, user.getPhone());
			ptmt.setString(7, user.getImage());
			
			int kt = ptmt.executeUpdate();

			if(kt!=0){
				
				return true;
			}
			ptmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Error :"+e.getMessage());
		}

		return false;

	}

}
