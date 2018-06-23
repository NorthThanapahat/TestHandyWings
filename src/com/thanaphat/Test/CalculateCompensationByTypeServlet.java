package com.thanaphat.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalculateCompensationByTypeServlet
 */
@WebServlet("/CalculateCompensationByTypeServlet")
public class CalculateCompensationByTypeServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ConnectManager con = new ConnectManager();
		int emTypeID = Integer.parseInt(request.getParameter("emTypeID"));
		double emCom = 0;
		String emComStr = "";
	
		String sqlCompensation = "";
		String employeeID = request.getParameter("employeeID");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String typeName  = request.getParameter("typeName");
		try(Connection conn = con.ConnectDB()) {
			Statement st = conn.createStatement();
			DecimalFormat formatter = new DecimalFormat("#,###.00");
			System.out.println(emTypeID);
			ResultSet resultData;
			if(emTypeID ==1) {
				sqlCompensation = "SELECT salary FROM FullTimeEmployeeBean WHERE employeeID ='"+employeeID+"';";
				resultData = st.executeQuery(sqlCompensation);
				resultData.next();
				emCom = (resultData.getDouble("salary")*93)/100;
				emComStr = formatter.format(emCom);
				
			}else if(emTypeID == 2) {
				int hour = Integer.parseInt(request.getParameter("hour"));
				sqlCompensation = "SELECT compensation FROM PartTimeEmployeeBean WHERE employeeID ='"+employeeID+"';";
				resultData = st.executeQuery(sqlCompensation);
				resultData.next();
				emCom = resultData.getDouble("compensation")* hour;
				emComStr = formatter.format(emCom);
			}
			LocalDateTime now = LocalDateTime.now();
			Timestamp timestamp = Timestamp.valueOf(now);
			System.out.println(now);
			st.execute("INSERT INTO CompensationTransaction VALUE('"+employeeID+"','"+emCom+"','"+timestamp+"');");
			
			request.setAttribute("emComStr", emComStr);
			request.setAttribute("firstname",firstname);
			request.setAttribute("lastname", lastname);
			request.setAttribute("typeName", typeName);
			request.setAttribute("emTypeID", emTypeID);
			request.setAttribute("employeeID", employeeID);
			request.getRequestDispatcher("calculateCom.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
