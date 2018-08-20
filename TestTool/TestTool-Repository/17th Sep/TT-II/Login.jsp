<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="struts2, twitter, bootstrap, plugin, showcase" />
<meta name="description"
	content="Advanced Examples - A Showcase for the Struts2 Bootstrap Plugin" />
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<s:form action="test/login" theme="bootstrap"
				cssClass="well form-vertical">
				<label for="name">Please enter your name login page</label>
				<br />
				<input type="text" name="name" />
				<label for="name">Please enter your password login page</label>
				<br />
				<input type="text" name="password" />
				<input type="submit" value="inLog" />

				<s:textfield label="Name" name="usrname"
					helpText="This Textfield has an Help Text."
					tooltip="Enter your Name here" />

				<s:textfield label="Textfield with prepended text" inputPrepend="@"
					name="prepend" />

				<s:textfield label="Textfield with appended text" inputAppend="$"
					name="append" />

				<s:submit cssClass="btn btn-primary" />
				<s:submit cssClass="btn btn-danger" />


			</s:form>
		</div>
	</div>

</body>
</html>