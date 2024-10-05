<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #2c2c2c; /* Dark background for the page */
            color: #ffffff; /* White text color */
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #444; /* Dark gray for the navbar */
        }
        .navbar-brand {
            color: #ffffff !important; /* White text color for the brand */
        }
        .navbar-nav .nav-link {
            color: #ffffff !important; /* White text color for navbar links */
        }
        .navbar-nav .nav-link:hover {
            color: #b3b3b3 !important; /* Light gray on hover */
        }
        .container {
            margin-top: 30px;
            padding: 30px;
            border-radius: 20px; /* Rounded corners for the container */
            background: #3a3a3a; /* Darker gray for the container */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Larger shadow for floating effect */
        }
        .form-group label {
            font-weight: bold;
            color: #ffffff; /* White text color for labels */
        }
        .btn-custom {
            background-color: #555; /* Dark gray for button */
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            color: #ffffff; /* White text color for button */
        }
        .btn-custom:hover {
            background-color: #666; /* Slightly lighter gray on hover */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">SellerDashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="SellerdashBoard.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a href="SellerProducts" class="nav-link">View Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addProduct.jsp">Add Product</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Sellerorders.jsp">Orders</a>
            </li>
            <li class="nav-item">
                <a href="SellerCategories?action=Categories" class="nav-link">Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Profile?user_email=${sessionScope.user_email}">Profile</a>                
            </li>
            <!-- <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
            </li> -->
        </ul>
        <form class="form-inline my-2 my-lg-0 ml-auto" action="Sellersearch.jsp" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Search Products" aria-label="Search" name="query">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">
    <h2 class="text-center">Add a New Product</h2>
    <form action="Product" method="post">
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
        </div>
        <div class="form-group">
            <label for="productPrice">Product Price:</label>
            <input type="text" class="form-control" id="productPrice" name="productPrice" required>
        </div>
        <div class="form-group">
            <label for="sellerId">Seller ID:</label>
            <input type="text" class="form-control" id="sellerId" name="sellerId" required>
        </div>
        
        <div class="form-group">
            <label for="categoryId">Category ID:</label>
            <input type="text" class="form-control" id="categoryId" name="categoryId" required>
        </div>
        <button type="submit" class="btn btn-custom btn-block">Add Product</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
