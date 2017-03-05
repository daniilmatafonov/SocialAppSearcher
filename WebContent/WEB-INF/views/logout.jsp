<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout page</title>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.2.3.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div class="container">
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="login">Log In</a></li>
		</ul>
		<h2>
			<span class="label label-default">You are succesfully logout</span>
		</h2>
	</div>

</body>
</html>