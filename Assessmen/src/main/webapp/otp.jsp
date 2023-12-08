<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .forgot-password-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="forgot-password-container">
    <h2>Verify OTP</h2>
    <p>Enter your OTP reset your password.</p>
    <%
    	if(request.getAttribute("msg")!=null)
    	{
    		out.println(request.getAttribute("msg"));
    	}
    %>
    <form id="forgotPasswordForm" action="StudentController" method="post">
    <input type="hidden" name="otp" value="<%=request.getAttribute("otp")%>">
    <input type="hidden" name="email" value="<%=request.getAttribute("email")%>">
	
        <label for="otp">OTP</label>
        <input type="text" id="otp" name="uotp" required>

        <button type="submit" name="action" value="verify OTP">Verify OTP</button>
    </form>
</div>

</body>
</html>
