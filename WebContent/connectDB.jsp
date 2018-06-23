<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
	Connection connectDB = null;
	Class.forName("com.mysql.jdbc.Driver");
	connectDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalculateCompensationTransactionBean", "root", "northregion");
%>