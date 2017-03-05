
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Given disks</title>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.2.3.js"></script>
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
			<h2>Disks taken from User</h2>
		</div>
		<nav>
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="home">Home</a></li>
				<li role="presentation" class="active"><a href="freeDisks">Free
						disks</a></li>
				<li role="presentation" class="active"><a href="userDisks">User
						disks</a></li>
			</ul>
		</nav>
		<table class="table table-hover">
			<thead>
				<tr>
					<td>Albums</td>
					<td>User Owner</td>
					<td>Current User</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="listGivenUserDisks" var="givenDisk">
					<tr>
						<td>${givenDisk}</td>
						<td>${givenDisk}</td>
						<td><security:authorize access="isAuthenticated()">
								<security:authentication property="principal.username" />
							</security:authorize></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>