<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href='resources/css/globalalter.css' rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="loginLogoHeader.jsp"%>
	<div style="width: 100%; padding-left: 10%; padding-right: 10%;"
		class="container">
		<p class="text-center" style="font-size: 30px;">${challenge.title} </p>
		<p class="text-center" style="font-size: 25px;">${challenge.question}</p>
		<div style="float: right; width: 43%;">
			<h4 class="text-right">by ${challenge.hostUser} on
				${challenge.startTime}</h4>
		</div>
	</div>
	<br />

	<div style="padding-right: 15%; padding-left: 5%;">
		<form:form action="${pageContext.request.contextPath}/addAnswertoChallenge"
			method="POST" class="form-horizontal" role="form">
			
			<div class="form-group">

				<label class="col-sm-2 control-label" for="desc">Write your
					Answer</label>
				<div class="col-sm-10">
				<c:if test="${username == challenge.hostUser}">
					<textarea class="form-control" id="answer" name="answer" rows="4" readonly="readonly"></textarea>
				</c:if>
				<c:if test="${username != challenge.hostUser}">
					<textarea class="form-control" id="answer" name="answer" rows="4"></textarea>
				</c:if>
				</div>
				
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
				<input type='hidden' name='challengeId' value='${challenge.challengeID}'/>
				<c:if test="${username != challenge.hostUser}">
					<input class="btn btn-success" type="submit" value="Submit"
						id="submit">
						</c:if>
					<div style="float: right;">
					
						<label class="col-sm-3 control-label" for="points">Points</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" id="points" name="points"
								value="${challenge.points}" readonly="readonly" />
						</div>
						<!-- <label class="col-sm-2 control-label" for="points">Time Left</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" id="points" name="points"
								readonly="readonly" />
						</div> -->
					</div>
				</div>


			</div>

		</form:form>
	</div>


</body>
</html>