<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
		<form id="loginForm">
			<div class="form-group">
				<label style="color:white">Email: </label>
				<input class="form-control" type="text" id="loginEmail" placeholder="Enter email here" required="required">
			</div>
			<div class="form-group">
				<label style="color:white">Password: </label>
				<input class="form-control" type="password" id="loginPassword" placeholder="******" required="required">
			</div>
			<input type="submit" class="btn btn-primary" value="Login">
		</form>
	</div>
	

</body>
</html>
<script>
	$(document).ready(function(){
		$("#loginForm").submit(function(e){
			
		   	var jsonfile = JSON.stringify({
				"email" : $('#loginEmail').val(),
				"password" : $('#loginPassword').val()
			});
			
			var ans = $.ajax({
				type : 'POST',
				url : 'http://localhost:8080/OnlineShopping/rest/user/login',
				dataType : 'json',
				contentType : 'application/json',
				data : jsonfile
			});
			
			ans.done(function(data){
				if(data['success']=="3"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "seller"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/sellerServlet";
			             }
			         });
				}else if(data['success']=="2"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "admin"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/adminServlet";
			             }
			         });
				}else if(data['success']=="1"){
					$.ajax({
			             url:'http://localhost:8080/OnlineShopping/loginServlet',
			             type:'POST',
			             data:{
			            	 "email" : $('#loginEmail').val(),
			            	 "user" : "user"
			             },
			             success : function(data){
			            	 window.location.href = "http://localhost:8080/OnlineShopping/userServlet";
			             }
			         });
				}else if(data['success']=="0"){
					alert("Your Password Or Email Is Wrong!");
				}
			});
			ans.fail(function(data){
				alert("Connection Error !");
			});
			
			e.preventDefault();
		});
	});
</script>