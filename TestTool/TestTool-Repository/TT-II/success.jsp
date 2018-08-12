<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Struts 2 ModelDriven example</h1>
 
<h2>Customer Details</h2>
Name : <s:property value="name" /><br>
Age : <s:property value="age" /><br>
<h3>Welcome <i>${sessionScope.CustomerName.name}</i>, you have logged in successfully!</h3>
<h3>Welcome <i>${sessionScope.login_id}</i>, you have logged in successfully!</h3>

<a href="index.jsp">Index</a>
<a href="">Do auto complete</a>
</body>
</html>