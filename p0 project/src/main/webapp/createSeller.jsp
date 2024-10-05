<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Page</title>
<link href=”bootstrap/css/bootstrap.min.css” rel=”stylesheet” type=”text/css” />
<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
</head>
<body>
<form action="Seller/" method="post">

<label for="seller_name">Seller Name</label>
<input type="text" name="seller_name">
<br>
<label for="seller_email">Seller Email</label>
<input type="email" name="seller_email">
<br>
<label for="seller_password">Password</label>
<input type="password" name="seller_password">
<br>
<label for="seller_businessname">Business Name</label>
<input type="text" name="seller_businessName">
<br>
<label for="seller_businessdetails">Business Details</label>
<input type="text" name="seller_businessDetails">
<br>
<button type="submit">Save</button>
</form>
</body>
</html>