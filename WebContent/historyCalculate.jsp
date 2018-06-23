<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DecimalFormat" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ประวัติการคำนวณ</title>
<link href="css/bootstrap.css" rel="stylesheet" type = "text/css">
<link href="css/myStyle.css" rel="stylesheet" type = "text/css">
</head>
<body>
		<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<nav class="navbar navbar-expand-lg navbar-light bg-light text-center">
  <a class="navbar-brand" href="/TestHandyWings/">Test</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Logic Test <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          CalculateCompensation
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <a class="dropdown-item" href="oopTest.jsp">บันทึกข้อมูลพนักงาน</a>
          <a class="dropdown-item" href="employeelist.jsp">รายชื่อพนักงาน</a>
          <a class="dropdown-item" href="historyCalculate.jsp">ประวัตการคำนวณ</a>
        </div>
      </li>
	   </ul>
    <span class="navbar-text">Thanaphat Chirutpadathorn</span>
  </div>
  
</nav>

<div class="container mt-3 ">
	<div class="jumbotron">
		<div class="table-responsive ">          
		  <table class="table">
		    <thead>
		      <tr>
		
		        <th>ลำดับ</th>
		        <th>รหัสพนักงาน</th>
		        <th>ชื่อ-นามสกุล</th>
		        <th>ผลการคำนวณ</th>
		        <th>วันเวลา</th>
		      </tr>
		    </thead>
		    <%
		Connection connectDB = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connectDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalculateCompensationTransactionBean", "root", "northregion");
			String sql = "SELECT EmployeeBean.employeeID,EmployeeBean.firstname,EmployeeBean.lastname,CompensationTransaction.calculateResult,CompensationTransaction.datetime FROM CompensationTransaction INNER JOIN  EmployeeBean ON CompensationTransaction.employeeID = EmployeeBean.employeeID;";
			String firstname = "";
			String lastname = "";
			String employeeID = "";
			int year=0;
			double calculateResult = 0;
			Timestamp datetime ;
			Statement statement = connectDB.createStatement();
			ResultSet result = statement.executeQuery(sql);
			int count = 0;
			while(result.next()){
				count++;
			datetime = result.getTimestamp("datetime");
			LocalDateTime cvDatetime = datetime.toLocalDateTime();
			year = cvDatetime.getYear()+543;
			DateTimeFormatter format = DateTimeFormatter.ofPattern("dd MMMM yyyy เวลา HH:mm น.",new Locale("th","TH"));
			String datetimeStr = cvDatetime.format(format);
			String[] splitDatetime = datetimeStr.split(" ");
			String datetimeTH = splitDatetime[0]+" "+splitDatetime[1]+" "+String.valueOf(year)+" "+splitDatetime[3]+" "+splitDatetime[4]+" "+splitDatetime[5];
			double resultCal = result.getDouble("calculateResult");
			DecimalFormat formatter = new DecimalFormat("#,###.00");
			String resultCalStr = formatter.format(resultCal);
		%>
		    <tbody>
		      <tr>
		        <td><%=count%></td>
		        <td><%=result.getString("employeeID")%></td>
		        <td><%=result.getString("firstname")+" "+result.getString("lastname")%></td>
		        <td><%=resultCalStr%></td>
		        <td><%=datetimeTH%></td>
		         <%} %>
		      </tr>
		    </tbody>
		  </table>
		  	  <%
				result.close();
		  		statement.close();
		  		connectDB.close();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			%>
	  	</div>
  	</div>
  </div>
<script src="js/jquery-3.3.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</body>
</html>