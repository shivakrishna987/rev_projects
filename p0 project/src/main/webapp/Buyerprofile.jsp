<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.UserRegistrationResponse" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Profile</title>
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
        .profile-info {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .profile-info p {
            font-size: 1.2em;
            margin: 0;
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .profile-info label {
            font-weight: bold;
            color: #555;
        }
        .profile-info span {
            font-weight: normal;
            color: #666;
        }
        .profile-info p:hover {
            background-color: #e9ecef;
            cursor: pointer;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 2em;
            font-weight: 600;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">RevShop BuyerDashboard</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="BuyerDashboard.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a href="Product?action=Products" class="nav-link">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Buyerorders.jsp">Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Buyercart.jsp">Cart</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Buyerwishlist.jsp">Wishlist</a>
            </li>
            <li class="nav-item">
                <a href="Categories?action=Categories" class="nav-link">Categories</a>
            </li>
            <li class="nav-item">
                <!-- <a class="nav-link" href="Buyerprofile.jsp">Profile</a> -->
                <a class="nav-link" href="Profile?user_email=${sessionScope.user_email}">Profile</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="searchProducts" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Search for products" aria-label="Search" name="query">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">
    <h1>Buyer Profile</h1>
    <%
        UserRegistrationResponse user = (UserRegistrationResponse)request.getAttribute("user");
        if (user != null) {
    %>
        <div class="profile-info">
            <p><label>ID:</label> <span><%= user.getUser_id() %></span></p>
            <p><label>First Name:</label> <span><%= user.getUser_first_name() %></span></p>
            <p><label>Last Name:</label> <span><%= user.getUser_last_name() %></span></p>
            <p><label>Email:</label> <span><%= user.getUser_email() %></span></p>
            <p><label>Password:</label> <span><%= user.getUser_password() %></span></p>
            <p><label>Phone Number:</label> <span><%= user.getUser_phonenumber() %></span></p>
            <p><label>Address:</label> <span><%= user.getUser_address() %></span></p>
            <p><label>Role:</label> <span><%= user.getRole() %></span></p>
        </div>
    <% 
        } else { 
    %>
        <div class="alert alert-warning text-center" role="alert">
            No user information found.
        </div>
    <% 
        }
    %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
