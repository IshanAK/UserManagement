<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
	<script src="assetsz/js/bootstrap.min.js"></script>
    <script src="assetsz/js/croppie.js"></script>
    <link rel="stylesheet" href="assetsz/css/croppie.css" />

	<link href="assetsz/css/style.css" rel="stylesheet">
    <link href="assetsz/css/bootstrap.min.css" rel="stylesheet">
    <script src="assetsz/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body style="background-image: url('image/register.jpg');width: 100%">
<br><br><br><br><br><br>
	<div class="container">
		<form id="registerForm">
			<div class="form-group">
				<label style="color:white">First Name: </label>
				<input class="form-control" type="text" id="fname" placeholder="Enter first name here" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Last Name: </label>
				<input class="form-control" type="text" id="lname" placeholder="Enter last name here" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Phone Number: </label>
				<input class="form-control" type="tel" pattern="[0-9]{10}" id="phone" placeholder="Enter phone number here" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Email: </label>
				<input class="form-control" type="email" id="email" placeholder="Enter email here" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Password: </label>
				<input class="form-control" type="password" id="password1" placeholder="********" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Confirm Password: </label>
				<input class="form-control" type="password" id="password2" placeholder="********" required="required">
			</div>
			
			<input type="submit" class="btn btn-primary" value="Sign Up">
		</form>
	</div>

</body>
</html>
<script>
$(document).ready(function(){
		$("#registerForm").submit(function(e){
			
			var pass1 =document.getElementById("password1").value;
		    var pass2 =document.getElementById("password2").value;
			
		    if (pass1.length<6){
		    	alert("Your Password Must Contain At Least 6 Characters!");
		    }else if (pass1 != pass2){
		    	alert("Your Password & Confirm Password Are not Match!");
		        document.getElementById("password1").value = "";
		        document.getElementById("password2").value = "";
		    } else {
		    	
		    	var jsonfile = JSON.stringify({
					"fname" : $('#fname').val(),
					"lname" : $('#lname').val(),
					"email" : $('#email').val(),
					"phone" : $('#phone').val(),
					"pass1" : $('#password1').val()
				});
				
				var ans = $.ajax({
					type : 'POST',
					url : 'http://localhost:8080/OnlineShopping/rest/user/register',
					dataType : 'json',
					contentType : 'application/json',
					data : jsonfile
				});
				
				ans.done(function(data){
					if(data['success']=="1"){
						alert("Your Account Has Been Registered. You Can Login Now!");
						window.location.href = "http://localhost:8080/OnlineShopping/loginServlet";
					}else if(data['success']=="0"){
						alert("This Email is Already Exists!");
						$('#email').val("");
					}else if(data['success']=="2"){
						alert("This Phone is Already Exists!");
						$('#phone').val("");
					}
				});
				ans.fail(function(data){
					alert("Connection Error !");
				});
				
		    }
		   
			e.preventDefault();
		});
	});
</script>