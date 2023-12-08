<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
    <style type="text/css">body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #71b7e6, #9b59b6);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-container {
    text-align: center;
}

.login-box {
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    margin: auto;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
    margin-bottom: 5px;
    color: #333;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #3498db;
    color: #fff;
    padding: 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #2980b9;
}

.separator {
    margin: 15px 0;
    font-size: 16px;
    color: #888;
}

.social-button {
    display: block;
    background-color: #ecf0f1;
    color: #333;
    padding: 10px;
    margin-bottom: 10px;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.social-button:hover {
    background-color: #d2d7d3;
}

.signup-link {
    margin-top: 20px;
    color: #888;
}
    </style>
</head>


<body>

    <div class="login-container">
        <div class="login-box">
            <h1>Change Password</h1>
            <%
               	if(request.getAttribute("msg")!=null)
               	{
               		out.println(request.getAttribute("msg"));
               	}
               %>
            <form  method="post" action="StudentController">
            
            
                <label for="old_password">Old Password</label>
                <input type="password" id="old_password" name="old_password" required>

                <label for="new_password">New Password:</label>
                <input type="password" id="new_password" name="new_password" required>

				<label for="cnew_password">Confirm New Password:</label>
                <input type="password" id="cnew_password" name="cnew_password" required>

                <button type="submit" name="action" value="change password">change</button>
            </form>
            
            
        </div>
    </div>
</body>

</html>
