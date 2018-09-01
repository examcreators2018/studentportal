<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="struts2, twitter, bootstrap, plugin, showcase" />
<meta name="description"
	content="Advanced Examples - A Showcase for the Struts2 Bootstrap Plugin" />
<title>Insert title here</title>
</head>
<body>
	<s:if test='%{#session.CustomerName != null}'>
		<jsp:forward page="/success.jsp" />

	</s:if>
	<s:form action="customer" theme="bootstrap"
		cssClass="well form-vertical">
		<s:textfield name="name" label="Name" />
		<s:textfield name="age" label="Age" value="" />
		<s:submit />
		<a href="proflie">profile</a>
		<table>
			<tbody>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Cell No.</th>
					<th>Birthdate</th>
					<th>Homepage</th>
					<th>Delete</th>
				</tr>
				<tr>
					<td><s:property value="lastName"></s:property></td>
					<td><s:property value="emailId"></s:property></td>
					<td><s:property value="cellNo"></s:property></td>
					<td><s:property value="birthDate"></s:property></td>
				</tr>

			</tbody>
		</table>
	</s:form>
</body>
</html>