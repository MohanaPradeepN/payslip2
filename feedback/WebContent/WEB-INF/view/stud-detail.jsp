<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" 
 prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/navigation.css" />
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script>
		function add() {

		var element = document.createElement("input");


		element.setAttribute("name","feedback");
    	element.setAttribute("placeholder", "Enter your feedback");
    	element.setAttribute("class","col-lg-12 form-control");
    	element.setAttribute("style","border:2px solid black");
   
		var br=document.createElement("br");
    

		var foo = document.getElementById("fooBar");
		foo.appendChild(element);
		foo.appendChild(br);

		}
	</script>
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
        <li><a href="staff_home" style="background-color:white;color:black;">Home</a></li>
        <li><a href="course" style="color:black;">Course</a></li>
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
    	
	<%String name=(String)session.getAttribute("username");
                %>
                <%if(name!=null) {%>
                
	Hai <p><%= name %></p>
	<%} %>
	 </div>
 <p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div>   
</body>
</html>