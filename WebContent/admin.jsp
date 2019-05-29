<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Panel</title>
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="assets/js/jquery.okayNav.js"></script>

    <link rel="stylesheet" type="text/css" href="assetsz/css/siteStyle.css">
</head>
<body style="background-image: url('image/admin.jpg');width: 100%">

    <div class="site_navBar">
        
        <p onclick="window.location.href='logoutServlet'" >Logout</p>
    </div>

    <div class="userProfileBox">
        <h1>Admin Profile</h1>
        <form action="systemUsersServlet">
        	<br><br>
            <input type="submit" value="User Management">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="Products Management">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="Catalog Management">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="Order Management">
        </form>
        <form action="">
        	<br>
            <input type="submit" value="Payment Management">
        </form>
    </div>

</body>
</html>