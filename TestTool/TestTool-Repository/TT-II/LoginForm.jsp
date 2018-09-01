<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Menu2.css">
</head>
<body>

	<s:form action="test/login" theme="bootstrap"
		cssClass="well form-vertical">

		<div id="loginModal" class="modal show" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-admin ">
				<div class="modal-content">
					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h1 class="text-center">PEdidos MICRObiología</h1>
					</div>
					<div class="modal-body">
						<form class="form col-md-12 center-block">
							<div class="form-group">
								<input class="form-control input-lg" placeholder="Email"
									type="text">
							</div>
							<div class="form-group">
								<input class="form-control input-lg" placeholder="Password"
									type="password">
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-lg btn-block">Sign
									In</button>
								<span class="pull-right"><a href="#">Register</a></span><span><a
									href="#">Need help?</a></span>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<div class="col-md-12">
							<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</s:form>
</body>
</html>