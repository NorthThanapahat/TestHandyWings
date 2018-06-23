<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type = "text/css">
<link href="css/myStyle.css" rel="stylesheet" type = "text/css">

</head>
<body>
		<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<div class="container mt-3 justify-content-md-center">
	<div class="jumbotron col-md-6 offset-sm-3">
		<h1 class="text-center mb-4">คำนวนค่าตอบแทน</h1>
		<c:if test="${firstname != null}">
		<form action="calculateCompensationByTypeServlet" method="post">
			 <div class="form-group">
			    <label for="name" class="col-sm-12">ชื่อ-สกุลผู้ทดสอบประเมินผลตอบแทน</label>
			    <label for="name"class="col-sm-12"><b>${firstname} ${lastname}</b></label>
  			</div>
  			<div class="form-group">
			    <label for="name" class="col-sm-12">ประเภทพนักงาน</label>
			    <label for="name"class="col-sm-12"><b>${typeName}</b></label>
  			</div>
		
			<h5 class="col-sm-12 text-center" >___________________________________________________</h5>
			<input type="hidden" name="employeeID" value="${employeeID}">
			<input type="hidden" name="emTypeID" value="${emTypeID}">
			<input type="hidden" name="firstname" value="${firstname}">
			<input type="hidden" name="lastname" value="${lastname}">
			<input type="hidden" name="typeName" value="${typeName}">
			<c:if test="${emTypeID ==2}">
				<div class="form-group row">
    				<label for="hourInput" class="col-sm-5 col-form-label text-center">ระบุจำนวนชั่วโมงทำงาน</label>
   					 <div class="col-sm-6">
      					<input type="text" pattern="[1-9]" name="hour" class="form-control" id="hour">
    				</div>
  				</div>
			</c:if>
			<div class="col-sm-12 text-center margin_top_10">
				<button type="submit" class="btn btn-warning text-center text-white">คำนวณ</button>
			</div>
		</form>
		</c:if>
		
			<div class="col-sm-6 offset-sm-3 border border-dark mt-3 mb-3 pt-3 pb-3" >
				<h2 class="h2 text-center">
					<c:if test="${emComStr !=null}">
						${emComStr}
					</c:if>
					 
				</h2>
			</div>
		
		
	</div>
	
	
	
<script src="js/jquery-3.3.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</body>
</html>