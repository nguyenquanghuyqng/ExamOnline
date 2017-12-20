package DAO;

import javax.lang.model.util.ElementScanner6;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import BEAN.Question_01;
import BEAN.Option;
import DAO.QuestionDAO;
import Controller.UploadQuestion;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.*;
public class UploadQuestionDAO {

		public static <HSSFWorkbook> void ImportExcel(HttpServletRequest request, HttpServletResponse response, Connection conn, String ex)
				throws ServletException, IOException {
		// File
				FileInputStream inp;

				try {
					inp = new FileInputStream(ex.toString());
					//inp= new File(ex.toString());
//					System.out.println(ex.toString());
					//HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));
					HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));
					//Workbook wb=Workbook.createWorkbook(inp);
					// Lay so dong
					Sheet sheet = wb.getSheetAt(0);

					for (int i = 1; i <= sheet.getLastRowNum(); i++) {

						Row row = sheet.getRow(i);

						Question_01 qs = new Question_01();
						Option op = new Option();
						try {
							qs.setQuestionid((int) row.getCell(0).getNumericCellValue());
							qs.setNumber((int)row.getCell(1).getNumericCellValue());
							qs.setContentquestion(row.getCell(2).getStringCellValue());
							qs.setCorrectoption(row.getCell(3).getStringCellValue());
							qs.setMediaid((int) row.getCell(4).getNumericCellValue());
							qs.setQuestiontypeid((int) row.getCell(5).getNumericCellValue());
							int j=6;
							int maxcol=j+qs.getNumber();
							int maxoptionid=QuestionDAO.maxOptionid(conn);
							while(j<=maxcol)
							{
								op.setQuestionid(qs.getQuestionid());
								op.setOptionid(maxoptionid++);
								op.setOptionname(row.getCell(j).getStringCellValue());
								//XL_PlyWorksheet.cells(1, "A").End().Column
								if(qs.getCorrectoption().equals(op.getOptionname().charAt(0)))
								{
									op.setIsanswer(true);
								}
								else 
								{
									op.setIsanswer(false);
								}
								j++;
							}
						}
						catch(Exception e) {
							e.printStackTrace();

						}

						
						UploadQuestionDAO.InsertData(request, qs,op, conn);

					}
				} catch (FileNotFoundException e) {
					request.setAttribute("message", e.getMessage());

				} catch (IOException e) {
					request.setAttribute("message", e.getMessage());

				}
			}

			public static void InsertData(HttpServletRequest request, Question_01 qs, Option op, Connection conn) {
				String sqlqs= "insert into questions(questionid,number,"
				+ "contentquestion,correctoption, mediaid,questiontypeid) values(?,?,?,?,?,?,)";
				String sqlop = "insert into options values(?,?,?,?)";

				try {

					PreparedStatement ptmt = conn.prepareStatement(sqlqs);

					ptmt.setInt(1, qs.getQuestionid());
					ptmt.setInt(2, qs.getNumber());
					ptmt.setString(3, qs.getContentquestion());
					ptmt.setString(4, qs.getCorrectoption());
					ptmt.setInt(5, qs.getMediaid());
					ptmt.setInt(6, qs.getQuestiontypeid());
					
					int kt = ptmt.executeUpdate();
					if (kt != 0) {
						PreparedStatement ptmtop = conn.prepareStatement(sqlop);

						ptmtop.setInt(1,qs.getQuestionid());
						ptmtop.setInt(2,op.getOptionid());
						ptmtop.setString(3,op.getOptionname());
						ptmtop.setBoolean(4,op.isIsanswer());
						int ktt= ptmtop.executeUpdate(sqlop);
						if(ktt!=0)
						{
							request.setAttribute("message", "Insert data from excel to mysql  success");
						}
						else {
						
							request.setAttribute("message", "Insert data from excel to mysql  failed");
						}
						ptmtop.close();
						
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


