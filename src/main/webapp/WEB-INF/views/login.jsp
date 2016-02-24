<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="-1">
<title>Techy Q&A</title>

<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" />"></script>

<link
	href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/css/bootstrap-responsive.min.css" />"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value="//www.teamtreehouse.com/assets/favicon.ico" />"
	rel="shortcut icon">
<link
	href="<c:url value="//www.teamtreehouse.com/assets/favicon.ico" />"
	rel="icon">
<script type="text/javascript">
    history.pushState(null, null,window.location.href);
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, window.location.href);
    });
    document.addEventListener("contextmenu", function(e){
        e.preventDefault();
    }, false);
    </script>
</head>

<body>

	<header id="heading">
		<div class="container text-center">
			<h1>Techy Q&A</h1>
		</div>
	</header>

	<div id="login-box" align="center">
		<h2 align="center">LOGIN</h2>
		<strong><c:if test="${not empty emptyFields}">
				<div class="msg">${emptyFields}</div>
			</c:if> <c:if test="${not empty loggedIn}">
				<div class="msg">${loggedIn}</div>
			</c:if></strong>
		<form:form name='loginForm'
			action="${pageContext.servletContext.contextPath}/login"
			method='POST' autocomplete='none'>

			<table>
				<tr>
					<td>Username:</td>
					<td><input type='text' name='username'></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type='password' name='password' /></td>
				</tr>
				<tr>

					<td align="left"><a href="javascript:;"
						title="change captcha text" name="imgCaptcha"
						onclick="document.getElementById('captcha_id').src = '<%=request.getContextPath()%>/login?' + 'imgCaptcha';  return false">
					</a></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td></td>
					<td><input class="btn btn-primary" align="center"
						name="submit" type="submit" value="submit" /></td>
				</tr>
				<tr>
					<td></td>
					<td><a
						href="${pageContext.servletContext.contextPath}/forgotusername">Forgot
							username</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a
						href="${pageContext.servletContext.contextPath}/forgotpassword">Forgot
							password</a></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form:form>
	</div>
</body>
</html>
</html>
<%
	request.getSession().setAttribute("isUserLoggedIn", "Not Set");
	request.getSession().setAttribute("Username", "username");
	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader ("Expires", -1);
%>