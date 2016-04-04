<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Challenges</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="resources/js/points.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/LoginHeader.css' rel="stylesheet"
	type="text/css">
<link href='resources/css/points.css' rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">


</head>
<body>

	<%@ include file="loginLogoHeader.jsp"%>

	<h2 align="center">Create New Challenge</h2>
	<strong><c:if test="${not empty emptyFields}">
			<div class="msg">${emptyFields}</div>
		</c:if></strong>
	<form name='ChallengeForm'
		action="${pageContext.servletContext.contextPath}/createChallenge"
		method='POST' class="form-horizontal" role="form"
		style="margin-left: 0px; margin-right: 0px;">

		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<label class="col-sm-2 control-label" for="title_id">Title</label>
			<div class="col-sm-9">
				<input class="form-control" type="text" id="title_id" name="title"
					placeholder="Enter Title" />

			</div>
		</div>
		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">

			<label class="col-sm-2 control-label" for="ques">Question</label>
			<div class="col-sm-9">
				<textarea class="form-control" id="ques" name="ques" rows="4"
					placeholder="Enter Question"></textarea>
			</div>
		</div>
		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<label class="col-sm-2 control-label" for="ans">Answer</label>
			<div class="col-sm-9">
				<textarea class="form-control" id="ans" name="ans" rows="8"
					placeholder="Enter Answer"></textarea>
			</div>
		</div>

		<br>
		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">

			<label class="col-sm-2 control-label" for="points">Points</label>
			<div class="col-md-2" style="padding-right: 80px;">
				<div class="input-group">
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger btn-number"
							data-type="minus" data-field="quant[2]">
							<span class="glyphicon glyphicon-minus"></span>
						</button>
					</span> <input type="text" name="quant[2]"
						class="form-control input-number" value="30" min="30" max="100"
						readonly="readonly" style="height: 27px;"> <span class="input-group-btn">
						<button type="button" class="btn btn-success btn-number"
							data-type="plus" data-field="quant[2]">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
		<br>

		<div class="form-group"
			style="margin-bottom: 0px; margin-left: 0px; margin-right: 0px;">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-success" type="submit" value="Submit"
					id="submit1"
					onclick="window.location.href='${pageContext.request.contextPath}/challenges'">
				<input class="btn btn-cancel" type="button" value="cancel"
					id="cancel"
					onclick="window.location.href='${pageContext.request.contextPath}/home'">
			</div>

		</div>
	</form>
</body>
</html>