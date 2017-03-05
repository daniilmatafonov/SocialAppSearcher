<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome page</title>
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
	<security:authorize access="isAuthenticated()">
					Authenticated as
					<security:authentication property="principal.username" />
		</security:authorize>
		<a href="<c:url value="logout" />">Logout</a>
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="#">Search in Facebook</a></li>
			<li role="presentation" class="active"><a href="#">Search in Twitter</a></li>
		</ul>
		<br></br>
		<div id="search">
		<h3 class="text-align-center">Find information about people in Social Networks</h3>
		<form id="searchForm" class="form-search">
		 <input type="text" class="form-control" name="search">	
		 <button name="submit" type="submit" class="btn btn-lg btn-primary btn-block">Find</button>
		</form>
		</div>
	</div>
</body>
</html>