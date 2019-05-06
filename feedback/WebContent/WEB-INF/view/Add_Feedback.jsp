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
    <script>
    	
    $(document).ready(function() {
    	
    	var wrapper   		= $(".input_fields_wrap"); 
    	var add_button      = $(".add_field_button"); 
    	
    	
    	$(add_button).click(function(e){ 
    		e.preventDefault();
    		
    			$(wrapper).append('<div><input type="text" name="feedback"/><a href="#" class="remove_field" style="color:red;">Remove</a></div>'); //add input box
    		
    	});
    	
    	$(wrapper).on("click",".remove_field", function(e){ 
    		e.preventDefault(); $(this).parent('div').remove(); 
    	})
    });

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
   #foobar1{
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
        <li><a href="course" style="color:black;">Course</a></li>
        <li><a href="feedback" style="background-color:white;color:black;">Feedback</a></li>
        <li><a href="report_generation" style="color:black;">Report_Generation</a></li>
      
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
    
    			
        			
        			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
           				<li class="nav-item"> <a class="nav-link"  id="pills-addfeedback-tab" data-toggle="pill" href="#addfeedback" role="tab" aria-controls="pills-addfeedback" aria-selected="false" style="padding-top: 0px;padding-left: 0px;padding-right: 0px;padding-bottom: 0px;"><label class="btn btn-default center-block" style="padding-left: 0px;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;"><input type="button" value="Add Feedback"></a></li>
           				<li class="nav-item"> <form action="Show_Feedback"><input type="submit" value="Show Feedback"></form></li>
           				<li class="nav-item"><form action="Delete_Feedback"><input type="submit" value="Delete Feedback"></form></li>
           			</ul>
       				 
   			
  			<hr>
  			
					<form  id="form1" action="Store_Feedback" method="post" modelAttribute="Store_Feedback">

						<div class="container">
							<div class="row ">
							<div class="input_fields_wrap">
    						
   						    <div><input type="text" name="feedback"><a href="#" class="remove_field" style="color:red;">Remove</a></div>
   						    </div>
   						    <button class="add_field_button">Add More Feedback</button>
   						    <input type="submit" value="Store Feedback">
							
						</div>
					
					</div>
					</form>
				
				   
	<p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div> 			
</body>
</html>