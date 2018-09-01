<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="struts2, twitter, bootstrap, plugin, showcase" />
<meta name="description"
	content="Advanced Examples - A Showcase for the Struts2 Bootstrap Plugin" />
<title>Advanced Examples - Struts2 Bootstrap Plugin Showcase - <s:text
		name="showcase.version" /></title>

<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<sj:head jqueryui="false" />
<sb:head includeScripts="true" includeScriptsValidation="false" />
<style type="text/css">
body {
	padding-top: 60px;
	/* 60px to make the container go all the way to the bottom of the topbar */
}
</style>
</head>
</head>
<body>

	<s:form action="users" theme="bootstrap" cssClass="well form-vertical">

		<s:textfield name="name" label="User Name" />

		<s:textfield name="age" label="Age" />

		<s:radio name="sex" label="Sex" list="{'M','F'}" />

		<s:checkboxlist name="hobby" label="Hobby"
			list="{'Music','Art','Dance'}" />

		<s:select name="country" label="Country"
			list="{'Select','India','USA','France','Spain'}" />
		<s:submit />
	</s:form>

</body>
</html>