<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" 
 prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  
    <style>
      .first_detail{
    background-image: url(bg.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: top center;
    height: 948px;
}
      .form-control {
        border-radius: 0px;
      }
    div.well{
      height: 250px;
      } 

    .Absolute-Center {
      margin: auto;
      position: absolute;
      top: 0; 
      left: 0; 
      bottom: 0; 
      right: 0;
    }
	#radio1{
	padding:25px;
	}
    .Absolute-Center.is-Responsive {
      width: 50%; 
      height: 50%;
      min-width: 200px;
      max-width: 500px;
      padding: 40px;
      text-align: center;
      padding-left: 0px;
      padding-right: 0px;

      }
    .nav-tabs {
        border-bottom: 0px; 
    }
    #input1:focus{
                outline:0px;
            }
    #input1{
      border:0;
                
      border-bottom:2px solid #4a90e2!important ;
    }
    #input2{
                
      background-color: #4a90e2!important;
            }
   
    @media screen and (min-width: 780px)
           {
           #nav-tab{  
          margin-left: 25%;
        }
      }
    @media screen and (max-width: 780px)
           {
           #nav-tab{  
          margin-left: 22%;
        }
      }
    @media screen and (max-width: 450px)
           {
           #nav-tab{  
          margin-left: 11.5%;
        }
    }
    #nav-signup-tab
    {
      background-color:#fff;
    }
    #nav-login-tab
    {
      background-color:#fff;
    }
    #input2{
    border-radius:5px;
    }
    #error_message{
    color:red;
    }
    </style>
</head>
<body>
<div class="container">
      <div class="row">
        <div class="Absolute-Center is-Responsive">
                  
          <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-login-tab" data-toggle="tab" href="#nav-login" role="tab" aria-controls="nav-login" aria-selected="true">Login</a>
              <a class="nav-item nav-link" id="nav-signup-tab" data-toggle="tab" href="#nav-signup" role="tab" aria-controls="nav-signup" aria-selected="false">signup</a>
                        
            </div>
          </nav>
          <div class="tab-content" id="nav-tabContent">

            <div class="tab-pane fade show active" id="nav-login" role="tabpanel" aria-labelledby="nav-login-tab">

              <div class="col-sm-12 col-md-10 col-md-offset-1" id="login_form">
                <form:form action="login" method="post" modelAttribute="login"  id="loginForm">
                <%String message1=(String)request.getAttribute("message");
                %>
				   <div class="form-group ">
				   
				   <%
				   if(message1==null)
				   {
						message1="";
				   }
				   else if(message1.equals("error"))
				   { %>
				   <p name="message" id="error_message">invalid user_id or password</p>
				   
				   <% }else if(message1.equals("not_exist")){%>
				   <p name="message" id="error_message">User name doesn't exist</p>
				   <%} %>
				   
				   </div>
                  <div class="form-group ">
                                    
                    <input class="form-control" id="input1" type="text" name='username' placeholder="Roll_No"/>          
                  </div>

                  <div class="form-group">

                    <input class="form-control" id="input1" type="password" name='password' placeholder="Password"/>     
                  </div>
                                  
                  <div class="form-group">
                                  
                    <a> <input type="submit" id="input2" class="btn btn-def btn-block" value="login"></a>
                   </div>

               </form:form>        
            </div> 
          </div>

          
          <div class="tab-pane fade" id="nav-signup" role="tabpanel" aria-labelledby="nav-signup-tab">

                            
            <div class="col-sm-12 col-md-10 col-md-offset-1" id="signup_form">
                                
              <form:form action="signup" method="post" modelAttribute="signup"  id="signupForm" >
            
                <div class="form-group ">
                                    
                  <input class="form-control" id="input1" type="text" name='username1' placeholder="Roll_No"/>          
                 </div>

                                  
                 <div class="form-group">
                                    
                  <input class="form-control" id="input1" type="password" name='password1' placeholder="Create_Password"/>     
                </div>

                <div class="form-group">  
                                          
                  <input class="form-control" id="input1" type="password" name='password2' placeholder="Re_Type_Password"/>     
                </div>
				<div class="form-group" id="radio1">
				<input id="radio1" value="student" type="radio" name="roll1"/>Student
				<input id="radio1" value="staff" type="radio" name="roll1"/>Staff
				</div>
                <div class="form-group">
                                  
                  <a> <input class="btn btn-def btn-block" type="submit" id="input2" value="signup" /></a>
                </div>
                                  
              </form:form>        
            </div> 
          </div>
                      
        </div>  
      </div>    
    </div>
  </div>
</body>
</html>