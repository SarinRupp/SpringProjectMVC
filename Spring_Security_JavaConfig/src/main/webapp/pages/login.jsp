<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Login</title>
</head>
<body>
<h1>Welcome to Custom Page Login </h1>

 
<form action="${pageContext.request.contextPath}/login" method='POST'>
<table>
	<tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
	<tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
	
	
</table>
<input  type="text" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="Submit"/>
</form>

</body>
</html>