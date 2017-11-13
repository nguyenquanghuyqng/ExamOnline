package DAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.QuestionType;
import Controller.UploadQuestionType;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.*;
public class UploadQuestionTypeDAO {

		public static void ImportExcel(HttpServletRequest request, HttpServletResponse response, Connection conn, String ex)
				throws ServletException, IOException {
		// File
				FileInputStream inp;

				try {
					inp = new FileInputStream(ex.toString());
//					System.out.println(ex.toString());
					HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));

					// Lay so dong
					Sheet sheet = wb.getSheetAt(0);

					for (int i = 1; i <= sheet.getLastRowNum(); i++) {

						Row row = sheet.getRow(i);

						QuestionType qst = new QuestionType();
						try {
							qst.setQuestiontypeid((int) row.getCell(0).getNumericCellValue());
							qst.setQuestiontypename(row.getCell(1).getStringCellValue());
						
						}
						catch(Exception e) {
							e.printStackTrace();

						}
	
						UploadQuestionTypeDAO.InsertData(request, qst, conn);

					}
				} catch (FileNotFoundException e) {
					request.setAttribute("message", e.getMessage());

				} catch (IOException e) {
					request.setAttribute("message", e.getMessage());

				}
			}

			public static void InsertData(HttpServletRequest request, QuestionType qst, Connection conn) {

				try {

					PreparedStatement ptmt = conn.prepareStatement("insert into questiontype(questiontypeid,questiontypename) values(?,?)");
					
					ptmt.setInt(1, qst.getQuestiontypeid());
					ptmt.setString(2, qst.getQuestiontypename());
								
					int kt = ptmt.executeUpdate();
					if (kt != 0) {
						
						request.setAttribute("message", "Successfull insert data from excel to mysql");
					} 
					else {				
						request.setAttribute("message", "Insert data from excel to mysql failed");
					}
					ptmt.close();
				} catch (SQLException e) {
					System.out.print(e.getMessage());
				}
			}
	}



