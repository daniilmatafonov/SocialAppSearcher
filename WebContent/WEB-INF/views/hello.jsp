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
<script
	src="${pageContext.servletContext.contextPath}/resources/js/script.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
</head>
<body>
	<div class="container">
	<security:authorize access="isAuthenticated()">
					Authenticated as
					<security:authentication property="principal.username" />
		</security:authorize>
		<a href="<c:url value="logout" />">Logout</a>
		
		<br></br>
	
		<div id="search">
		<h3 class="text-align-center">Find information about people in Social Networks</h3>
		<form id="searchForm" class="form-search">
		 <div>
		 	Male <input type="radio" value="Male" name="m_gender" checked/>
		 	Female <input type="radio" value="Female" name="f_gender"/>
		 </div>
		 <br/>
		 Work information<textarea class="form-control" rows="5" cols="60" name="work"></textarea><br/>
		 Show other searching fields <input id="s_attrs" type="checkbox" name="show_items" onchange="showAdditionalFields()">
		
		 <div class="fields">
			 Political <textarea rows="5" name="political"></textarea> <br/>
			 About <textarea rows="5" name="about"></textarea> <br/>
			 Religion <textarea rows="5" name="religion"></textarea> <br/>
		 </div>
		 <button name="search" type="submit" class="btn btn-lg btn-primary btn-block">Search</button>
		</form>
		</div>
	</div>

</body>
</html>