<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User disks page</title>
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
		<div class="page-header">
			<h2>
				<security:authorize access="isAuthenticated()">
					Authenticated as
					<security:authentication property="principal.username" />
				</security:authorize>
			</h2>
		</div>
		<nav>
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="home">Home</a></li>
				<li role="presentation" class="active"><a href="freeDisks">Free
						disks</a></li>
				<li role="presentation" class="active"><a href="takenUserDisks">Taken
						by current user</a></li>
				<li role="presentation" class="active"><a
					href="disksTakenFromUser">Taken from user</a></li>
			</ul>
		</nav>
		<br></br>
		<table border="1" class="table table-hover">
			<thead>
				<tr>
					<td>My disks</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listUserDisks}" var="disk">
					<tr>
						<td>${disk.title}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>