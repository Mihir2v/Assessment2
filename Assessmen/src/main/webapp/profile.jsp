<%@page import="com.bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

    
<div class="profile-container">
        <h1>Student Profile</h1>
        <%if(request.getAttribute("msg")!=null)
               {
            	   out.println(request.getAttribute("msg"));
               }
            	   
               %>
<form  method="post"action="StudentController">
            <div class="form-group">
            			<% Student s = (Student) session.getAttribute("s");%>
            
    <label for="fname">First Name:</label>
    <input type="text" value="<%=s.getFname() %>"  id="fname" name="fname" required>
</div>

            <div class="form-group">
                <label for="lname">Last Name:</label>
                <input type="text" value="<%=s.getLname() %>" id="lname" name="lastName" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" value="<%=s.getEmail() %>" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="tel" value="<%=s.getMobile() %>" id="mobile" name="mobile" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address"  name="address" required><%=s.getAddress() %></textarea>
            </div>

            <div class="form-group">
                <label for="gender">Gender:</label>
            

<%
if(s.getGender().equals("male"))
{
%>
<input type="radio" name="gender" value="male" checked="checked">Male
<input type="radio" name="gender" value="female">female
<%
}
else
{
%>
<input type="radio" name="gender" value="female" checked="checked">FeMale
<input type="radio" name="gender" value="male">Male
<%
}
%>

            </div>
            <div class="form-group">
                <button type="submit" name="action" value="update_Profile">Save Profile</button>
                  </div>
              			<p class="signup-link"  ><a href="cp.jsp" >change password</a></p>
                             			<p class="signup-link"  ><a href="logout.jsp" >logout</a></p>
               
                
                 
          
        </form>
        
</div>
</body>
</html>