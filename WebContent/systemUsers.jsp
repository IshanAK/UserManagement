<%@page import="shopping.service.*"%>
<%@page import="shopping.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping</title>
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="assetszz/js/jquery.okayNav.js"></script>

<link rel="stylesheet" type="text/css" href="assetsz/css/siteStyle.css">
</head>
<body style="background-image: url('image/admin.jpg'); width: 100%">

	<div class="site_navBar">
		<p onclick="window.location.href='logoutServlet'">Logout</p>
	</div>

	<div id="usersDiv">
		<div class="userBox">
			<h1>User Table</h1>
			<br>
			<div class="systemusers" style="margin-left: -130px">
				<table class="systemusersTable">
					<tr>
						<th class="tableTh">User ID</th>
						<th class="tableTh">First Name</th>
						<th class="tableTh">Last Name</th>
						<th class="tableTh">Email</th>
						<th class="tableTh">Phone</th>
						<th class="tableTh">Create User</th>
						<th class="tableTh">Create Seller</th>
						<th class="tableTh">Create Admin</th>
						<th class="tableTh">Remove User</th>
					</tr>
					<%
						registerService users = new registerService();
						ArrayList<User> arrayList = users.getUser((String) session.getAttribute("userEmail"));

						for (User user : arrayList) {

							String buyer = "", admin = "", seller = "";

							if (user.getAdmin().equals("0")) {
								buyer = "<img src='image/tick.png' width=50px>";
							} else {
								buyer = "<p id='" + user.getId() + "' style='cursor: pointer' onclick='clickUser(this);'><button type='button' style='color:green' >Change to User</button></p>";
							}

							if (user.getAdmin().equals("1")) {
								admin = "<img src='image/tick.png' width=50px>";
							} else {
								admin = "<p id='" + user.getId() + "' style='cursor: pointer' onclick='clickAdmin(this);'><button type='button' style='color:green' >Change to Admin</button></p>";
							}

							if (user.getAdmin().equals("2")) {
								seller = "<img src='image/tick.png' width=50px>";
							} else {
								seller = "<p id='" + user.getId() + "' style='cursor: pointer' onclick='clickSeller(this);'><button type='button' style='color:green' >Change to Seller</button></p>";
							}
					%><tr>
						<td class="tableTh"><%=user.getId()%></td>
						<td class="tableTh"><%=user.getFname()%></td>
						<td class="tableTh"><%=user.getLname()%></td>
						<td class="tableTh"><%=user.getEmail()%></td>
						<td class="tableTh"><%=user.getPhone()%></td>
						<td class="tableTh"><%=buyer%></td>
						<td class="tableTh"><%=seller%></td>
						<td class="tableTh"><%=admin%></td>
						<td class="tableTh"><p id="<%=user.getId()%>"
								style="cursor: pointer" onclick="clickDelete(this);"><button type="button" style="color:red" >Remove</i></button></p></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
<
<script>
	function clickUser(id) {

		var r = confirm("If you want this user type change to user ?");

		if (r == true) {

			var user = id.id;

			var jsonfile = JSON.stringify({
				"id" : user
			});

			var ans = $
					.ajax({
						type : 'POST',
						url : 'http://localhost:8080/OnlineShopping/rest/user/createUser',
						dataType : 'json',
						contentType : 'application/json',
						data : jsonfile
					});

			ans.done(function(data) {
				if (data['success'] == "1") {
					alert("Edit Successfull!");
					$('#usersDiv').empty();
					$("#usersDiv").load(location.href + " #usersDiv");
				} else if (data['success'] == "0") {
					alert("Edit Unuccessfull!");
				}
			});
			ans.fail(function(data) {
				alert("Connection Error !");
			});

		}

	}

	function clickAdmin(id) {

		var r = confirm("If you want this user type change to Admin ?");

		if (r == true) {

			var user = id.id;

			var jsonfile = JSON.stringify({
				"id" : user
			});

			var ans = $
					.ajax({
						type : 'POST',
						url : 'http://localhost:8080/OnlineShopping/rest/user/createAdmin',
						dataType : 'json',
						contentType : 'application/json',
						data : jsonfile
					});

			ans.done(function(data) {
				if (data['success'] == "1") {
					alert("Edit Successfull!");
					$('#usersDiv').empty();
					$("#usersDiv").load(location.href + " #usersDiv");
				} else if (data['success'] == "0") {
					alert("Edit Unuccessfull!");
				}
			});
			ans.fail(function(data) {
				alert("Connection Error !");
			});

		}

	}

	function clickSeller(id) {

		var r = confirm("If you want this user type change to Seller ?");

		if (r == true) {

			var user = id.id;

			var jsonfile = JSON.stringify({
				"id" : user
			});

			var ans = $
					.ajax({
						type : 'POST',
						url : 'http://localhost:8080/OnlineShopping/rest/user/createSeller',
						dataType : 'json',
						contentType : 'application/json',
						data : jsonfile
					});

			ans.done(function(data) {
				if (data['success'] == "1") {
					alert("Edit Successfull!");
					$('#usersDiv').empty();
					$("#usersDiv").load(location.href + " #usersDiv");
				} else if (data['success'] == "0") {
					alert("Edit Unuccessfull!");
				}
			});
			ans.fail(function(data) {
				alert("Connection Error !");
			});

		}

	}

	function clickDelete(id) {

		var r = confirm("If you want remove this user ?");

		if (r == true) {

			var user = id.id;

			var jsonfile = JSON.stringify({
				"id" : user
			});

			var ans = $
					.ajax({
						type : 'POST',
						url : 'http://localhost:8080/OnlineShopping/rest/user/removeUser',
						dataType : 'json',
						contentType : 'application/json',
						data : jsonfile
					});

			ans.done(function(data) {
				if (data['success'] == "1") {
					alert("Remove Successfull!");
					$('#usersDiv').empty();
					$("#usersDiv").load(location.href + " #usersDiv");
				} else if (data['success'] == "0") {
					alert("Remove Unuccessfull!");
				}
			});
			ans.fail(function(data) {
				alert("Connection Error !");
			});

		}

	}
</script>



