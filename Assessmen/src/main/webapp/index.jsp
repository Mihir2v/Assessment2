<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #666;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
               	if(request.getAttribute("msg")!=null)
               	{
               		out.println(request.getAttribute("msg"));
               	}
               %>
    <form action="StudentController" method="post">
        <h2>Registration Form</h2>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="fname" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lname" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="mobile">Mobile:</label>
        <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>

		<label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

		
        <label>Gender:</label>
       <label for="male"> <input type="radio" id="male" name="gender" value="male" required>Male</label> 
        
       <label for="female"> <input type="radio" id="female" name="gender" value="female" required>Female</label>


        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="cpassword">Confirm Password:</label>
        <input type="password" id="cpassword" name="cpassword" required>

        <input type="submit" value="insert" name="action">
		<p class="signup-link">Already have an account? <a href="login.jsp">Login here</a></p>
        
    </form>

</body>
</html>
    