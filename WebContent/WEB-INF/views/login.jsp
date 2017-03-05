<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html">
<title>Social Searcher</title>
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
		<div id="login-box" class="form-login">
			<h2 class="form-login-head text-align-center">Social Searcher</h2>
			<s:url var="login" value="/login"/>
			<sf:form name='loginForm' class="form-login form-control"
				action="${login}" method='POST'>
				Username: <input type='text' class="form-control" name='username'
					required autofocus> Password: <input type='password'
					name='password' class="form-control" />
				<button name="submit" type="submit"
					class="btn btn-lg btn-primary btn-block">Submit</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</sf:form>
		</div>
	</div>

</body>
</html>