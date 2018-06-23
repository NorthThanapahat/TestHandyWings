<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basic Testing of HandyWings Co., Ltd.</title>
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
      <li class="nav-item">
        <a class="nav-link" href="oopTest.jsp">OOP Test</a>
      </li>
     
      
    </ul>
    <span class="navbar-text">Thanaphat Chirutpadathorn</span>
  </div>
  
</nav>

<div class="container mt-3">
	<div class="col-sm-6 jumbotron float-left">
		<h1 class="text-center mb-4">Split Address</h1>
		<form action="splitAddress">
			<div class="form-row">
				<input type="text" class="form-control" id="text" name = "address" placeholder ="99 ม.2 ต.นาไร่หลวง อ.สองแคว จ.น่าน 55160 02-4573498" required>
				<div class="col-sm-12 text-center margin_top_10">
					<button type="submit" class="btn btn-success text-center">Reformat Address</button>
				</div>
			</div>
		</form>
	</div>
	 <div class="col-md-5 float-right">
	<h1 class="h1 text-lightblue">RESULT Split Address</h1>
		<c:if test="${(noAddress != null) && (subDistrict != null) && (district != null) && (province != null) && (zipCode != null) && (telNumber != null)}">
			<h4 class="h4 text-white">Address Number : ${noAddress}</h4>
			<h4 class="h4 text-white">Sub District : ${subDistrict}</h4>
			<h4 class="h4 text-white">District : ${district}</h4>
			<h4 class="h4 text-white">Province : ${province}</h4>
			<h4 class="h4 text-white">ZipCode : ${zipCode}</h4>
			<h4 class="h4 text-white">tel : ${telNumber}</h4>
		</c:if>
	</div> 
</div>
	
	<div class="clearfix"></div>
	<div class="container margin_top_20">
		<div class="jumbotron col-md-6 float-left">
		<h1 class="text-center mb-2">Parking Car Calculator</h1>
			<div class="col-sm-12 text-center mb-2">
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#flowChart">
				 Flowchart
				</button>
			</div>
			
			<div class="modal fade" id="flowChart" tabindex="-1" role="dialog" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">FlowChart</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			          <img src="img/flowchart.jpg" class="img-responsive width100p">
			      </div>
			      
			    </div>
			  </div>
			</div>
			          
			<form action="calculate">
				<div id="calculate_form" class ="form-row justify-content-md-center">
					
						<div class="col-sm-6">
							<input type = "text" class = "form-control" pattern="([0-1]{1}[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}" placeholder="Parking Start Time (18:00)" name = "startTime" id ="endTime" value = "">
						</div>
						
						<div class="col-sm-6 mb-2">
							<input type = "text" class = "form-control" pattern="([0-1]{1}[0-9]{1}|2[0-3]{1}):[0-5]{1}[0-9]{1}" name="endTime" id ="endTime" value = "" placeholder="Parking End Time (20:00)">
						</div>
						<div class="col-sm-12 text-center margin_top_10">
							<button type="submit" class="btn btn-primary text-center">Calculate Price For Car Parking </button>
						</div>
					
				</div>
			</form>
		</div>
		<div class="col-sm-6 float-right mt-3 text-center">
			<h1 class="h1 text-warning">RESULT Parking Calculation</h1>
			<c:if test="${price != null}">
				<h2 class="h2 text-white">Parking Start Time : ${startTime} </h2>
				<h2 class="h2 text-white">Parking End Time : ${endTime} </h2>
				<h2 class="h2 text-white">Price : ${price} Baht</h2>
			</c:if>
		</div>
		
	</div>
	
	<script src="js/jquery-3.3.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 

</body>
</html>