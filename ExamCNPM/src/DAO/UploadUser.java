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

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.Account_2;

public class UploadUser {

	public static void ImportExcel(HttpServletRequest request, HttpServletResponse response, Connection conn, String ex)
			throws ServletException, IOException {
		// File
		FileInputStream inp;

		try {
			inp = new FileInputStream(ex.toString());
//			System.out.println(ex.toString());
			HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));

			// Lay so dong
			Sheet sheet = wb.getSheetAt(0);

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
				UploadUser.InsertData(request, acc, conn);

			}
		} catch (FileNotFoundException e) {
			request.setAttribute("message", e.getMessage());

		} catch (IOException e) {
			request.setAttribute("message", e.getMessage());

		}
	}

	public static void InsertData(HttpServletRequest request, Account_2 acc, Connection conn) {
		try {

			PreparedStatement ptmt = conn.prepareStatement("insert into users(username,"
					+ "pass, fullname, birthday, country, phone, image, roleid) values(?,?,?,?,?,?,?,?)");
			
//			ptmt.setInt(1, acc.getUserid());
//			ptmt.setString(2, acc.getUsername());
//			ptmt.setString(3, acc.getPass());
//			ptmt.setString(4, acc.getFullname());
//			ptmt.setString(5, acc.getBirthday());
//			ptmt.setString(6, acc.getCountry());
//			ptmt.setString(7, acc.getPhone());
//			ptmt.setString(8, acc.getImage());
//			ptmt.setInt(9, acc.getRoleid());
			
			
			ptmt.setString(1, acc.getUsername());
			ptmt.setString(2, acc.getPass());
			ptmt.setString(3, acc.getFullname());
			ptmt.setString(4, acc.getBirthday());
			ptmt.setString(5, acc.getCountry());
			ptmt.setString(6, acc.getPhone());
			ptmt.setString(7, acc.getImage());
			ptmt.setInt(8, acc.getRoleid());
			
			int kt = ptmt.executeUpdate();
			if (kt != 0) {
				
				System.out.println("Insert data from excel to mysql  success");
				request.setAttribute("message", "Insert data from excel to mysql  success");
				
			} 
			else {
				System.out.println("Insert data from excel to mysql  failed");
				request.setAttribute("message", "Insert data from excel to mysql  failed");
			}
			ptmt.close();
			System.out.println("Insert success");
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
	}

}
