<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="freeDisks">Free
					disks</a></li>
			<li role="presentation" class="active"><a href="takenUserDisks">Taken
					by user</a></li>
			<li role="presentation" class="active"><a href="userDisks">User disks</a></li>
		</ul>
		<br></br>
		<security:authorize access="isAuthenticated()">
					Authenticated as
					<security:authentication property="principal.username" />
		</security:authorize>
		<a href="<c:url value="logout" />">Logout</a>

	</div>
</body>
</html>