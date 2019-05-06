<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
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
    .autocomplete {
    position: relative;
    display: inline-block;
    }  
    
    .autocomplete-items {
    position: absolute;
    z-index: 99;
    top: 100%;
    left: 0;
    right: 0;
   }
   .autocomplete-items div {
    padding: 10px;
    cursor: pointer;
    background-color: #fff; 
    border-bottom: 1px solid #d4d4d4; 
    }
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
        <li><a href="course" style="color:black;">Course</a></li>
        <li><a href="feedback" style="color:black;">Feedback</a></li>
        <li><a href="report_generation" style="background-color:white;color:black;">Report_Generation</a></li>
      
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout" style="color:black;"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
	
    <div>
    	
			<form action="get_report" autocomplete="off" name="myform">
			<input type="hidden" id="course_id" value="<%=(String)session.getAttribute("course_id") %>">
			<input type="hidden" id="staff" value="<%=(String)session.getAttribute("staff") %>">
			<input type="hidden" id="student" value="<%=(String)session.getAttribute("student") %>">
		<div class="container">
			<br>
			<div class="row">
				
				<div class="col-lg-4"><p>Enter Course_Id or staff to get report</p></div> 
				<div class="col-lg-2 ">
					
						<select name="report_type" id="report_type" class="form-control">
							<option>--select--</option>
							<option value="course_id">Course_Id</option>
							<option value="staff">Staff</option>
							<option value="student+staff">Student+Staff</option>
							<option value="student+course">Student+Course</option>
						</select>
					
				</div>
				
				<div class="col-lg-2 "><input type="text" id="course_staff" placeholder="Enter Staff name" name="course_staff" class="form-control" style="display:none;" />
				<input type="text" id="course_course" name="course_course" placeholder="Enter Course_id" class="form-control" style="display:none;" /></div>
				<div class="col-lg-2 "><input type="text" id="course_stud" placeholder="Enter Student rollno" name="course_stud" class="form-control" style="display:none;" /></div>
				<div class="col-lg-2 "><input type="submit" value="Get Report" class="form-control" /></div>
			</div>
		</div>
		</form>
		<hr>
		<%String report=(String)session.getAttribute("report");%>
		<% if(report.equals("gathered")){%>
			<% String value=(String)session.getAttribute("value"); 
				String staff=(String)session.getAttribute("staff");
				String feedback=(String)session.getAttribute("feedback");
				char[] value1 = value.toCharArray();
				String[] feedback1=feedback.split(",");
				int sum=0;
				int sum1=0;
				int sum2=0;
				int a=1;
				int j=0;
				int[] arr=new int[feedback1.length];
				for(int i=0;i<feedback1.length;i++){%>
						<% arr[i]=0;%>
		
				<%}%>
		
				<%for(int i=0;i<value1.length ;i++){ %>
		
		 			<%if(value1[i]!='[' && value1[i]!=',' && value1[i]!=']' && value1[i]!=' ' ) {%>
		  				 <% sum=sum+(a* Character.getNumericValue(value1[i])); %>
		  				 <%sum1+=Character.getNumericValue(value1[i]); %>
		   				 <%a++; %>
		   
					 <%} %>
		             <%if(value1[i]==']'){ %>
		 			<table>
		 			<tr>
		 			<td><%=feedback1[j] %></td>
		 			<%j++; %>
		 			<td><%=((sum/sum1)*20) %><%='%' %> </td>
		 			<%a=1 ;sum2+=(sum/sum1)*20;%>
		 			</tr>
		 			</table>
		 			<%sum=0;sum1=0; %>
		 			<%} %>
		 
		 		<%} %>
		
		 	<%="Total :" %><%=sum2/feedback1.length %><%='%' %>
		 
		<%}else if(report.equals("gathered1")){ %>
			<%String value=(String)session.getAttribute("value"); 
			String feedback=(String)session.getAttribute("feedback");
			String[] feedback1=feedback.split(",");
			String[] value1=value.split(",");
			 %>
			 
			 <%for(int i=0;i<feedback1.length;i++ ){ %>
			 	<table>
			 		<tr>
			 			<td><%= feedback1[i]%></td><td><%= value1[i]%></td>
			 		</tr>
			 	</table>
			 <%} %>
			 
		<%} %>
	
	 <script>
