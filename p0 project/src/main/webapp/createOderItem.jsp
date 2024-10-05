<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Item Registration Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<form action="OrderItems/" method="post">

<label for="orderItemId">Order Item ID</label>
<input type="number" name="orderItemId" required>
<br>
<label for="order_id">Order ID</label>
<input type="number" name="order_id" required>
<br>
<label for="product_id">Product ID</label>
<input type="number" name="product_id" required>
<br>
<label for="quantity">Quantity</label>
<input type="number" name="quantity" required>
<br>
<label for="price">Price</label>
<input type="number" step="0.01" name="price" required>
<br>

<button type="submit" class="btn btn-primary">Save</button>
</form>

</body>
</html>
