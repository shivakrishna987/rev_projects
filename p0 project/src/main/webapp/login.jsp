<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg?w=740&t=st=1725349514~exp=1725350114~hmac=62a14c9d1ad82c28e30d06d6b419519b8ea2cc9400d5deb3797f84625d0f0fc1'); /* Background image */
            background-size: cover; /* Ensure the image covers the entire viewport */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Keep the background fixed during scrolling */
            margin: 0; /* Remove default margin */
            height: 100vh; /* Ensure the body takes up the full height of the viewport */
        }
        .container {
            padding: 20px;
            border-radius: 15px; /* Rounded corners for the container */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            margin-top: 5%; /* Adjust for better vertical alignment */
            background-color: rgba(255, 255, 255, 0.8); /* Slightly opaque white background for better text readability */
        }
        .card {
            border-radius: 15px; /* Rounded corners for the card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for a lifting effect */
        }
        .card-header {
            background-color: #0288d1; /* Darker sky blue for the header */
            color: white; /* White text color */
        }
        .btn-primary {
            background-color: #0288d1; /* Matching button color */
            border: none; /* Remove default border */
        }
        .btn-primary:hover {
            background-color: #01579b; /* Even darker sky blue on hover */
        }
        .page-header {
            text-align: center;
            margin-top: 20px;
            color: #0288d1; /* Darker sky blue color for the heading */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>Ecommerce</h1>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <!-- Check if there's an error message in the URL -->
                    <%
                        String errorMessage = request.getParameter("error");
                        if (errorMessage != null) {
                    %>
                        <div class="alert alert-danger">
                            <%= errorMessage %>
                        </div>
                    <% } %>
                    
                    <!-- Login Form -->
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="user_email">Email:</label>
                            <input type="email" class="form-control" id="user_email" name="user_email" required>
                        </div>
                        <div class="form-group">
                            <label for="user_password">Password:</label>
                            <input type="password" class="form-control" id="user_password" name="user_password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="register.jsp">Don't have an account? Register here</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
