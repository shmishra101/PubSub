<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login:MyManager</title>
    <style>
    .head{
    	text-align:center;
    	font-weight: bold;
    	font-family: Georgia, serif;
    }
    	
    	button{
    		width: 100%;
		}
		
		button:hover{
			opacity:0.8;
		}
		
		span.psw {
    		float:left;
    		padding-top: 15px;
		}
    
    	.container{
    		width:40%;
    	}
    	
  	.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}
  	.modal-content {
    background-color: #fefefe;
    margin: 2% auto 10% /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}
    	
    </style>
    <!-- Latest compiled and minified CSS-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
    <div class="container ">
    <br>
        <div class="jumbotron">
        	<h3 class="head"> Login </h3>
        	<br>
            <form id="inputForm" action="Login.jsp" method="post">
                <div class="form-group">
                	<label for="typeSelect">Select Type :</label>
    				<select name="select" class="form-control" id="typeSelect">
      					<option>Publisher</option>
      					<option>Subscriber</option>
    				</select>
                </div>
                <div class="form-group">
                    <label for="user">Username :</label>
                    <input class="form-control" id="user" name="user" type="text">
                </div>
                <div class="form-group">
                    <label for="pwd">Password :</label>
                    <input class="form-control" id="pwd" name="password" type="password">                	
                </div>
                <div>
                	<button class="btn btn-primary" type="submit">Login</button>
                </div>        
                <div>
                	<span class="psw" >Not a member? <a href="#" onclick="document.getElementById('id01').style.display='block'">Sign up here.</a></span>
                </div>
            	<br>
            	<br>      
            </form>
            	
        </div>
        
    </div>
    
    <div id="id01" class="modal">
    	<form class="modal-content animate" id="signupForm" action="SignUp.jsp" method="post">
    
    	<div class="container ">
    <br>
        <div class="jumbotron">
        	<h3 class="head"> Sign up </h3>
        	<br>
                <div class="form-group">
                	<label for="typeSelect">Select Type :</label>
    				<select name="select" class="form-control" id="typeSelect">
      					<option>Publisher</option>
      					<option>Subscriber</option>
    				</select>
                </div>
                <div class="form-group">
                    <label for="user">Username :</label>
                    <input class="form-control" name="user" id="user"  type="text" placeholder="Enter Username">
                </div>
                <div class="form-group">
                    <label for="user">Name :</label>
                    <input class="form-control" name="name" id="name" type="text" placeholder="Enter Name">
                </div>
                
                <div class="form-group">
                    <label for="pwd">Password :</label>
                    <input class="form-control" name="password" id="pwd" type="password"  placeholder="Enter Password">                	
                </div>
                <div class="form-group">
                    <label for="cnfmpwd">Confirm Password :</label>
                    <input class="form-control" id="cnfmpwd" type="password" placeholder="Confirm Password">                	
                </div>
                <div>
                	<button class="btn btn-primary" type="submit">Sign Up</button>
                </div>
            	<br>
            	<br>      
           
        </div>
        
    </div>
    
  </form>
    
    </div>
    <script>
    var modal = document.getElementById('id01');

 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function(event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }
    </script>
    
</body>

</html>