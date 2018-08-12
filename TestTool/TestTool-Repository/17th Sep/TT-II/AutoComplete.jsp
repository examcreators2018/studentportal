<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome to India</h2>
	<s:form>
		<s:url id="databaseList" action="test/autocomplete" />
		<sx:autocompleter size="1" name="state" list="listOfStates"
			showDownArrow="false" label="Choose state"></sx:autocompleter>

		<sx:autocompleter label="What's your favorite Database Server?"
			href="%{listOfStates}" name="yourFavDatabase" />

		<a href="test/databaseJSON">Do auto complete</a>
		<s:submit></s:submit>
	</s:form>

</body>
</html>