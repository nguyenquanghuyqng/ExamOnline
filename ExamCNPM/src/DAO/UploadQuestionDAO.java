package DAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.Question;
import Controller.UploadQuestion;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.*;
public class UploadQuestionDAO {

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

						Question qs = new Question();
						try {
							qs.setQuestionid((int) row.getCell(0).getNumericCellValue());
							qs.setNumber((int)row.getCell(1).getNumericCellValue());
							qs.setContentquestion(row.getCell(2).getStringCellValue());
							qs.setOption1(row.getCell(3).getStringCellValue());
							qs.setOption2(row.getCell(4).getStringCellValue());
							qs.setOption3(row.getCell(5).getStringCellValue());
							qs.setOption4(row.getCell(6).getStringCellValue());
							qs.setCorrectoption(row.getCell(7).getStringCellValue());
							qs.setMediaid((int) row.getCell(8).getNumericCellValue());
							qs.setQuestiontypeid((int) row.getCell(9).getNumericCellValue());
						}
						catch(Exception e) {
							e.printStackTrace();

						}

						
						UploadQuestionDAO.InsertData(request, qs, conn);

					}
				} catch (FileNotFoundException e) {
					request.setAttribute("message", e.getMessage());

				} catch (IOException e) {
					request.setAttribute("message", e.getMessage());

				}
			}

			public static void InsertData(HttpServletRequest request, Question qs, Connection conn) {

				try {

					PreparedStatement ptmt = conn.prepareStatement("insert into questions(questionid,number,"
							+ "contentquestion,option1, option2, option3, option4, correctoption, mediaid,questiontypeid) values(?,?,?,?,?,?,?,?,?,?)");
					
					ptmt.setInt(1, qs.getQuestionid());
					ptmt.setInt(2, qs.getNumber());
					ptmt.setString(3, qs.getContentquestion());
					ptmt.setString(4, qs.getOption1());
					ptmt.setString(5, qs.getOption2());
					ptmt.setString(6, qs.getOption3());
					ptmt.setString(7, qs.getOption4());
					ptmt.setString(8, qs.getCorrectoption());
					ptmt.setInt(9, qs.getMediaid());
					ptmt.setInt(10, qs.getQuestiontypeid());
					
					int kt = ptmt.executeUpdate();
					if (kt != 0) {
						
						request.setAttribute("message", "Insert data from excel to mysql  success");
						
					} 
					else {
						
						request.setAttribute("message", "Insert data from excel to mysql  failed");
					}
					ptmt.close();
				} catch (SQLException e) {
					System.out.print(e.getMessage());
				}
			}
	}


