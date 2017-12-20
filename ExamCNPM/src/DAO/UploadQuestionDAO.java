package DAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.Question_01;
import BEAN.Option;
import Controller.UploadQuestion;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
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

					Question_01 qs = new Question_01();
					//Option op = new Option();
					List<Option> oplist= new ArrayList<Option>();
//					int maxquestionid=QuestionDAO.maxQuestionid(conn);
					try {
						DataFormatter formatter = new DataFormatter();
						System.out.println("Question haha");
						System.out.println((int) row.getCell(0).getNumericCellValue());
						//System.out.println((int)row.getCell(1).getNumericCellValue());
						System.out.println(row.getCell(1).getStringCellValue());
						System.out.println(row.getCell(2).getStringCellValue());
						System.out.println(formatter.formatCellValue(row.getCell(3)));//(row.getCell(4).getStringCellValue()));
						System.out.println((int) row.getCell(4).getNumericCellValue());
						
						
						
//						qs.setQuestionid((int) row.getCell(0).getNumericCellValue());
//						qs.setNumber((int)row.getCell(1).getNumericCellValue());
//						qs.setContentquestion(row.getCell(2).getStringCellValue());
//						qs.setCorrectoption(row.getCell(3).getStringCellValue());
//						qs.setMediaid(Integer.parseInt(formatter.formatCellValue(row.getCell(4))));
//						qs.setQuestiontypeid((int) row.getCell(5).getNumericCellValue());
						
						
						qs.setNumber((int)row.getCell(0).getNumericCellValue());
						qs.setContentquestion(row.getCell(1).getStringCellValue());
						qs.setCorrectoption(row.getCell(2).getStringCellValue());
						qs.setMediaid(Integer.parseInt(formatter.formatCellValue(row.getCell(3))));
						qs.setQuestiontypeid((int) row.getCell(4).getNumericCellValue());
						
						int j=5;
						int maxcol=j+qs.getNumber();
//						int maxoptionid=QuestionDAO.maxOptionid(conn);
						while(j<=maxcol)
						{
							Option op= new Option();
							System.out.println("Option");
							
//							System.out.println(qs.getQuestionid());
//							System.out.println(maxoptionid++);
							System.out.println(row.getCell(j).getStringCellValue());
							System.out.println(op.isIsanswer());
							
							op.setQuestionid(qs.getQuestionid());
//							op.setOptionid(maxoptionid++);
							op.setOptionname(row.getCell(j).getStringCellValue());
							//XL_PlyWorksheet.cells(1, "A").End().Column
							if((qs.getCorrectoption()).equals(op.getOptionname().charAt(0)))
							{
								op.setIsanswer(true);
							}
							else 
							{
								op.setIsanswer(false);
							}
							oplist.add(op);
							j++;
						}
					}
					catch(Exception e) {
						e.printStackTrace();

					}

					
					UploadQuestionDAO.InsertData(request, qs,oplist, conn);

				}
			} catch (FileNotFoundException e) {
				request.setAttribute("message", e.getMessage());

			} catch (IOException e) {
				request.setAttribute("message", e.getMessage());

			}
		}

		public static void InsertData(HttpServletRequest request, Question_01 qs, List<Option> op, Connection conn) {
//			String sqlqs= "insert into questions(number,"
//			+ "contentquestion,correctoption, mediaid,questiontypeid) values(?,?,?,?,?)";
//			String sqlop = "insert into options(questionid,optionname,isanswer) values(?,?,?)";

			try {

				PreparedStatement ptmt = conn.prepareCall("Call pr_InsertQuestion(?,?,?,?,?,?,?)");
				ptmt.setInt(1, qs.getNumber());
				ptmt.setString(2, qs.getContentquestion());
				ptmt.setString(3, qs.getCorrectoption());
				ptmt.setInt(4, qs.getMediaid());
				ptmt.setInt(5, qs.getQuestiontypeid());

				int kt = ptmt.executeUpdate();
				int i=0;
				
				if (kt != 0) {
					System.out.println("dc 1/2 r");
					PreparedStatement ptmtop = conn.prepareStatement(sqlop);
					while(i<op.size())
					{
						ptmtop.setInt(1,qs.getQuestionid());
						ptmtop.setString(1,op.get(i).getOptionname());
						ptmtop.setBoolean(2,op.get(i).isIsanswer());
						int ktt= ptmtop.executeUpdate(sqlop);
						if(ktt!=0)
						{
							request.setAttribute("message", "Insert data from excel to mysql  success");
							System.out.println("dc r");
						}
						else {
						
							request.setAttribute("message", "Insert data from excel to mysql  failed");
							System.out.println("ngu r");
						}
					
					i++;
					ptmtop.close();
					}
					
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




