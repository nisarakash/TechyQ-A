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
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/LoginHeader.css' rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/globalalter.css"/>"
	rel="stylesheet" type="text/css">


</head>
<body>

	<%@ include file="loginLogoHeader.jsp"%>
	
	<!-- Section for search box  -->
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-md-12">
				<div class="input-group" id="adv-search">
					<input type="text" class="form-control" placeholder="Search for Challenge" />
					<div class="input-group-btn">
						<div class="btn-group" role="group">

							<button type="button" class="btn btn-primary">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 70%;">Question</th>
				<th style="width: 10%;">Posted By</th>
				<th style="width: 10%;">Created On</th>
				<th style="width: 10%;">Points</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${closeChallenge}" var="cc">
				<tr>
					<td><a href="answerChallenges?challengeID=${cc.challengeID}">${cc.title}</a></td>
					<td style="width: 10%;">${cc.hostUser}</td>
					<td style="width: 10%;">${cc.startTime}</td>
					<td style="width: 10%;">${cc.points}</td>
				</tr>
			</c:forEach>
		</tbody>
		</div>
		<div class="tab-pane fade" id="review"></div>
		<div class="tab-pane fade" id="close"></div>
		<div class="tab-pane fade" id="seminar">sfsdfsdf</div>

		</div>
</body>
</html>