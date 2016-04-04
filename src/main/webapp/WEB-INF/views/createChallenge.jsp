<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">

</head>
<body>
<header id="heading">
		<div class="container text-center">
			<h1>Techy Q&A</h1>
		</div>
	</header>
	
	<div id="create-challenge" align="center">
		<h2 align="center">Create New Challenge</h2>
		<strong><c:if test="${not empty emptyFields}">
				<div class="msg">${emptyFields}</div>
			</c:if></strong>
		<form name='ChallengeForm'
			action="${pageContext.servletContext.contextPath}/addChallenge"
			method='POST' >


			<div class="form-group">

				<label class="col-sm-2 control-label" for="title_id">Title</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="title" name="title" />
				</div>
			</div>
			<br>
			<div class="form-group">

				<label class="col-sm-2 control-label" for="ques">Question</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="ques" name="ques" rows="8"></textarea>
				</div>
			</div>
			<br>			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="ans">Answer</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="ans" name="ans" rows="8"></textarea>
				</div>
			</div>
			
			<br>
			<div class="form-group">

				<label class="col-sm-2 control-label" for="points">Points</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="points" name="points"/>
				</div>
			</div>
			<br >
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-success" type="submit" value="Submit"
						id="submit"> 
					<input class="btn btn-cancel" type="button"
						value="cancel" id="cancel" onclick="window.location.href='${pageContext.request.contextPath}/home'">
				</div>

			</div>
		</form>
	</div>
	
</body>
</html>