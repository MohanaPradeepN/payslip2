<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@taglib uri="http://www.springframework.org/tags/form" 
 prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/navigation2.css" />
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    a {
    color: #fff;
    }
    .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
        color: #fff;
        background-color: #6c757d!important;
    }
    #feed1{
    padding-top: 1%;
    padding-bottom: 1%;
    
    }
    #next{
    text-align:center;
    }
   
    </style>
</head>
<body>
<nav class="navbar navbar-inverse header1" id="header1">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="color:black">FEEDBACK</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="stud_home" style="color:black;">Home</a></li>
        <li><a href="Enroll" style="background-color:white;color:black;">Enroll</a></li>
        <li><a href="Stud_Feedback" style="color:black;">Feedback</a></li>
        
      
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div>
   
		<form action="Enroll1">
		<div class="container">
			<br>
			<div class="row">
				
				<div class="col-lg-5"><p>Select the semester to Enroll</p></div> 
				<div class="col-lg-4 ">
					
						<select name="stud_semester" class="form-control">
							<option>--select--</option>
							<option>Semester1</option>
							<option>Semester2</option>
							<option>Semester3</option>
							<option>Semester4</option>
							<option>Semester5</option>
							<option>Semester6</option>
							<option>Semester7</option>
							<option>Semester8</option>
						</select>
					
				</div>
				<div class="col-lg-3 "><input type="submit" value="Enroll" class="form-control"></div>
			</div>
		</div>
		</form>
		<hr style="border:1px solid black">
		<br>
					<%List<String> b=(List<String>)request.getAttribute("a"); %>
					<center><p>Select the course that you are going to study</p></center>
					</br> 
					<form:form action="store_enroll" method="post" modelAttribute="Store_Enroll">
					<%for(int i=1;i<b.size();i=i+2){ %>
						<div class="container">
							<div class="row">
								<div class="col-lg-3">
								</div> 
								<div class="col-lg-1">
								<input type="checkbox" name="course_id" value=<%= b.get(i-1)%>>
								</div>
								<div class="col-lg-5">
								<%=b.get(i-1) %>-<%=b.get(i) %>
								</div> 
								<div class="col-lg-3">
								</div> 
							</div>	
							<br>	
						</div>
						
					<%} %>
						<center><input type="submit" value="I have Selected"></center>
					</form:form>
</div>
<p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div> 
</body>
</html>