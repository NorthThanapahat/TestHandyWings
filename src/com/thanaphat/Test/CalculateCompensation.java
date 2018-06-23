package com.thanaphat.Test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalculateCompensation
 */
@WebServlet("/CalculateCompensation")
public class CalculateCompensation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ConnectManager con = new ConnectManager();
		Connection conn = con.ConnectDB();
		if(conn != null) {
			
		}else {
			
		}
	}

}
