<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/jquery.dataTables.css">
<link rel="stylesheet" href="../css/jquery.dataTables.min.css">
<link rel="stylesheet" href="../css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-theme.css">
<link rel="stylesheet" href="../css/Menu2.CSS">

<script type="text/javascript" charset="utf-8" src="../js/jquery.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../js/bootstrap.min.js"></script>
</head>
<body>
<s:actionerror theme="bootstrap"/>
<s:actionmessage theme="bootstrap"/>
<s:fielderror theme="bootstrap"/>
<s:form action="test/registeruser" enctype="multipart/form-data" id="rsgisterform"  labelCssClass="col-sm-2"
                    elementCssClass="col-sm-7" theme="bootstrap" cssClass="form-horizontal" label="Registration Form">
	<div class="col-sm-offset-1 col-md-9"> <!--  offset to give space  -->
	<s:textfield name="name" label="Name" requiredLabel="true"></s:textfield>
	<s:textfield name="userName" label="User Name" requiredLabel="true"> </s:textfield>
	<s:textfield name="email" label="Emails" requiredLabel="true"> </s:textfield>
	<s:password name="password" label="Passwords" requiredLabel="true"> </s:password>
	<s:textfield name="passwordHint" label="Password Hint" requiredLabel="false"> </s:textfield>
	<s:textfield name="passwordHintAns" label="Password Hint" requiredLabel="false"> </s:textfield>			
	
	<s:textfield name="add1" label="Address" requiredLabel="false"> </s:textfield>
    <s:textfield name="add2" label="Address2" requiredLabel="false"> </s:textfield>
    <s:textfield name="city" label="City" requiredLabel="false"> </s:textfield>	
	<s:textfield name="state" label="State" requiredLabel="false"> </s:textfield>	
    <s:textfield name="postalCode" label="Postal Code" requiredLabel="false"> </s:textfield>	
	<s:select           
	      label="Select Country"
	      list="allCountries"
	      name="country" 
	      headerKey="None"
	      headerValue="None"/>   <!--  headerkey and value may not needed -->	 
	 <sj:submit cssClass="col-sm-offset-8 btn btn-primary text-right" formIds="validationForm"  validate="true" validateFunction="bootstrapValidation"/>
	  </div>
	<!--  <div class="text-right"><button type="submit" class="ok  btn btn-primary">Save</button></div>  -->
  
</s:form>

</body>
</html>