<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category Creation Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<form action="Categories/" method="post">

<label for="category_id">Category ID</label>
<input type="number" name="category_id" required>
<br>
<label for="category_name">Category Name</label>
<input type="text" name="category_name" required>
<br>

<button type="submit">Save</button>
</form>

</body>
</html>
