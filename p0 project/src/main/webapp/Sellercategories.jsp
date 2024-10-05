<%@page import="dto.CategoryResponse"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #81d4fa);
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #0288d1;
        }
        .navbar-brand {
            color: white !important;
        }
        .navbar-nav .nav-link {
            color: white !important;
        }
        .navbar-nav .nav-link:hover {
            color: #b3e5fc !important;
        }
        .container {
            margin-top: 30px;
            padding: 30px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #0288d1;
            color: white;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #0288d1;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
        }
        .btn-primary:hover {
            background-color: #01579b;
        }
        .btn-danger {
            border-radius: 20px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RevShop SellerDashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="SellerdashBoard.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a href="SellerProducts" class="nav-link">View Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Product?action=add">Add Product</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Sellerorders.jsp">Orders</a>
            </li>
            <li class="nav-item">
                <a href="Sellercategories.jsp" class="nav-link">Categories</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Profile?user_email=${sessionScope.user_email}">Profile</a>                
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="SellerCategories" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Search for categories" aria-label="Search" name="query">
            <input type="hidden" name="action" value="Categories">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">
    <h2 class="text-center">Categories</h2>
    <div class="row">
        <% 
            List<CategoryResponse> categories = (List<CategoryResponse>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) {
                for (CategoryResponse category : categories) {
        %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Category Name: <%= category.getCategoryName() %></h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text">Category ID: <%= category.getCategoryId() %></p>
                        <form action="deleteCategory" method="post">
                            <input type="hidden" name="categoryId" value="<%= category.getCategoryId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        <% 
                }
            } else {
        %>
            <div class="col-md-12">
                <div class="alert alert-warning text-center" role="alert">
                    No categories available at the moment.
                </div>
            </div>
        <% 
            }
        %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>