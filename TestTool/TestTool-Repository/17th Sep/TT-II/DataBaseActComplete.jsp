<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:form action="resultAction" namespace="/" method="POST">

		<s:url id="databaseList" action="databaseJSON" />

		<sx:autocompleter label="What's your favorite Database Server?"
			href="%{databaseList}" name="yourFavDatabase" />

		<s:submit value="submit" name="submit" />

	</s:form>

</body>
</html>