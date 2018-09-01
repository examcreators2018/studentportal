<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:form action="fileUpload" method="post" enctype="multipart/form-data">
		<s:file name="toBeUploaded" label="Choose file to upload" />
		<s:submit value="Upload" align="center" />
	</s:form>
	Read more at
	http://www.java2blog.com/2012/07/file-upload-in-struts-2.html#6VugkkUpJhJEzqBh.99
</body>
</html>