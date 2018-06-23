<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OOP Test</title>
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
        <a class="nav-link" href="index.jsp">Logic Test</a>
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

		<div class="container mt-3">
		<div class="jumbotron">
			<h1 class="text-center mb-4">Calculate Compensation Transaction</h1>
			<form action="saveEmployee" method="post">
				<div class="form-group row">
					<label for="selectTypeEmployee" class="col-sm-2 col-form-label">ประเภทพนักงาน</label>
					<div class="col-sm-10">
	      				<select class="form-control form-control-sm" name="employeeType" onchange ="typeEmployee(this);">
	  						<option value = 1 selected>พนักงานประจำ</option>
	  						<option value = 2>พนักงานช่วงคราว</option>
						</select>
	    			</div>
				</div>
				<div class="form-group row">
						<label for="selectTypeEmployee" class="col-sm-2 col-form-label">ชื่อ</label>
		    			<div class="col-sm-10">
		    				<input type="text" class="form-control" placeholder = "กรุณาระบุชื่อ" name = "employeeName" required>
		    			</div>
	    		</div>
				<div class="form-group row">
						<label for="selectTypeEmployee" class="col-sm-2 col-form-label">นามสกุล</label>
		    			<div class="col-sm-10">
		    				<input type="text" class="form-control" placeholder = "กรุณาระบุนามสกุล" name = "employeeLastname" required>
		    			</div>
	    		</div>
	    		<div class="form-group row">
						<label for="selectTypeEmployee" class="col-sm-2 col-form-label">วันเกิด</label>
		    			<div class="col-sm-10">
		    				<input type="text" class="form-control" pattern="(0[1-9]{1}|[1-3]{1}[0-9]{1})/(0[1-9]|1[0-2])/[1-9]{4}" placeholder = "กรุณาระบุวันเกิด (dd/mm/yyyy)" name = "employeeBirthday" required>
		    			</div>
	    		</div>
	    		<div class="form-group row" id="fullTimeSalary">
						<label for="selectTypeEmployee" class="col-sm-2 col-form-label float-left">อัตราเงินเดือน</label>
		    			<div class="col-sm-8 float-left">
		    				<input type="text" pattern= "[0-9,]{1,6}" class="form-control" id="emSalary" placeholder = "กรุณาระบุจำนวนเงินเดือน" name="employeeSalary">
		    			</div>
		    			<label  class="col-sm-2 col-form-label float-right">บาท</label>
	    		</div>
	    		<div class="form-group row mb-4" id="partTimeCompensation" style="display:none;">
						<label for="selectTypeEmployee" class="col-sm-2 col-form-label float-left">อัตราค่าตอบแทน</label>
		    			<div class="col-sm-8 float-left">
		    				<input type="text" class="form-control" pattern= "[0-9,]{1,6}" id="emCompensation"  placeholder = "กรุณาระบุค่าตอบแทน"  name= "employeeCompensation">
		    			</div>
		    			<label class="col-sm-2 col-form-label float-right">ต่อชั่วโมง</label>
	    		</div>
	    		<div class="clearfix"></div>
	    		<div class="col-sm-12 text-center mt-4">
					<button type="submit" class="btn btn-primary text-center">บันทึกข้อมูล</button>
				</div>
			</form>
			</div>
		</div>
 <script src="js/jquery-3.3.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <c:if test = "${isSaveEm}">
	 	<script>
	   	 	alert("บันทึกสำเร็จ");
		</script>
 </c:if>

 <script>
 	function typeEmployee(that){
 		if(that.value == 1){
 			document.getElementById("fullTimeSalary").style.display = "block"
 			document.getElementById("emSalary").required = true;
 			document.getElementById("partTimeCompensation").style.display = "none"
 		}else if(that.value == 2){
 			document.getElementById("fullTimeSalary").style.display = "none"
 			document.getElementById("emCompensation").required = true;
 	 		document.getElementById("partTimeCompensation").style.display = "block"
 		}
 	}
 </script>
 
</body>
</html>