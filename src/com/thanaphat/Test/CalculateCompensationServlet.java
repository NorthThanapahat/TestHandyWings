package com.thanaphat.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalculateCompensation
 */
@WebServlet("/CalculateCompensationServlet")
public class CalculateCompensationServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ConnectManager con = new ConnectManager();
		try(Connection conn = con.ConnectDB()) {
		String firstname = "";
		String lastname = "";
		String typeName = "";
		int emTypeID = 0;
		double emCom = 0;

		
			
		Statement st = conn.createStatement();
		
		String employeeID = request.getParameter("employeeID");
		System.out.println(employeeID);
	
		String sql = "SELECT em.firstname,em.lastname,emType.typeName,emType.employeeTypeID FROM EmployeeBean AS em INNER JOIN EmployeeTypeBean AS emType ON em.employeeTypeID = emType.employeeTypeID WHERE em.employeeID = '"+employeeID+"';";
		
		
			ResultSet resultData = st.executeQuery(sql);
			resultData.next();
			firstname = resultData.getString("firstname");
			lastname = resultData.getString("lastname");
			typeName = resultData.getString("typeName");
			emTypeID = resultData.getInt("employeeTypeID");
			
			
			
			resultData.close();
			st.close();
			conn.close();
			
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);
			request.setAttribute("typeName", typeName);
			request.setAttribute("employeeID", employeeID);
			request.setAttribute("emTypeID", emTypeID);
			request.getRequestDispatcher("calculateCom.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
