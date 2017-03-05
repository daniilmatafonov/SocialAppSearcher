<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Free disks</title>
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
			<h1>List of Free disks</h1>
		</div>
		<nav>
			<ul class="nav nav-pills">
				<li role="presentation" class="active"><a href="home">Home</a></li>
				<li role="presentation" class="active"><a href="userDisks">User
						disks</a></li>
				<li role="presentation" class="active"><a href="takenUserDisks">Taken
						user disks</a></li>
			</ul>
		</nav>
		<br></br>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td>Free albums</td>
					<td>Take Album</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listFreeDisks}" var="disk">
					<tr>
						<td>${disk.title}</td>
						<td>
						<c:url var="addTakenItem" value="/freeDisks/take"></c:url>
							<form:form action="${addTakenItem}" commandName="takenitem">
								<input type="submit" value="Take" /> <form:hidden path="takenItemId" /> 
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>