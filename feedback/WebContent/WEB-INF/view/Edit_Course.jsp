<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        
        			
           			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
           				<li class="nav-item"> <form action="Add_Course1"><input type="submit" value="Add course"></form></li>
           				
           				<li class="nav-item"><a class="nav-link"  id="pills-deletecourse-tab" data-toggle="pill" href="#deletecourse" role="tab" aria-controls="pills-deletecourse" aria-selected="false" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;"><label class="btn btn-default center-block" style="padding-left: 0px;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;"><input type="submit" value="Edit course"></label></a></li>
           				<li class="nav-item"> <form action="Delete_Course1"><input type="submit" value="Delete course"></form></li>
           			</ul>
           			
       				 
   		
  			<hr>
  			
  			
  			
  			
					<form action="editcourse" method="post" ModelAttribute="editcourse">
				   <div class="container">
				   		
				   		<div class="row">
				   		<div class="col-lg-2 col-sm-0 col-md-1 col-xs-0">
				   				</div>
				   				<div class="col-lg-8 col-sm-12 col-md-10 col-xs-12">
				   				<center><table>
				   				
				   					<tr><th>Old Course code :</th><td><input type="textbox" name="old_id" id="add_course" class="form-control"  placeholder="Course old code"/></td></tr>
				   					
				   					<tr><th>New Course code :</th><td><input type="textbox" name="new_id" id="add_course" class="form-control"  placeholder="Course new code"/></td></tr>
									<tr><th>Course name :</th><td><input type="textbox" name="course_name" id="add_course" class="form-control"  placeholder="Course name"/></td></tr>
									<tr><th>Semester :</th><td><select id="add_course" name="semester" class="form-control">
				   											<option>Semester1
				   											</option>
				   											<option >Semester2
				   											</option>
				   											<option>Semester3
				   											</option>
				   											<option>Semester4
				   											</option>
				   											<option>Semester5
				   											</option>
				   											<option>Semester6
				   											</option>
				   											<option>Semester7
				   											</option>
				   											<option>Semester8
				   											</option> 
				   										</select></td></tr>
				   					<tr><th>Staff name :</th><td><input type="textbox" name="staff" id="add_course" class="form-control" placeholder="Staff name"/></td></tr>
				   					<tr><td colspan="2" style="text-align:center;"><input id="button_add" type="submit"  class="form-control" value="Edit"/></td></tr>
				   				</table></center>
				   				</div>
				   			<div class="col-lg-2 col-sm-0 col-md-1 col-xs-0">
				   				</div>
				   				
				   </div>
				   </div>
				   </form>
			


			
<p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div>
</body>
</html>