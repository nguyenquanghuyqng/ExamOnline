package DAO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.Account_2;

public class UploadUser {

	public static void ImportExcel( Connection conn, String ex, int classid, int subjectid)
			throws ServletException, IOException {
		// File
		FileInputStream inp;
		System.out.println("Đường dẫn :"+ex.toString());
		try {
			inp = new FileInputStream(ex.toString());
			
			
			
			HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));

			// Lay so dong
			Sheet sheet = wb.getSheetAt(0);

			System.out.print("Import file account");
			
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {

				Row row = sheet.getRow(i);

				Account_2 acc = new Account_2();
				try {
//					acc.setUserid((int) row.getCell(0).getNumericCellValue());
//					acc.setUsername(row.getCell(1).getStringCellValue());
//					acc.setPass(row.getCell(2).getStringCellValue());
//					acc.setFullname(row.getCell(3).getStringCellValue());
//					acc.setBirthday(row.getCell(4).getStringCellValue());
//					acc.setCountry(row.getCell(5).getStringCellValue());
//					acc.setPhone(row.getCell(6).getStringCellValue());
//					acc.setImage(row.getCell(7).getStringCellValue());
//					acc.setRoleid((int) row.getCell(8).getNumericCellValue());
					
					System.out.println("Get Cell:");
					System.out.println(row.getCell(0).getStringCellValue());
					System.out.println(row.getCell(1).getStringCellValue());
					System.out.println(row.getCell(2).getStringCellValue());
					System.out.println(row.getCell(3).getStringCellValue());
					System.out.println(row.getCell(4).getStringCellValue());
					System.out.println(row.getCell(5).getStringCellValue());
					System.out.println(row.getCell(6).getStringCellValue());
					System.out.println((int) row.getCell(7).getNumericCellValue());
					
					acc.setUsername(row.getCell(0).getStringCellValue());
					acc.setPass(row.getCell(1).getStringCellValue());
					acc.setFullname(row.getCell(2).getStringCellValue());
					acc.setBirthday(row.getCell(3).getStringCellValue());
					acc.setCountry(row.getCell(4).getStringCellValue());
					acc.setPhone(row.getCell(5).getStringCellValue());
					acc.setImage(row.getCell(6).getStringCellValue());
					acc.setRoleid((int) row.getCell(7).getNumericCellValue());
				}
				catch(Exception e) {
					e.printStackTrace();

				}

				System.out.println("Hi");
				
				UploadUser.InsertData(acc, conn, classid, subjectid);

			}
		} catch (FileNotFoundException e) {
			System.out.println("Error1: "+e.getMessage());

		} catch (IOException e) {
			System.out.println("Error2: "+e.getMessage());

		}
	}

	public static void InsertData(Account_2 acc, 
			Connection conn, int classid, int subjectid) {
		try {

//			PreparedStatement ptmt = conn.prepareStatement("insert into users(username,"
//					+ "pass, fullname, birthday, country, phone, image, roleid, classid) values(?,?,?,?,?,?,?,?,?)");
//			
////			ptmt.setInt(1, acc.getUserid());
////			ptmt.setString(2, acc.getUsername());
////			ptmt.setString(3, acc.getPass());
////			ptmt.setString(4, acc.getFullname());
////			ptmt.setString(5, acc.getBirthday());
////			ptmt.setString(6, acc.getCountry());
////			ptmt.setString(7, acc.getPhone());
////			ptmt.setString(8, acc.getImage());
////			ptmt.setInt(9, acc.getRoleid());
//			
//			System.out.println("Start  insert ");
//			
//			ptmt.setString(1, acc.getUsername());
//			ptmt.setString(2, acc.getPass());
//			ptmt.setString(3, acc.getFullname());
//			ptmt.setString(4, acc.getBirthday());
//			ptmt.setString(5, acc.getCountry());
//			ptmt.setString(6, acc.getPhone());
//			ptmt.setString(7, acc.getImage());
//			ptmt.setInt(8, acc.getRoleid());
//			ptmt.setInt(9, classid);
			
			PreparedStatement ptmt = conn.prepareCall("Call pr_InsertAccount(?,?,?,?,?,?,?,?,?,?)");

			ptmt.setString(1, acc.getUsername());
			ptmt.setString(2, acc.getPass());
			ptmt.setString(3, acc.getFullname());
			ptmt.setString(4, acc.getBirthday());
			ptmt.setString(5, acc.getCountry());
			ptmt.setString(6, acc.getPhone());
			ptmt.setString(7, acc.getImage());
			ptmt.setInt(8, acc.getRoleid());
			ptmt.setInt(9, classid);
			ptmt.setInt(10, subjectid);			

			
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				
				System.out.println("Insert data from excel to mysql  success");
				
			} 
			else {
				System.out.println("Insert data from excel to mysql  failed");
			}
			ptmt.close();
			System.out.println("Insert success");
		} catch (SQLException e) {
			System.out.print("Error:" +e.getMessage());
		}
	}

}
