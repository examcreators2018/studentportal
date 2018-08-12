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
<link rel="stylesheet" href="Menu2.css">

<script type="text/javascript">
    $(document).ready(function(){
    	$('#myForm').validator()

    });
    </script>
</head>
<body>
	<div class="container">

		<div class="jumbotron"></div>

	</div>
	<div class="container">
		<div class="modal-dialog modal-admin ">
			<div class="modal-content">
				<div class="modal-body">

					<s:form id="myForm" action="test/login" theme="bootstrap"
						data-toggle="validator" cssClass="well form-vertical" role="form">
						<s:textfield label="UserName" name="name"
							tooltip="Enter user Name here" />
						<s:password label="Password" name="password"
							tooltip="Enter your Name here" />


						<s:submit cssClass="btn btn-primary" />
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>