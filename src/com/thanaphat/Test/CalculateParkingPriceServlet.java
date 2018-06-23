package com.thanaphat.Test;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalculateParkingPriceServlet
 */
@WebServlet("/CalculateParkingPriceServlet")
public class CalculateParkingPriceServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		System.out.println("startTime :"+startTime);
		System.out.println("endTime :"+endTime);
		
		SimpleDateFormat sf = new SimpleDateFormat("HH:mm");
		
		
		try {
			Date startTimeData = sf.parse(startTime);
			Date endTimeData = sf.parse(endTime);
			long difTime = endTimeData.getTime() - startTimeData.getTime();
			long difTimeHour = difTime /(60*60*1000) % 24;
			System.out.println(difTimeHour);
			int price = 0;
			if(difTimeHour <= 4) {
				price+= 40;
			}
			else if(difTimeHour > 4) {
				price+=40;
				long hourOverData = difTimeHour - 4;
				int hourOver = (int)Math.ceil(hourOverData);
				price += (hourOver*50);
			}
			request.setAttribute("price", price);
			request.setAttribute("startTime", startTime);
			request.setAttribute("endTime", endTime);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
