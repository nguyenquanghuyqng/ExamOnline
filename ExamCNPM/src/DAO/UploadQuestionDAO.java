package DAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

import BEAN.Option;
import BEAN.Question;
import BEAN.Question_01;
import Controller.UploadQuestion;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.*;

public class UploadQuestionDAO {

	public static void ImportExcel(HttpServletRequest request, HttpServletResponse response, Connection conn, Part ex)
			throws ServletException, IOException {
		// File
		FileInputStream inp;

		try {
			inp = (FileInputStream) ex.getInputStream();
			HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(inp));

			// Lay so dong
			Sheet sheet = wb.getSheetAt(0);
			System.out.print("Import file ");
			for (int i = 0; i <= sheet.getLastRowNum(); i++) {

				Row row = sheet.getRow(i);
				Question_01 qs = new Question_01();
				List<Option> oplist = new ArrayList<Option>();
				try {
					DataFormatter formatter = new DataFormatter();

					qs.setNumber((int) row.getCell(0).getNumericCellValue());
					qs.setContentquestion(row.getCell(1).getStringCellValue());
					qs.setCorrectoption(row.getCell(2).getStringCellValue());
					qs.setMediaid(Integer.parseInt(formatter.formatCellValue(row.getCell(3))));
					qs.setQuestiontypeid((int) row.getCell(4).getNumericCellValue());

					int j = 5;
					int maxcol = j + qs.getNumber();
					System.out.print("maxcol= " + maxcol);

					while (j <= maxcol) {
						Option op = new Option();

						op.setOptionname(row.getCell(j).getStringCellValue());
						//char charAt = (char) op.getOptionname().charAt(0);
						char charAt= (qs.getCorrectoption()).charAt(0);
						if ((charAt)==(op.getOptionname().charAt(0))) {
							op.setIsanswer(true);
						} else {
							op.setIsanswer(false);
						}
						oplist.add(op);
						j++;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				UploadQuestionDAO.InsertData(request, qs, oplist, conn);

			}
		} catch (FileNotFoundException e) {
			request.setAttribute("message", e.getMessage());

		} catch (IOException e) {
			request.setAttribute("message", e.getMessage());

		}
	}

	public static void InsertData(HttpServletRequest request, Question_01 qs, List<Option> op, Connection conn) {
		try {
			boolean kt = QuestionDAO.InsertQuestion(qs, conn);
			int i = 0;

			if (kt) {
				System.out.println("dc 1/2 r");
				boolean ktt = QuestionDAO.InsertOptions(op, conn);
				if (ktt) {
					request.setAttribute("message", "Insert data from excel to mysql  success");
				} else {
					request.setAttribute("message", "Insert data from excel to mysql  failed");
				}
			} else {
				request.setAttribute("message", "Insert data from excel to mysql  failed");
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
	}
}
