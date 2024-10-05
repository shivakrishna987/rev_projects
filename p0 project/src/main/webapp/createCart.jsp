<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Creation Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<form action="Carts/" method="post">
<label for="user_id">User ID</label>
<input type="number" name="user_id" required>
<br>
<label for="product_id">Product ID</label>
<input type="number" name="product_id" required>
<br>
<label for="total_price">Total Price</label>
<input type="number" step="0.01" name="total_price" required>
<br>
<label for="quantity">Quantity</label>
<input type="number" name="quantity" required>
<br>
<label for="discount_coupon">Discount Coupon</label>
<input type="text" step="0.01" name="discount_coupon">
<br>


<button type="submit">Save</button>
</form>

</body>
</html>
