package com.thanaphat.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CalculateCompensation
 */
@WebServlet("/SaveEmployee")
public class SaveEmployee extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
		ConnectManager con = new ConnectManager();
		boolean isConnectDB = false;
		boolean isSaveEm = false;
		try(Connection conn = con.ConnectDB()) {
			String employeeType = "";
			String employeeName = "";
			String employeeLastName = "";
			String employeeBirthday = "";
			String employeeSalary ="";
			String employeeCompensation = "";
			String sql = "",sqlType = "";
			String sqlGetEmLastID = "";
			String sqlCount ="";
			String emIDROOT ="EMP-";
			String emID = "";
			if(conn != null) {
				isConnectDB = true;
					Statement statement = conn.createStatement();
					sqlCount = "SELECT COUNT(id) as countEM FROM EmployeeBean";
					ResultSet result = statement.executeQuery(sqlCount);
					result.next();
					int countEm = result.getInt("countEM");
					if(countEm == 0) {
						emID = emIDROOT+"001";
					}else {
						sqlGetEmLastID = "SELECT id FROM EmployeeBean ORDER BY id DESC LIMIT 1";
						ResultSet resultID = statement.executeQuery(sqlGetEmLastID);
						resultID.next();
						int id = resultID.getInt("id");
						if(String.valueOf(id).length()==1) {
							emID = emIDROOT+"00"+String.valueOf(id+1);
						}else if(String.valueOf(id).length() == 2) {
							emID = emIDROOT+"0"+String.valueOf(id+1);
						}else {
							emID = emIDROOT+String.valueOf(id+1);
						}
					}
					System.out.println(emID);
					
					employeeType = request.getParameter("employeeType");
					employeeName = request.getParameter("employeeName");
					employeeLastName = request.getParameter("employeeLastname");
					employeeBirthday = request.getParameter("employeeBirthday");
					System.out.println(employeeName);
					System.out.println(employeeLastName);
					System.out.println(employeeBirthday);
					
					DecimalFormatSymbols symbols = new DecimalFormatSymbols();
					symbols.setDecimalSeparator('.');
					
					String resultConvertCompensation = null;
					
					SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
					Date birthday = format1.parse(employeeBirthday);
					java.sql.Date birthdayDB = new java.sql.Date(birthday.getTime());
					
					sql = "INSERT INTO EmployeeBean(employeeID,firstname,lastName,birthDay,employeeTypeID)"
							+ " VALUE ('"
							+emID+"','"
							+employeeName+"','"
							+employeeLastName+"','"
							+birthdayDB+"','"
							+employeeType+"')";
					statement.execute(sql);
					isSaveEm = true;
					if(employeeType.equals("1")) {
						employeeSalary = request.getParameter("employeeSalary");
						resultConvertCompensation = employeeSalary.replace(",","");
						double salary = Double.parseDouble(resultConvertCompensation);
						System.out.println(employeeType);
						System.out.println(resultConvertCompensation);
						 System.out.println("Fulltime employee");
						 sqlType = "INSERT INTO FullTimeEmployeeBean(salary) VALUE('"+salary+"');";
						 statement.execute(sqlType);
						 isSaveEm = true;
					}
					else if(employeeType.equals("2")) {
						employeeCompensation = request.getParameter("employeeCompensation");
						resultConvertCompensation = employeeCompensation.replace(",","");
						double compensation = Double.parseDouble(resultConvertCompensation);
						System.out.println(employeeType);
						System.out.println(resultConvertCompensation);
						sqlType = "INSERT INTO PartTimeEmployeeBean(compensation) VALUE('"+compensation+"');";
						statement.execute(sqlType);
						isSaveEm = true;
					}
				}else {
					isSaveEm = false;
					isConnectDB = false;
					System.out.println("Con't Connect DB");
				}
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("isConnectDB", isConnectDB);
		request.setAttribute("isSaveEm", isSaveEm);
		request.getRequestDispatcher("oopTest.jsp").forward(request, response);
	}
}

