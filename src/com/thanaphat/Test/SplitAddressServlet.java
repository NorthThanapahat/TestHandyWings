package com.thanaphat.Test;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SplitAddressServlet
 */
@WebServlet("/SplitAddressServlet")
public class SplitAddressServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String pattern = "([0-9]{2,3}\\s*(ม.[0-9]+)?)\\s*((ตำ|ต.)?[u0E01-u0E5B]+)\\s*((อำ|อ.)?[u0E01-u0E5B]+)\\s*((จัง|จ.)?[u0E01-u0E5B]+)\\s*([1-9]{1}[0-9]{4})\\s*(0[0-9]{1}-[0-9]{7,8})";
	
		String pattern  = "([0-9]{2,3} ม\\.[0-9]+)[ ]?((ตำบล| )(ต\\.)?[ก-๙]+)((อำเภอ| )(อ\\.)?[ก-๙]+)((จังหวัด| +)(จ\\.)?[ก-๙]+)[ ]?([1-9]{1}[0-9]{4})[ ]?(0[0-9]{1,2}-[0-9]{7})$";
		
		String address = request.getParameter("address");
		
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(address);
		String noAddress = "";
		String subDistrict = "";
		String district = "";
		String province ="";
		String zipCode = "";
		String telNumber ="";
		
		if(m.find()) {
			System.out.println(m.group(1));
			System.out.println(m.group(2));
			System.out.println(m.group(3));
			System.out.println(m.group(4));
			System.out.println(m.group(5));
			System.out.println(m.group(6));
			System.out.println(m.group(7));
			System.out.println(m.group(8));
			System.out.println(m.group(9));
			System.out.println(m.group(10));
			System.out.println(m.group(11));
			System.out.println(m.group(12));
			noAddress = m.group(1);
			subDistrict = m.group(2);
			district = m.group(5);
			province = m.group(8);
			zipCode = m.group(11);
			telNumber = m.group(12);
			
		}
		request.setAttribute("noAddress", noAddress);
		request.setAttribute("subDistrict", subDistrict);
		request.setAttribute("district", district);
		request.setAttribute("province", province);
		request.setAttribute("zipCode", zipCode);
		request.setAttribute("telNumber", telNumber);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
