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
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
<body>
	<%@ include file="loginLogoHeader.jsp"%>

	<div style="width: 100%; padding-left: 10%; padding-right: 10%;"
		class="container">
		<p class="text-center" style="font-size: 30px;">${question.qtitle}</p>
		<p class="text-center" style="font-size: 25px;">${question.qquestion}</p>
		<div>
			<c:if test="${question.userName == sessionScope.username}">
				<div class="text-right"
					style="float: left; width: 55%; margin-top: 10px; margin-bottom: 10px;">

					<button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal"
						onclick="addHit('${question.qid}')">Schedule a Meeting</button>

				</div>
			</c:if>
			<div style="float: right; width: 43%;">
				<h4 class="text-right">by ${question.userName} on
					${question.qtimestamp}</h4>

			</div>
		</div>
	</div>
	<br />
	<div style="padding-right: 15%; padding-left: 5%;">
		<c:if test="${sessionScope.username != null }">
			<form:form action="${pageContext.request.contextPath}/addAnswer"
				method="POST" class="form-horizontal" role="form">

				<div class="form-group">

					<label class="col-sm-2 control-label" for="desc">Write your
						Answer</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="answer" name="answer" rows="4"></textarea>
					</div>
					<input type='hidden' name='questionid' value='${question.qid}' />
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input class="btn btn-success" type="submit" value="Submit"
							id="submit">
					</div>

				</div>

			</form:form>
		</c:if>

	</div>
	<br />
	<div>
		<h2 class="col-sm-4" style="padding-left: 10%;">Other's Answers</h2>
	</div>
	<div class="container" style="padding-left: 15%">
		<c:forEach items="${answers}" var="a">
			<br />
			<br />
			<blockquote class="blockquote-reverse">
				<p>${a.answer}</p>
				<footer>${a.userName}&nbsp;commented&nbsp;on&nbsp;${a.timeStamp}</footer>
			</blockquote>

		</c:forEach>
	</div>
	<c:if test="${question.userName == sessionScope.username}">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Meeting Settings</h4>
					</div>

					<div class="modal-body" id="modal-body">
						<form action="${pageContext.request.contextPath}/setMeeting"
							method="POST" id="meeting-form">
							<div class="form-group">
								<label for="date">Date</label> <input name="date" type="date"
									class="form-control" id="date" id="datepicker">
							</div>
							<div class="form-group">
								<label for="time">Time</label> <input type="time"
									class="form-control" id="time" name="time"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label> Select upto seven Users to invite for meeting</label>
							</div>
							<!-- <button type="submit" class="btn btn-default">Submit</button> -->
						</form>

					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="modalCancel">Close</button>
						<button type="button" class="btn btn-success"
							onclick="document.getElementById('meeting-form').submit()">Set
							Meeting</button>

					</div>
				</div>

			</div>
		</div>
	</c:if>
	</div>

	<script type="text/javascript">
		function addHit(questionId) {
			$
					.ajax({
						type : "POST",
						url : "getUser",
						data : "qid=" + questionId,
						success : function(msg) {

							var username = msg.split(",");
							for (var i = 0; i < username.length; i++) {
								var userInfo = username[i].split(":");
								var form = document
										.getElementById("meeting-form");
								var div = document.createElement("div");
								div.className = "checkbox userCheckbox";
								div.innerHTML = "<label> <input type='checkbox' name='invitees' value='"+userInfo[1]+"''> "
										+ userInfo[0] + " </label>";
								form.appendChild(div);

							}

						}
					});
		}
	</script>
	<script>
		$("#modalCancel").click(function() {
			$(".userCheckbox").remove();
		});
	</script>
</body>
</html>