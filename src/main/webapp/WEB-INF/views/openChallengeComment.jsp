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
<script src="resources/js/search.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-2.0.3.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.countdownTimer.js"></script>
<!-- <link rel="stylesheet" type="text/css"
	href="resources/css/jquery.countdownTimer.css" />
 -->
<script type="text/javascript">
	$(function() {
		$('#future_date')
				.countdowntimer(
						{
							dateAndTime : "2016/04/07 00:00:00",
							size : "lg",
							regexpMatchFormat : "([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})",
							regexpReplaceWith : "$2<sup class='displayformat'>hours</sup> $3<sup class='displayformat'>minutes</sup> $4<sup class='displayformat'>seconds</sup>"
						});
	});
</script>
<script type="text/javascript">
	function validate() {
		var comment = document["CommentForm"]["comment"].value;
		if (comment == null || comment == "") {
			alert("Please enter a Comment!");
			return false;
		}
	}
</script>

</head>
<body>

	<%@ include file="loginLogoHeader.jsp"%>
	<div style="width: 100%; padding-left: 10%; padding-right: 10%;"
		class="container">
		<p class="text-center" style="font-size: 30px;">${challenge.title}</p>
		<p class="text-center" style="font-size: 25px;">${challenge.question}</p>
		<div style="float: right; width: 43%;">
			<h4 class="text-right">by ${challenge.hostUser} on
				${challenge.startTime}</h4>
		</div>
	</div>
	<br />

	<div style="padding-right: 5%; padding-left: 5%;">
		<div style="float: left; width: 48%;">
			<label class="control-label" for="desc">Host Answer</label>
			<textarea class="form-control" id="answer" name="answer" rows="10"
				readonly="readonly">${challenge.hostAnswer}</textarea>
			<br />
			<!-- <div class="col-lg-7" style="float: right;">
				<button type="button" class="btn btn-success"
					onclick="incrCount(this)">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				</button>
			</div> -->

		</div>
		<div style="float: right; width: 48%;">
			<label class="control-label" for="desc">Opponent Answer</label>
			<textarea class="form-control" id="answer" name="answer" rows="10"
				readonly="readonly">${challenge.opponentAnswer}</textarea>
			<br />
			<!-- <div class="col-lg-7" style="float: right;">
				<button type="button" class="btn btn-success"
					onclick="incrCount(this)">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				</button>

			</div> -->

		</div>
	</div>
	<input type="hidden" id="challengeId" value="${challenge.challengeID }" />
	<div style="width: 100%; padding-left: 5%; padding-right: 5%;"
		class="container">
		<div class="col-lg-3" style="width: 38%;">
			<c:if test="${alreadyVoted == false }">
				<center>
					<button type="button" class="btn btn-success btn-lg"
						onclick="incrCount('host')">
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					</button>
				</center>
			</c:if>
		</div>
		<div class="col-lg-4 centered" style="width: 24%;">
			<center>
				<div class="form-group">
					<h4>
						Time Left:&nbsp;&nbsp;&nbsp;
						<div id="countdowntimer">
							<span id="future_date"><span>
						</div>
					</h4>
				</div>
			</center>

		</div>

		<div class="col-lg-3 centered" style="width: 38%;">
			<c:if test="${alreadyVoted == false }">
				<center>
					<button type="button" class="btn btn-success btn-lg"
						onclick="incrCount('opponent')">
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					</button>
				</center>
			</c:if>
		</div>

	</div>
	<br />
	<br />
	<div style="padding-right: 15%; padding-left: 5%;">
		<c:if test="${sessionScope.username != null }">
			<form action="${pageContext.request.contextPath}/addComment"
				method="POST" class="form-horizontal" name="CommentForm" onsubmit="return validate()">

				<div class="form-group">

					<label class="col-sm-2 control-label" for="desc">Write your
						Comment</label>
					<div class="col-sm-10">
						<textarea class="form-control" id="answer" name="comment" rows="4"></textarea>
					</div>
					<input type='hidden' name='challengeid'
						value='${challenge.challengeID}' />
				</div>
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input class="btn btn-success" type="submit" value="Submit"
							id="submit">
					</div>

				</div>

			</form>
		</c:if>

	</div>
	<div>
		<h2 class="col-sm-4" style="padding-left: 10%;">Comments</h2>
	</div>
	<div class="container" style="padding-left: 15%">
		<c:forEach items="${comments}" var="a">
			<br />
			<br />
			<blockquote class="blockquote-reverse">
				<p>${a.reviewerComment}</p>
				<footer>${a.reviewer}&nbsp;commented&nbsp;on&nbsp;${a.timeStamp}</footer>
			</blockquote>

		</c:forEach>
	</div>



</body>
</html>