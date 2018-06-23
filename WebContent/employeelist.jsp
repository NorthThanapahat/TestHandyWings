
<%@page import="java.time.LocalDate"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.time.Period" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee List</title>
<link href="css/bootstrap.css" rel="stylesheet" type = "text/css">
<link href="css/myStyle.css" rel="stylesheet" type = "text/css">
</head>
<body>
	<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<nav class="navbar navbar-expand-lg navbar-light bg-light text-center">
  <a class="navbar-brand" href="/TestHandyWings/">Test</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Logic Test <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          CalculateCompensation
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <a class="dropdown-item" href="oopTest.jsp">บันทึกข้อมูลพนักงาน</a>
          <a class="dropdown-item" href="">รายชื่อพนักงาน</a>
          <a class="dropdown-item" href="#">ประวัตการคำนวณ</a>
        </div>
      </li>
     
      
    </ul>
    <span class="navbar-text">Thanaphat Chirutpadathorn</span>
  </div>
  
</nav>

<div class="container mt-3 h-75">
	<div class="jumbotron h-100">
		<div class="table-responsive ">          
		  <table class="table">
		    <thead>
		      <tr>
		
		        <th>ลำดับ</th>
		        <th>รหัสพนักงาน</th>
		        <th>ชื่อ-นามสกุล</th>
		        <th>อายุ</th>
		        <th>ประเภท</th>
		        <th> </th>
		      </tr>
		    </thead>
		          <%
		Connection connectDB = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connectDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalculateCompensationTransactionBean", "root", "northregion");
			String sql = "SELECT EmployeeBean.employeeID,EmployeeBean.firstname,EmployeeBean.lastname,EmployeeBean.birthday,EmployeeTypeBean.typeName FROM EmployeeBean INNER JOIN  EmployeeTypeBean ON EmployeeBean.employeeTypeID = EmployeeTypeBean.employeeTypeID;";
			Statement statement = connectDB.createStatement();
			ResultSet result = statement.executeQuery(sql);
			int count = 0;
			while(result.next()){
				count++;
				java.sql.Date dbSqlDate = result.getDate("birthday");
				LocalDate birthdayDate = dbSqlDate.toLocalDate();
				 LocalDate now = LocalDate.now();
				 Period period = Period.between(birthdayDate, now);
				 int age = period.getYears();

		%>
		    <tbody>
		      <tr>
		        <td><%=count %></td>
		        <td><%=result.getString("employeeID")%></td>
		        <td><%=result.getString("firstname")+" "+result.getString("lastname")%></td>
		        <td><%=age %></td>
		        <td><%=result.getString("typeName")%></td>
		        <td><a href="calculateCompensation.jsp?employeeID=<%=result.getString("employeeID")%>">คำนวนค่าตอบแทน</a></td>
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