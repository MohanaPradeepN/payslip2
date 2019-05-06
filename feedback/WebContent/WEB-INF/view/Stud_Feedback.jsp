<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
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
        <li><a href="Enroll" style="color:black;">Enroll</a></li>
        <li><a href="Stud_Feedback" style="background-color:white;color:black;">Feedback</a></li>
        
      
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div>
	<center><p>Give your feedback</p></center>
	<hr>
	<%String complete=(String)request.getAttribute("complete");
	int a=(int)session.getAttribute("loop1");%>
	<%if(complete.equals("notcompleted")){ %>
	<%String check=(String)session.getAttribute("all"); %>
	<% if(check.equals("notdone")){%>
	<form:form action="Stud_Feedback1" ModelAttribute="store_stud_feedback">
	<%String course_id=(String)session.getAttribute("course_id"); %>
	<%String staff=(String)session.getAttribute("staff"); %>
	<%String feedback1=(String)session.getAttribute("feedback"); %>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				Course_Id :<%=course_id %>
			</div>
			<div class="col-lg-6">
				Staff:<%=staff %>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-lg-2">
				
			</div>
			<div class="col-lg-2">
				Excellent
			</div>
			<div class="col-lg-2">
				Good
			</div>
			<div class="col-lg-2">
				Moderate
			</div>
			<div class="col-lg-2">
				Not bad
			</div>
			<div class="col-lg-2">
				Poor
			</div>
		</div>
	
	
	</div>
	</br>
	<%String[] feedback= feedback1.split(",");for(int i=a;i<(feedback.length+a);i++){ 	%>
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<%=feedback[i-a] %> 
				
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="5">5
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="4">4 
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="3">3
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="2">2
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="1">1
			</div>
		</div>
	</div>
	</br>
	<%
	} %>
	<input type="submit" value="Next>>">
	</form:form>
	<% }else{%>
	<form:form action="complete_feedback" ModelAttribute="store_stud_feedback">
	<%String course_id=(String)session.getAttribute("course_id"); %>
	<%String staff=(String)session.getAttribute("staff"); %>
	<%String feedback1=(String)session.getAttribute("feedback"); %>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				Course_Id :<%=course_id %>
			</div>
			<div class="col-lg-6">
				Staff:<%=staff %>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-lg-2">
				
			</div>
			<div class="col-lg-2">
				Excellent
			</div>
			<div class="col-lg-2">
				Good
			</div>
			<div class="col-lg-2">
				Moderate
			</div>
			<div class="col-lg-2">
				Not bad
			</div>
			<div class="col-lg-2">
				Poor
			</div>
		</div>
	</div>
	</br>
	<%String[] feedback= feedback1.split(",");for(int i=a;i<(feedback.length+a);i++){ %>
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<%=feedback[i-a] %> 
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="5">5
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="4">4 
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="3">3
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="2">2
			</div>
			<div class="col-lg-2">
				<input type="radio" name=<%=i %> value="1">1
			</div>
			
		</div>
	</div>
	</br>
		
	
	
	
	<%} %>
	<input type="submit" value="Submit">
	</form:form>
	<%} %>
	<%}else{ %>
	<p>Thank you for giving feedback</p>
	<%} %>
</div>
    
<p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div>
</body>
</html>