<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://www.springframework.org/tags/form" 
 prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/navigation.css" />
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
    #button_add{
    background-color:#28a745;
    color:black;
    }
   	 #button_delete{
    background-color:#dc3545;
    color:black;
    }
    #add_course{
    border:2px solid black;
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
        <li><a href="staff_home" style="color:black;">Home</a></li>
        <li><a href="course" style="background-color:white;color:black;">Course</a></li>
        <li><a href="feedback" style="color:black;">Feedback</a></li>
        <li><a href="report_generation" style="color:black;">Report_Generation</a></li>
      
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
	
    	<div>		
        			
        			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
           				<li class="nav-item"> <form action="Add_Course1"><input type="submit" value="Add course"></form></li>
           				
           				<li class="nav-item"> <form action="Edit_Course1"><input type="submit" value="Edit course"></form></li>
           				<li class="nav-item"> <form action="Delete_Course1"><input type="submit" value="Delete course"></form></li>
           			</ul>
       				 
   		</div>
 <p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div>   			
</body>
</html>