function autocomplete(inp, arr) {
  
  var currentFocus;
  
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;

      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;

      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");

      this.parentNode.appendChild(a);

      for (i = 0; i < arr.length; i++) {

        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {

          b = document.createElement("DIV");

          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);

          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

          b.addEventListener("click", function(e) {

              inp.value = this.getElementsByTagName("input")[0].value;

              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });

  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        currentFocus++;
        addActive(x);
      } else if (e.keyCode == 38) {
        currentFocus--;

        addActive(x);
      } else if (e.keyCode == 13) {

        e.preventDefault();
        if (currentFocus > -1) {

          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {

    if (!x) return false;

    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
 
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {

    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {

    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }

  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

$(document).ready(function () {
    $('#report_type').change(function () {
    	
        
    	
        
    	if ($('#report_type').val() == 'student+staff') {
            $('#course_stud').show();
            $('#course_staff').show();
            $('#course_course').hide();
        }
        else if ($('#report_type').val() == 'student+course') {
            $('#course_stud').show();
            $('#course_course').show();
            $('#course_staff').hide();
        }
        else if ($('#report_type').val() == 'staff') {
            $('#course_staff').show();
            $('#course_course').hide();
            $('#course_stud').hide();
        }
        else if ($('#report_type').val() == 'course_id') {
            $('#course_course').show();
            $('#course_staff').hide();
            $('#course_stud').hide();
        }
        else {
            $('#course_stud').hide();
            $('#course_staff').hide();
            $('#course_course').hide();
        }
        
        
        
       
    });
});

	$('#report_type').change(function(){
	    var arr=[]
	    var arr1=[]
	    
		if($(this).val()=="staff")
	    	{
	    	var b=document.getElementById("staff").value;
	    	
	    	var s1="";
	    	for(var i=0;i<b.length;i++)
	    		{
	    		if(b[i]==',')
	    			{
	    			arr.push(s1);
	    			s1="";
	    			}
	    		else
	    			{
	    			s1+=b[i];
	    			}
	    		}
	    	arr.push(s1);
	    	autocomplete(document.getElementById("course_staff"), arr);	
	    	}
	    if($(this).val()=="course_id")
    	{
    	var b=document.getElementById("course_id").value;
    	
    	var s1="";
    	for(var i=0;i<b.length;i++)
    		{
    		if(b[i]==',')
    			{
    			arr.push(s1);
    			s1="";
    			}
    		else
    			{
    			s1+=b[i];
    			}
    		}
    	arr.push(s1);
    	autocomplete(document.getElementById("course_course"), arr);
    	}
	    if($(this).val()=="student+staff")
    	{
    	var b=document.getElementById("staff").value;
    	var c=document.getElementById("student").value;
    	var s1="";
    	var s2="";
    	for(var i=0;i<b.length;i++)
    		{
    		if(b[i]==',')
    			{
    			arr.push(s1);
    			s1="";
    			}
    		else
    			{
    			s1+=b[i];
    			}
    		
    		}
    	for(var i=0;i<c.length;i++)
    		{
    		if(c[i]==',')
			{
			arr1.push(s2);
			s2="";
			}
			else
			{
			s2+=c[i];
			}
    		}
    	arr.push(s1);
    	arr1.push(s2);
    	autocomplete(document.getElementById("course_staff"), arr);
    	autocomplete(document.getElementById("course_stud"), arr1);
    	}
	    if($(this).val()=="student+course")
    	{
    	var b=document.getElementById("course_id").value;
    	var c=document.getElementById("student").value;
    	var s1="";
    	var s2="";
    	for(var i=0;i<b.length;i++)
    		{
    		if(b[i]==',')
    			{
    			arr.push(s1);
    			s1="";
    			}
    		else
    			{
    			s1+=b[i];
    			}
    		
    		}
    	for(var i=0;i<c.length;i++)
    		{
    		if(c[i]==',')
			{
			arr1.push(s2);
			s2="";
			}
			else
			{
			s2+=c[i];
			}
    		}
    	arr.push(s1);
    	arr1.push(s2);
    	autocomplete(document.getElementById("course_course"), arr);
    	autocomplete(document.getElementById("course_stud"), arr1);
    	}
	})
	
	
	


</script>
<p style="height:75px;"></p>
<div class="footer">
developed by babukumar</div>      
</body>
</html>